import 'package:built_value/standard_json_plugin.dart';
import 'package:from_css_color/from_css_color.dart';

import 'user_posts_record.dart';
import 'users_record.dart';
import 'post_comments_record.dart';
import 'user_stories_record.dart';
import 'story_comments_record.dart';
import 'dogs_record.dart';
import 'friends_record.dart';
import 'chats_record.dart';
import 'chat_messages_record.dart';

import 'index.dart';

export 'index.dart';

part 'serializers.g.dart';

const kDocumentReferenceField = 'Document__Reference__Field';

@SerializersFor(const [
  UserPostsRecord,
  UsersRecord,
  PostCommentsRecord,
  UserStoriesRecord,
  StoryCommentsRecord,
  DogsRecord,
  FriendsRecord,
  ChatsRecord,
  ChatMessagesRecord,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(DocumentReferenceSerializer())
      ..add(DateTimeSerializer())
      ..add(LatLngSerializer())
      ..add(FirestoreUtilDataSerializer())
      ..add(ColorSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();

extension SerializerExtensions on Serializers {
  Map<String, dynamic> toFirestore<T>(Serializer<T> serializer, T object) =>
      mapToFirestore(serializeWith(serializer, object) as Map<String, dynamic>);
}

class DocumentReferenceSerializer
    implements PrimitiveSerializer<DocumentReference> {
  final bool structured = false;
  @override
  final Iterable<Type> types = new BuiltList<Type>([DocumentReference]);
  @override
  final String wireName = 'DocumentReference';

  @override
  Object serialize(Serializers serializers, DocumentReference reference,
      {FullType specifiedType: FullType.unspecified}) {
    return reference;
  }

  @override
  DocumentReference deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType: FullType.unspecified}) =>
      serialized as DocumentReference;
}

class DateTimeSerializer implements PrimitiveSerializer<DateTime> {
  @override
  final Iterable<Type> types = new BuiltList<Type>([DateTime]);
  @override
  final String wireName = 'DateTime';

  @override
  Object serialize(Serializers serializers, DateTime dateTime,
      {FullType specifiedType: FullType.unspecified}) {
    return dateTime;
  }

  @override
  DateTime deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType: FullType.unspecified}) =>
      serialized as DateTime;
}

class LatLngSerializer implements PrimitiveSerializer<LatLng> {
  final bool structured = false;
  @override
  final Iterable<Type> types = new BuiltList<Type>([LatLng]);
  @override
  final String wireName = 'LatLng';

  @override
  Object serialize(Serializers serializers, LatLng location,
      {FullType specifiedType: FullType.unspecified}) {
    return location;
  }

  @override
  LatLng deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType: FullType.unspecified}) =>
      serialized as LatLng;
}

class FirestoreUtilData {
  const FirestoreUtilData({
    this.fieldValues = const {},
    this.clearUnsetFields = true,
    this.create = false,
    this.delete = false,
  });
  final Map<String, dynamic> fieldValues;
  final bool clearUnsetFields;
  final bool create;
  final bool delete;
  static String get name => 'firestoreUtilData';
}

class FirestoreUtilDataSerializer
    implements PrimitiveSerializer<FirestoreUtilData> {
  final bool structured = false;
  @override
  final Iterable<Type> types = new BuiltList<Type>([FirestoreUtilData]);
  @override
  final String wireName = 'FirestoreUtilData';

  @override
  Object serialize(Serializers serializers, FirestoreUtilData firestoreUtilData,
      {FullType specifiedType: FullType.unspecified}) {
    return firestoreUtilData;
  }

  @override
  FirestoreUtilData deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType: FullType.unspecified}) =>
      serialized as FirestoreUtilData;
}

class ColorSerializer implements PrimitiveSerializer<Color> {
  @override
  final Iterable<Type> types = new BuiltList<Type>([Color]);
  @override
  final String wireName = 'Color';

  @override
  Object serialize(Serializers serializers, Color color,
      {FullType specifiedType: FullType.unspecified}) {
    return color.toCssString();
  }

