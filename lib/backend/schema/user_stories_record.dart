import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_stories_record.g.dart';

abstract class UserStoriesRecord
    implements Built<UserStoriesRecord, UserStoriesRecordBuilder> {
  static Serializer<UserStoriesRecord> get serializer =>
      _$userStoriesRecordSerializer;

  DocumentReference? get user;

  String? get storyVideo;

  String? get storyPhoto;

  String? get storyDescription;

  DateTime? get storyPostedAt;

  BuiltList<DocumentReference>? get likes;

  int? get numComments;

  bool? get isOwner;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserStoriesRecordBuilder builder) => builder
    ..storyVideo = ''
    ..storyPhoto = ''
    ..storyDescription = ''
    ..likes = ListBuilder()
    ..numComments = 0
    ..isOwner = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userStories');

  static Stream<UserStoriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserStoriesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserStoriesRecord._();
  factory UserStoriesRecord([void Function(UserStoriesRecordBuilder) updates]) =
      _$UserStoriesRecord;

  static UserStoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserStoriesRecordData({
  DocumentReference? user,
  String? storyVideo,
  String? storyPhoto,
  String? storyDescription,
  DateTime? storyPostedAt,
  int? numComments,
  bool? isOwner,
}) {
  final firestoreData = serializers.toFirestore(
    UserStoriesRecord.serializer,
    UserStoriesRecord(
      (u) => u
        ..user = user
        ..storyVideo = storyVideo
        ..storyPhoto = storyPhoto
        ..storyDescription = storyDescription
        ..storyPostedAt = storyPostedAt
        ..likes = null
        ..numComments = numComments
        ..isOwner = isOwner,
    ),
  );

  return firestoreData;
}
