import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_posts_record.g.dart';

abstract class UserPostsRecord
    implements Built<UserPostsRecord, UserPostsRecordBuilder> {
  static Serializer<UserPostsRecord> get serializer =>
      _$userPostsRecordSerializer;

  String? get postPhoto;

  String? get postTitle;

  String? get postDescription;

  DocumentReference? get postUser;

  DateTime? get timePosted;

  BuiltList<DocumentReference>? get likes;

  int? get numComments;

  DocumentReference? get dogProfile;

  bool? get postOwner;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserPostsRecordBuilder builder) => builder
    ..postPhoto = ''
    ..postTitle = ''
    ..postDescription = ''
    ..likes = ListBuilder()
    ..numComments = 0
    ..postOwner = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userPosts');

  static Stream<UserPostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserPostsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserPostsRecord._();
  factory UserPostsRecord([void Function(UserPostsRecordBuilder) updates]) =
      _$UserPostsRecord;

  static UserPostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserPostsRecordData({
  String? postPhoto,
  String? postTitle,
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numComments,
  DocumentReference? dogProfile,
  bool? postOwner,
}) {
  final firestoreData = serializers.toFirestore(
    UserPostsRecord.serializer,
    UserPostsRecord(
      (u) => u
        ..postPhoto = postPhoto
        ..postTitle = postTitle
        ..postDescription = postDescription
        ..postUser = postUser
        ..timePosted = timePosted
        ..likes = null
        ..numComments = numComments
        ..dogProfile = dogProfile
        ..postOwner = postOwner,
    ),
  );

  return firestoreData;
}
