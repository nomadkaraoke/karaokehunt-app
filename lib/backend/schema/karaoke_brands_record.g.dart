// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'karaoke_brands_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<KaraokeBrandsRecord> _$karaokeBrandsRecordSerializer =
    new _$KaraokeBrandsRecordSerializer();

class _$KaraokeBrandsRecordSerializer
    implements StructuredSerializer<KaraokeBrandsRecord> {
  @override
  final Iterable<Type> types = const [
    KaraokeBrandsRecord,
    _$KaraokeBrandsRecord
  ];
  @override
  final String wireName = 'KaraokeBrandsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, KaraokeBrandsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
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
  KaraokeBrandsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new KaraokeBrandsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
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

class _$KaraokeBrandsRecord extends KaraokeBrandsRecord {
  @override
  final String? name;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$KaraokeBrandsRecord(
          [void Function(KaraokeBrandsRecordBuilder)? updates]) =>
      (new KaraokeBrandsRecordBuilder()..update(updates))._build();

  _$KaraokeBrandsRecord._({this.name, this.ffRef}) : super._();

  @override
  KaraokeBrandsRecord rebuild(
          void Function(KaraokeBrandsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KaraokeBrandsRecordBuilder toBuilder() =>
      new KaraokeBrandsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KaraokeBrandsRecord &&
        name == other.name &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'KaraokeBrandsRecord')
          ..add('name', name)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class KaraokeBrandsRecordBuilder
    implements Builder<KaraokeBrandsRecord, KaraokeBrandsRecordBuilder> {
  _$KaraokeBrandsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  KaraokeBrandsRecordBuilder() {
    KaraokeBrandsRecord._initializeBuilder(this);
  }

  KaraokeBrandsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KaraokeBrandsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$KaraokeBrandsRecord;
  }

  @override
  void update(void Function(KaraokeBrandsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  KaraokeBrandsRecord build() => _build();

  _$KaraokeBrandsRecord _build() {
    final _$result =
        _$v ?? new _$KaraokeBrandsRecord._(name: name, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
