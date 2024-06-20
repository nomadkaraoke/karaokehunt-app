import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KaraokeBrandsRecord extends FirestoreRecord {
  KaraokeBrandsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('karaoke_brands');

  static Stream<KaraokeBrandsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KaraokeBrandsRecord.fromSnapshot(s));

  static Future<KaraokeBrandsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KaraokeBrandsRecord.fromSnapshot(s));

  static KaraokeBrandsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KaraokeBrandsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KaraokeBrandsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KaraokeBrandsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KaraokeBrandsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KaraokeBrandsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKaraokeBrandsRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class KaraokeBrandsRecordDocumentEquality
    implements Equality<KaraokeBrandsRecord> {
  const KaraokeBrandsRecordDocumentEquality();

  @override
  bool equals(KaraokeBrandsRecord? e1, KaraokeBrandsRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(KaraokeBrandsRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is KaraokeBrandsRecord;
}
