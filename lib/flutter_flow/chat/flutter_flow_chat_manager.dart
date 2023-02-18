import 'package:stream_transform/stream_transform.dart';

import 'index.dart';

const kMaxChatCacheSize = 5;

class FFChatInfo {
  const FFChatInfo(this.chatRecord, [this.groupMembers]);
  final ChatsRecord chatRecord;
  final List<UsersRecord>? groupMembers;

  UsersRecord get currentUser => groupMembers!
      .where((user) => user.reference == currentUserReference)
      .first;
  Map<String, UsersRecord> get otherUsers => Map.fromEntries(
        groupMembers!
            .where((user) => user.reference != currentUserReference)
            .map((user) => MapEntry(user.reference.id, user)),
      );
  List<UsersRecord> get otherUsersList => otherUsers.values.toList();
  bool get isGroupChat => otherUsers.length > 1;

  String chatPreviewTitle() {
    if (groupMembers == null) {
      return '';
    }
    final numOthers = chatRecord.users!.length - otherUsersList.length - 1;
    return otherUsersList.map((m) {
          if (m.displayName!.isNotEmpty) {
            return m.displayName;
          }
          return 'Friend';
        }).join(', ') +
        (numOthers > 0
            ? ' + $numOthers other]${numOthers > 1 ? 's' : ''}'
            : '');
  }

  String chatPreviewMessage() {
    final userSentLastMessage =
        chatRecord.lastMessageSentBy == currentUserReference;
    var lastChatText = chatRecord.lastMessage;
    if (userSentLastMessage && lastChatText!.isNotEmpty) {
      lastChatText = 'You: $lastChatText';
    }
    return lastChatText!;
  }

  String chatPreviewPic() {
    if (groupMembers == null || otherUsersList.length == 0) {
      return '';
    }
    final userSentLastMessage =
        chatRecord.lastMessageSentBy == currentUserReference;
    final chatUser = userSentLastMessage
        ? otherUsersList.first
        : otherUsersList.firstWhere(
            (m) => m.reference == chatRecord.lastMessageSentBy,
            orElse: () => otherUsersList.first,
          );
    return chatUser.photoUrl!;
  }
}

class FFChatManager {
  FFChatManager._();

  // Cache that will ensure chat queries are kept alive. By default we only keep
  // at most 5 chat streams in the cache.
  static Map<String, Stream<List<ChatMessagesRecord>>> _chatMessages = {};
  static Map<String, List<ChatMessagesRecord>> _chatMessagesCache = {};
  // Keep a map from user uid to the respective chat document reference.
  static Map<String, DocumentReference> _userChats = {};
  static DocumentReference? _currentUser;

  static FFChatManager? _instance;
  static FFChatManager get instance => _instance ??= FFChatManager._();

  Stream<List<ChatMessagesRecord>> getChatMessages(
      DocumentReference chatReference) {
    final chatId = chatReference.id;
    if (!_chatMessages.containsKey(chatId) &&
        _chatMessages.length >= kMaxChatCacheSize) {
      _chatMessages.remove(_chatMessages.keys.first);
      _chatMessagesCache.remove(_chatMessages.keys.first);
    }
    _chatMessages[chatId] ??= queryChatMessagesRecord(
      queryBuilder: (q) => q.where('chat', isEqualTo: chatReference).orderBy(
            'timestamp',
            descending: true,
          ),
      limit: 30,
    );
    return _chatMessages[chatId]!;
  }

  void setLatestMessages(
          DocumentReference chatReference, List<ChatMessagesRecord> messages) =>
      _chatMessagesCache[chatReference.id] = messages;

  List<ChatMessagesRecord> getLatestMessages(DocumentReference chatReference) =>
      _chatMessagesCache[chatReference.id] ?? [];

  DocumentReference getChatUserRef(ChatsRecord chat) {
    final userRef =
        chat.users!.firstWhere((d) => d.path != currentUserReference?.path);
    _userChats[userRef.id] = chat.reference;
    return userRef;
  }

