// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'karaoke_songs_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<KaraokeSongsRecord> _$karaokeSongsRecordSerializer =
    new _$KaraokeSongsRecordSerializer();

class _$KaraokeSongsRecordSerializer
    implements StructuredSerializer<KaraokeSongsRecord> {
  @override
  final Iterable<Type> types = const [KaraokeSongsRecord, _$KaraokeSongsRecord];
  @override
  final String wireName = 'KaraokeSongsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, KaraokeSongsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.artist;
    if (value != null) {
      result
        ..add('artist')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.youtubeLink;
    if (value != null) {
      result
        ..add('youtube_link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.brand;
    if (value != null) {
      result
        ..add('brand')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  KaraokeSongsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new KaraokeSongsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'artist':
          result.artist = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'youtube_link':
          result.youtubeLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'brand':
          result.brand = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$KaraokeSongsRecord extends KaraokeSongsRecord {
  @override
  final String? artist;
  @override
  final String? title;
  @override
  final String? youtubeLink;
  @override
  final DateTime? createdAt;
  @override
  final String? brand;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$KaraokeSongsRecord(
          [void Function(KaraokeSongsRecordBuilder)? updates]) =>
      (new KaraokeSongsRecordBuilder()..update(updates))._build();

  _$KaraokeSongsRecord._(
      {this.artist,
      this.title,
      this.youtubeLink,
      this.createdAt,
      this.brand,
      this.ffRef})
      : super._();

  @override
  KaraokeSongsRecord rebuild(
          void Function(KaraokeSongsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KaraokeSongsRecordBuilder toBuilder() =>
      new KaraokeSongsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KaraokeSongsRecord &&
        artist == other.artist &&
        title == other.title &&
        youtubeLink == other.youtubeLink &&
        createdAt == other.createdAt &&
        brand == other.brand &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, artist.hashCode), title.hashCode),
                    youtubeLink.hashCode),
                createdAt.hashCode),
            brand.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'KaraokeSongsRecord')
          ..add('artist', artist)
          ..add('title', title)
          ..add('youtubeLink', youtubeLink)
          ..add('createdAt', createdAt)
          ..add('brand', brand)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class KaraokeSongsRecordBuilder
    implements Builder<KaraokeSongsRecord, KaraokeSongsRecordBuilder> {
  _$KaraokeSongsRecord? _$v;

  String? _artist;
  String? get artist => _$this._artist;
  set artist(String? artist) => _$this._artist = artist;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _youtubeLink;
  String? get youtubeLink => _$this._youtubeLink;
  set youtubeLink(String? youtubeLink) => _$this._youtubeLink = youtubeLink;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _brand;
  String? get brand => _$this._brand;
  set brand(String? brand) => _$this._brand = brand;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  KaraokeSongsRecordBuilder() {
    KaraokeSongsRecord._initializeBuilder(this);
  }

  KaraokeSongsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _artist = $v.artist;
      _title = $v.title;
      _youtubeLink = $v.youtubeLink;
      _createdAt = $v.createdAt;
      _brand = $v.brand;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KaraokeSongsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$KaraokeSongsRecord;
  }

  @override
  void update(void Function(KaraokeSongsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  KaraokeSongsRecord build() => _build();

  _$KaraokeSongsRecord _build() {
    final _$result = _$v ??
        new _$KaraokeSongsRecord._(
            artist: artist,
            title: title,
            youtubeLink: youtubeLink,
            createdAt: createdAt,
            brand: brand,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
