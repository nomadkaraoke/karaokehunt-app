import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'karaoke_songs_record.g.dart';

abstract class KaraokeSongsRecord
    implements Built<KaraokeSongsRecord, KaraokeSongsRecordBuilder> {
  static Serializer<KaraokeSongsRecord> get serializer =>
      _$karaokeSongsRecordSerializer;

  String? get artist;

  String? get title;

  @BuiltValueField(wireName: 'youtube_link')
  String? get youtubeLink;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  String? get brand;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(KaraokeSongsRecordBuilder builder) => builder
    ..artist = ''
    ..title = ''
    ..youtubeLink = ''
    ..brand = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('karaoke_songs');

  static Stream<KaraokeSongsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<KaraokeSongsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static KaraokeSongsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      KaraokeSongsRecord(
        (c) => c
          ..artist = snapshot.data['artist']
          ..title = snapshot.data['title']
          ..youtubeLink = snapshot.data['youtube_link']
          ..createdAt = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['created_at']))
          ..brand = snapshot.data['brand']
          ..ffRef = KaraokeSongsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<KaraokeSongsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'karaoke_songs',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  KaraokeSongsRecord._();
  factory KaraokeSongsRecord(
          [void Function(KaraokeSongsRecordBuilder) updates]) =
      _$KaraokeSongsRecord;

  static KaraokeSongsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createKaraokeSongsRecordData({
  String? artist,
  String? title,
  String? youtubeLink,
  DateTime? createdAt,
  String? brand,
}) {
  final firestoreData = serializers.toFirestore(
    KaraokeSongsRecord.serializer,
    KaraokeSongsRecord(
      (k) => k
        ..artist = artist
        ..title = title
        ..youtubeLink = youtubeLink
        ..createdAt = createdAt
        ..brand = brand,
    ),
  );

  return firestoreData;
}