  Stream<FFChatInfo> getChatInfo({
    UsersRecord? otherUserRecord,
    DocumentReference? chatReference,
    // This is only set from chat preview widget
    ChatsRecord? chatRecord,
  }) {
    assert(
      (otherUserRecord != null || chatReference != null) ^ (chatRecord != null),
      'Must specify exactly one of other user record / chat reference '
      'or chat record.',
    );
    Stream<ChatsRecord> chatStream = chatRecord != null
        ? Stream.value(chatRecord)
        : Stream.value(chatReference)
            .asyncMap(
              (chatRef) async =>
                  chatRef ??
                  await _getChatReference(otherUserRecord!.reference),
            )
            .switchMap(ChatsRecord.getDocument);
    return chatStream.asyncMap((chat) async {
      var userRefs = chat.users!.toSet();
      if (chatRecord != null) {
        // If from chat preview widget, don't bother querying all chat users
        // as this could be computationally expensive. Instead, take at most
        // 5, including the user and the user who last sent a message.
        final userAndSender = {
          currentUserReference!,
          if (chat.lastMessageSentBy != null) chat.lastMessageSentBy!
        };
        userRefs = {
          ...userAndSender,
          // Take at most 3 more besides the user and last sender
          ...(userRefs.toSet()..removeAll(userAndSender)).take(3),
        };
      }
      final groupMembers = await Future.wait(
        userRefs.map((ref) => UsersRecord.getDocument(ref).first),
      );
      return FFChatInfo(chat, groupMembers);
    });
  }

  Future<DocumentReference> _getChatReference(
    DocumentReference otherUser,
  ) async {
    // Clear the cached user chats in the event of a new user login.
    if (_currentUser != currentUserReference) {
      _userChats.clear();
      _currentUser = currentUserReference;
    }

    var chatRef = _userChats[otherUser.id];
    if (chatRef != null) {
      return chatRef;
    }

    // Determine who is userA and userB deterministically by uid.
    final users = [otherUser, currentUserReference!];
    users.sort((a, b) => a.id.compareTo(b.id));

    var chat = await queryChatsRecord(
            queryBuilder: (q) => q
                .where('user_a', isEqualTo: users.first)
                .where('user_b', isEqualTo: users.last)
                .where('users', arrayContains: currentUserReference),
            singleRecord: true)
        .first;
    // If chat already exists, cache and return it.
    if (chat.isNotEmpty) {
      _userChats[otherUser.id] = chat.first.reference;
      return chat.first.reference;
    }
    // Otherwise, ensure that in the meantime (while checking existence) the
    // chat reference has not already been created by another call. In this
    // case, it's safer to wait a second to ensure the document was created.
    chatRef = _userChats[otherUser.id];
    if (chatRef != null) {
      await Future.delayed(Duration(seconds: 1));
      return chatRef;
    }
    // Finally, create and cache a chat between these two users.
    chatRef = ChatsRecord.collection.doc();
    _userChats[otherUser.id] = chatRef;
    await chatRef.set({
      ...createChatsRecordData(
        userA: users.first,
        userB: users.last,
      ),
      'users': users,
    });
    return chatRef;
  }

  Future<ChatsRecord?> createChat(List<DocumentReference> otherUsers) async {
    final users = {currentUserReference!, ...otherUsers};
    // Group needs to have at least 3 members.
    if (users.length < 3) {
      return null;
    }
    final chatRef = ChatsRecord.collection.doc();
    final chatData = {'users': users.toList()};
    await chatRef.set(chatData);
    return ChatsRecord.getDocumentFromData(chatData, chatRef);
  }

  Future<ChatsRecord?> addGroupMembers(
      ChatsRecord? chat, List<DocumentReference> users) async {
    if (chat == null) {
      return null;
    }
    final newUsers = {...chat.users!, ...users}.toList();
    // Cannot add users to a 1:1 chat.
    if (chat.userA != null || chat.userB != null || users.isEmpty) {
      return chat;
    }
    await chat.reference.update({'users': newUsers});
    return chat.rebuild((c) => c.users.replace(newUsers));
  }

  Future<ChatsRecord> removeGroupMembers(
      ChatsRecord chat, List<DocumentReference> users) async {
    final newUsers = (chat.users!.toSet()..removeAll(users)).toList();
    // Can't reduce group chat to fewer than 3 members.
    if (newUsers.length < 3) {
      return chat;
    }
    await chat.reference.update({'users': newUsers});
    return chat.rebuild((c) => c.users.replace(newUsers));
  }
}
