import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'post_comments_record.g.dart';

abstract class PostCommentsRecord
    implements Built<PostCommentsRecord, PostCommentsRecordBuilder> {
  static Serializer<PostCommentsRecord> get serializer =>
      _$postCommentsRecordSerializer;

  DateTime? get timePosted;

  String? get comment;

  DocumentReference? get user;

  DocumentReference? get post;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PostCommentsRecordBuilder builder) =>
      builder..comment = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('postComments');

  static Stream<PostCommentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PostCommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PostCommentsRecord._();
  factory PostCommentsRecord(
          [void Function(PostCommentsRecordBuilder) updates]) =
      _$PostCommentsRecord;

  static PostCommentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPostCommentsRecordData({
  DateTime? timePosted,
  String? comment,
  DocumentReference? user,
  DocumentReference? post,
}) {
  final firestoreData = serializers.toFirestore(
    PostCommentsRecord.serializer,
    PostCommentsRecord(
      (p) => p
        ..timePosted = timePosted
        ..comment = comment
        ..user = user
        ..post = post,
    ),
  );

  return firestoreData;
}
