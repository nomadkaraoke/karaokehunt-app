// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FriendsRecord> _$friendsRecordSerializer =
    new _$FriendsRecordSerializer();

class _$FriendsRecordSerializer implements StructuredSerializer<FriendsRecord> {
  @override
  final Iterable<Type> types = const [FriendsRecord, _$FriendsRecord];
  @override
  final String wireName = 'FriendsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FriendsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.follower;
    if (value != null) {
      result
        ..add('follower')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.followee;
    if (value != null) {
      result
        ..add('followee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  FriendsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FriendsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'follower':
          result.follower = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'followee':
          result.followee = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$FriendsRecord extends FriendsRecord {
  @override
  final DocumentReference<Object?>? follower;
  @override
  final DocumentReference<Object?>? followee;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FriendsRecord([void Function(FriendsRecordBuilder)? updates]) =>
      (new FriendsRecordBuilder()..update(updates))._build();

  _$FriendsRecord._({this.follower, this.followee, this.ffRef}) : super._();

  @override
  FriendsRecord rebuild(void Function(FriendsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FriendsRecordBuilder toBuilder() => new FriendsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FriendsRecord &&
        follower == other.follower &&
        followee == other.followee &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, follower.hashCode), followee.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FriendsRecord')
          ..add('follower', follower)
          ..add('followee', followee)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FriendsRecordBuilder
    implements Builder<FriendsRecord, FriendsRecordBuilder> {
  _$FriendsRecord? _$v;

  DocumentReference<Object?>? _follower;
  DocumentReference<Object?>? get follower => _$this._follower;
  set follower(DocumentReference<Object?>? follower) =>
      _$this._follower = follower;

  DocumentReference<Object?>? _followee;
  DocumentReference<Object?>? get followee => _$this._followee;
  set followee(DocumentReference<Object?>? followee) =>
      _$this._followee = followee;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FriendsRecordBuilder() {
    FriendsRecord._initializeBuilder(this);
  }

  FriendsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _follower = $v.follower;
      _followee = $v.followee;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FriendsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FriendsRecord;
  }

  @override
  void update(void Function(FriendsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FriendsRecord build() => _build();

  _$FriendsRecord _build() {
    final _$result = _$v ??
        new _$FriendsRecord._(
            follower: follower, followee: followee, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
