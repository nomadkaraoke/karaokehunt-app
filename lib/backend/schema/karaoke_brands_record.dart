import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'karaoke_brands_record.g.dart';

abstract class KaraokeBrandsRecord
    implements Built<KaraokeBrandsRecord, KaraokeBrandsRecordBuilder> {
  static Serializer<KaraokeBrandsRecord> get serializer =>
      _$karaokeBrandsRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(KaraokeBrandsRecordBuilder builder) =>
      builder..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('karaoke_brands');

  static Stream<KaraokeBrandsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<KaraokeBrandsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  KaraokeBrandsRecord._();
  factory KaraokeBrandsRecord(
          [void Function(KaraokeBrandsRecordBuilder) updates]) =
      _$KaraokeBrandsRecord;

  static KaraokeBrandsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createKaraokeBrandsRecordData({
  String? name,
}) {
  final firestoreData = serializers.toFirestore(
    KaraokeBrandsRecord.serializer,
    KaraokeBrandsRecord(
      (k) => k..name = name,
    ),
  );

  return firestoreData;
}
