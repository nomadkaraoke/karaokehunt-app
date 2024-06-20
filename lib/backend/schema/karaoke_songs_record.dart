import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KaraokeSongsRecord extends FirestoreRecord {
  KaraokeSongsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "artist" field.
  String? _artist;
  String get artist => _artist ?? '';
  bool hasArtist() => _artist != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "youtube_link" field.
  String? _youtubeLink;
  String get youtubeLink => _youtubeLink ?? '';
  bool hasYoutubeLink() => _youtubeLink != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  bool hasBrand() => _brand != null;

  void _initializeFields() {
    _artist = snapshotData['artist'] as String?;
    _title = snapshotData['title'] as String?;
    _youtubeLink = snapshotData['youtube_link'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _brand = snapshotData['brand'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('karaoke_songs');

  static Stream<KaraokeSongsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KaraokeSongsRecord.fromSnapshot(s));

  static Future<KaraokeSongsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KaraokeSongsRecord.fromSnapshot(s));

  static KaraokeSongsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KaraokeSongsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KaraokeSongsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KaraokeSongsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KaraokeSongsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KaraokeSongsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKaraokeSongsRecordData({
  String? artist,
  String? title,
  String? youtubeLink,
  DateTime? createdAt,
  String? brand,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'artist': artist,
      'title': title,
      'youtube_link': youtubeLink,
      'created_at': createdAt,
      'brand': brand,
    }.withoutNulls,
  );

  return firestoreData;
}

class KaraokeSongsRecordDocumentEquality
    implements Equality<KaraokeSongsRecord> {
  const KaraokeSongsRecordDocumentEquality();

  @override
  bool equals(KaraokeSongsRecord? e1, KaraokeSongsRecord? e2) {
    return e1?.artist == e2?.artist &&
        e1?.title == e2?.title &&
        e1?.youtubeLink == e2?.youtubeLink &&
        e1?.createdAt == e2?.createdAt &&
        e1?.brand == e2?.brand;
  }

  @override
  int hash(KaraokeSongsRecord? e) => const ListEquality()
      .hash([e?.artist, e?.title, e?.youtubeLink, e?.createdAt, e?.brand]);

  @override
  bool isValidKey(Object? o) => o is KaraokeSongsRecord;
}
