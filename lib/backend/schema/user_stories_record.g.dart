// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stories_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserStoriesRecord> _$userStoriesRecordSerializer =
    new _$UserStoriesRecordSerializer();

class _$UserStoriesRecordSerializer
    implements StructuredSerializer<UserStoriesRecord> {
  @override
  final Iterable<Type> types = const [UserStoriesRecord, _$UserStoriesRecord];
  @override
  final String wireName = 'UserStoriesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStoriesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.storyVideo;
    if (value != null) {
      result
        ..add('storyVideo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.storyPhoto;
    if (value != null) {
      result
        ..add('storyPhoto')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.storyDescription;
    if (value != null) {
      result
        ..add('storyDescription')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.storyPostedAt;
    if (value != null) {
      result
        ..add('storyPostedAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.likes;
    if (value != null) {
      result
        ..add('likes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.numComments;
    if (value != null) {
      result
        ..add('numComments')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isOwner;
    if (value != null) {
      result
        ..add('isOwner')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  UserStoriesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserStoriesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'storyVideo':
          result.storyVideo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'storyPhoto':
          result.storyPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'storyDescription':
          result.storyDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'storyPostedAt':
          result.storyPostedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'likes':
          result.likes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'numComments':
          result.numComments = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'isOwner':
          result.isOwner = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$UserStoriesRecord extends UserStoriesRecord {
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? storyVideo;
  @override
  final String? storyPhoto;
  @override
  final String? storyDescription;
  @override
  final DateTime? storyPostedAt;
  @override
  final BuiltList<DocumentReference<Object?>>? likes;
  @override
  final int? numComments;
  @override
  final bool? isOwner;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserStoriesRecord(
          [void Function(UserStoriesRecordBuilder)? updates]) =>
      (new UserStoriesRecordBuilder()..update(updates))._build();

  _$UserStoriesRecord._(
      {this.user,
      this.storyVideo,
      this.storyPhoto,
      this.storyDescription,
      this.storyPostedAt,
      this.likes,
      this.numComments,
      this.isOwner,
      this.ffRef})
      : super._();

  @override
  UserStoriesRecord rebuild(void Function(UserStoriesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStoriesRecordBuilder toBuilder() =>
      new UserStoriesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStoriesRecord &&
        user == other.user &&
        storyVideo == other.storyVideo &&
        storyPhoto == other.storyPhoto &&
        storyDescription == other.storyDescription &&
        storyPostedAt == other.storyPostedAt &&
        likes == other.likes &&
        numComments == other.numComments &&
        isOwner == other.isOwner &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, user.hashCode), storyVideo.hashCode),
                                storyPhoto.hashCode),
                            storyDescription.hashCode),
                        storyPostedAt.hashCode),
                    likes.hashCode),
                numComments.hashCode),
            isOwner.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStoriesRecord')
          ..add('user', user)
          ..add('storyVideo', storyVideo)
          ..add('storyPhoto', storyPhoto)
          ..add('storyDescription', storyDescription)
          ..add('storyPostedAt', storyPostedAt)
          ..add('likes', likes)
          ..add('numComments', numComments)
          ..add('isOwner', isOwner)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserStoriesRecordBuilder
    implements Builder<UserStoriesRecord, UserStoriesRecordBuilder> {
  _$UserStoriesRecord? _$v;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _storyVideo;
  String? get storyVideo => _$this._storyVideo;
  set storyVideo(String? storyVideo) => _$this._storyVideo = storyVideo;

  String? _storyPhoto;
  String? get storyPhoto => _$this._storyPhoto;
  set storyPhoto(String? storyPhoto) => _$this._storyPhoto = storyPhoto;

  String? _storyDescription;
  String? get storyDescription => _$this._storyDescription;
  set storyDescription(String? storyDescription) =>
      _$this._storyDescription = storyDescription;

  DateTime? _storyPostedAt;
  DateTime? get storyPostedAt => _$this._storyPostedAt;
  set storyPostedAt(DateTime? storyPostedAt) =>
      _$this._storyPostedAt = storyPostedAt;

  ListBuilder<DocumentReference<Object?>>? _likes;
  ListBuilder<DocumentReference<Object?>> get likes =>
      _$this._likes ??= new ListBuilder<DocumentReference<Object?>>();
  set likes(ListBuilder<DocumentReference<Object?>>? likes) =>
      _$this._likes = likes;

  int? _numComments;
  int? get numComments => _$this._numComments;
  set numComments(int? numComments) => _$this._numComments = numComments;

  bool? _isOwner;
  bool? get isOwner => _$this._isOwner;
  set isOwner(bool? isOwner) => _$this._isOwner = isOwner;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserStoriesRecordBuilder() {
    UserStoriesRecord._initializeBuilder(this);
  }

  UserStoriesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _storyVideo = $v.storyVideo;
      _storyPhoto = $v.storyPhoto;
      _storyDescription = $v.storyDescription;
      _storyPostedAt = $v.storyPostedAt;
      _likes = $v.likes?.toBuilder();
      _numComments = $v.numComments;
      _isOwner = $v.isOwner;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStoriesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStoriesRecord;
  }

  @override
  void update(void Function(UserStoriesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStoriesRecord build() => _build();

  _$UserStoriesRecord _build() {
    _$UserStoriesRecord _$result;
    try {
      _$result = _$v ??
          new _$UserStoriesRecord._(
              user: user,
              storyVideo: storyVideo,
              storyPhoto: storyPhoto,
              storyDescription: storyDescription,
              storyPostedAt: storyPostedAt,
              likes: _likes?.build(),
              numComments: numComments,
              isOwner: isOwner,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'likes';
        _likes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserStoriesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