  @override
  Color deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType: FullType.unspecified}) =>
      fromCssColor(serialized as String);
}

Map<String, dynamic> serializedData(DocumentSnapshot doc) => {
      ...mapFromFirestore(doc.data() as Map<String, dynamic>),
      kDocumentReferenceField: doc.reference
    };

Map<String, dynamic> mapFromFirestore(Map<String, dynamic> data) =>
    mergeNestedFields(data)
        .where((k, _) => k != FirestoreUtilData.name)
        .map((key, value) {
      // Handle Timestamp
      if (value is Timestamp) {
        value = value.toDate();
      }
      // Handle list of Timestamp
      if (value is Iterable && value.isNotEmpty && value.first is Timestamp) {
        value = value.map((v) => (v as Timestamp).toDate()).toList();
      }
      // Handle GeoPoint
      if (value is GeoPoint) {
        value = value.toLatLng();
      }
      // Handle list of GeoPoint
      if (value is Iterable && value.isNotEmpty && value.first is GeoPoint) {
        value = value.map((v) => (v as GeoPoint).toLatLng()).toList();
      }
      // Handle nested data.
      if (value is Map) {
        value = mapFromFirestore(value as Map<String, dynamic>);
      }
      // Handle list of nested data.
      if (value is Iterable && value.isNotEmpty && value.first is Map) {
        value = value
            .map((v) => mapFromFirestore(v as Map<String, dynamic>))
            .toList();
      }
      return MapEntry(key, value);
    });

Map<String, dynamic> mapToFirestore(Map<String, dynamic> data) =>
    data.where((k, v) => k != FirestoreUtilData.name).map((key, value) {
      // Handle GeoPoint
      if (value is LatLng) {
        value = value.toGeoPoint();
      }
      // Handle list of GeoPoint
      if (value is Iterable && value.isNotEmpty && value.first is LatLng) {
        value = value.map((v) => (v as LatLng).toGeoPoint()).toList();
      }
      // Handle nested data.
      if (value is Map) {
        value = mapFromFirestore(value as Map<String, dynamic>);
      }
      // Handle list of nested data.
      if (value is Iterable && value.isNotEmpty && value.first is Map) {
        value = value
            .map((v) => mapFromFirestore(v as Map<String, dynamic>))
            .toList();
      }
      return MapEntry(key, value);
    });

extension GeoPointExtension on LatLng {
  GeoPoint toGeoPoint() => GeoPoint(latitude, longitude);
}

extension LatLngExtension on GeoPoint {
  LatLng toLatLng() => LatLng(latitude, longitude);
}

DocumentReference toRef(String ref) => FirebaseFirestore.instance.doc(ref);

T? safeGet<T>(T Function() func, [Function(dynamic)? reportError]) {
  try {
    return func();
  } catch (e) {
    reportError?.call(e);
  }
  return null;
}

Map<String, dynamic> mergeNestedFields(Map<String, dynamic> data) {
  final nestedData = data.where((k, _) => k.contains('.'));
  final fieldNames = nestedData.keys.map((k) => k.split('.').first).toSet();
  // Remove nested values (e.g. 'foo.bar') and merge them into a map.
  data.removeWhere((k, _) => k.contains('.'));
  fieldNames.forEach((name) {
    final mergedValues = mergeNestedFields(
      nestedData
          .where((k, _) => k.split('.').first == name)
          .map((k, v) => MapEntry(k.split('.').skip(1).join('.'), v)),
    );
    final existingValue = data[name];
    data[name] = {
      if (existingValue != null && existingValue is Map)
        ...existingValue as Map<String, dynamic>,
      ...mergedValues,
    };
  });
  // Merge any nested maps inside any of the fields as well.
  data.where((_, v) => v is Map).forEach((k, v) {
    data[k] = mergeNestedFields(v as Map<String, dynamic>);
  });

  return data;
}

extension _WhereMapExtension<K, V> on Map<K, V> {
  Map<K, V> where(bool Function(K, V) test) =>
      Map.fromEntries(entries.where((e) => test(e.key, e.value)));
}
