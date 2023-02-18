import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'story_comments_record.g.dart';

abstract class StoryCommentsRecord
    implements Built<StoryCommentsRecord, StoryCommentsRecordBuilder> {
  static Serializer<StoryCommentsRecord> get serializer =>
      _$storyCommentsRecordSerializer;

  DocumentReference? get storyAssociation;

  DocumentReference? get commentUser;

  String? get comment;

  DateTime? get timePosted;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StoryCommentsRecordBuilder builder) =>
      builder..comment = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('storyComments');

  static Stream<StoryCommentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StoryCommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StoryCommentsRecord._();
  factory StoryCommentsRecord(
          [void Function(StoryCommentsRecordBuilder) updates]) =
      _$StoryCommentsRecord;

  static StoryCommentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStoryCommentsRecordData({
  DocumentReference? storyAssociation,
  DocumentReference? commentUser,
  String? comment,
  DateTime? timePosted,
}) {
  final firestoreData = serializers.toFirestore(
    StoryCommentsRecord.serializer,
    StoryCommentsRecord(
      (s) => s
        ..storyAssociation = storyAssociation
        ..commentUser = commentUser
        ..comment = comment
        ..timePosted = timePosted,
    ),
  );

  return firestoreData;
}
