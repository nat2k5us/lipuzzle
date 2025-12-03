// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'relationship.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Relationship _$RelationshipFromJson(Map<String, dynamic> json) {
  return _Relationship.fromJson(json);
}

/// @nodoc
mixin _$Relationship {
  String get id => throw _privateConstructorUsedError;
  String get treeId => throw _privateConstructorUsedError;
  RelationshipType get type =>
      throw _privateConstructorUsedError; // Person References
  String get person1Id => throw _privateConstructorUsedError;
  String get person2Id =>
      throw _privateConstructorUsedError; // Relationship Details
  DateTime? get startDate =>
      throw _privateConstructorUsedError; // Marriage date, adoption date, etc.
  DateTime? get endDate =>
      throw _privateConstructorUsedError; // Divorce date, death of spouse, etc.
  Place? get place => throw _privateConstructorUsedError;
  RelationshipStatus? get status =>
      throw _privateConstructorUsedError; // Additional Context
  String? get notes => throw _privateConstructorUsedError;
  Map<String, dynamic> get customFields =>
      throw _privateConstructorUsedError; // Audit
  String get createdBy => throw _privateConstructorUsedError;
  String get updatedBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this Relationship to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Relationship
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelationshipCopyWith<Relationship> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationshipCopyWith<$Res> {
  factory $RelationshipCopyWith(
          Relationship value, $Res Function(Relationship) then) =
      _$RelationshipCopyWithImpl<$Res, Relationship>;
  @useResult
  $Res call(
      {String id,
      String treeId,
      RelationshipType type,
      String person1Id,
      String person2Id,
      DateTime? startDate,
      DateTime? endDate,
      Place? place,
      RelationshipStatus? status,
      String? notes,
      Map<String, dynamic> customFields,
      String createdBy,
      String updatedBy,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  $PlaceCopyWith<$Res>? get place;
}

/// @nodoc
class _$RelationshipCopyWithImpl<$Res, $Val extends Relationship>
    implements $RelationshipCopyWith<$Res> {
  _$RelationshipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Relationship
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? treeId = null,
    Object? type = null,
    Object? person1Id = null,
    Object? person2Id = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? place = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? customFields = null,
    Object? createdBy = null,
    Object? updatedBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      treeId: null == treeId
          ? _value.treeId
          : treeId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RelationshipType,
      person1Id: null == person1Id
          ? _value.person1Id
          : person1Id // ignore: cast_nullable_to_non_nullable
              as String,
      person2Id: null == person2Id
          ? _value.person2Id
          : person2Id // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as Place?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RelationshipStatus?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      customFields: null == customFields
          ? _value.customFields
          : customFields // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of Relationship
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceCopyWith<$Res>? get place {
    if (_value.place == null) {
      return null;
    }

    return $PlaceCopyWith<$Res>(_value.place!, (value) {
      return _then(_value.copyWith(place: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RelationshipImplCopyWith<$Res>
    implements $RelationshipCopyWith<$Res> {
  factory _$$RelationshipImplCopyWith(
          _$RelationshipImpl value, $Res Function(_$RelationshipImpl) then) =
      __$$RelationshipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String treeId,
      RelationshipType type,
      String person1Id,
      String person2Id,
      DateTime? startDate,
      DateTime? endDate,
      Place? place,
      RelationshipStatus? status,
      String? notes,
      Map<String, dynamic> customFields,
      String createdBy,
      String updatedBy,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  @override
  $PlaceCopyWith<$Res>? get place;
}

/// @nodoc
class __$$RelationshipImplCopyWithImpl<$Res>
    extends _$RelationshipCopyWithImpl<$Res, _$RelationshipImpl>
    implements _$$RelationshipImplCopyWith<$Res> {
  __$$RelationshipImplCopyWithImpl(
      _$RelationshipImpl _value, $Res Function(_$RelationshipImpl) _then)
      : super(_value, _then);

  /// Create a copy of Relationship
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? treeId = null,
    Object? type = null,
    Object? person1Id = null,
    Object? person2Id = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? place = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? customFields = null,
    Object? createdBy = null,
    Object? updatedBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$RelationshipImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      treeId: null == treeId
          ? _value.treeId
          : treeId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RelationshipType,
      person1Id: null == person1Id
          ? _value.person1Id
          : person1Id // ignore: cast_nullable_to_non_nullable
              as String,
      person2Id: null == person2Id
          ? _value.person2Id
          : person2Id // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as Place?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RelationshipStatus?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      customFields: null == customFields
          ? _value._customFields
          : customFields // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RelationshipImpl implements _Relationship {
  const _$RelationshipImpl(
      {required this.id,
      required this.treeId,
      required this.type,
      required this.person1Id,
      required this.person2Id,
      this.startDate,
      this.endDate,
      this.place,
      this.status,
      this.notes,
      final Map<String, dynamic> customFields = const {},
      required this.createdBy,
      required this.updatedBy,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt})
      : _customFields = customFields;

  factory _$RelationshipImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelationshipImplFromJson(json);

  @override
  final String id;
  @override
  final String treeId;
  @override
  final RelationshipType type;
// Person References
  @override
  final String person1Id;
  @override
  final String person2Id;
// Relationship Details
  @override
  final DateTime? startDate;
// Marriage date, adoption date, etc.
  @override
  final DateTime? endDate;
// Divorce date, death of spouse, etc.
  @override
  final Place? place;
  @override
  final RelationshipStatus? status;
// Additional Context
  @override
  final String? notes;
  final Map<String, dynamic> _customFields;
  @override
  @JsonKey()
  Map<String, dynamic> get customFields {
    if (_customFields is EqualUnmodifiableMapView) return _customFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_customFields);
  }

// Audit
  @override
  final String createdBy;
  @override
  final String updatedBy;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'Relationship(id: $id, treeId: $treeId, type: $type, person1Id: $person1Id, person2Id: $person2Id, startDate: $startDate, endDate: $endDate, place: $place, status: $status, notes: $notes, customFields: $customFields, createdBy: $createdBy, updatedBy: $updatedBy, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelationshipImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.treeId, treeId) || other.treeId == treeId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.person1Id, person1Id) ||
                other.person1Id == person1Id) &&
            (identical(other.person2Id, person2Id) ||
                other.person2Id == person2Id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality()
                .equals(other._customFields, _customFields) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      treeId,
      type,
      person1Id,
      person2Id,
      startDate,
      endDate,
      place,
      status,
      notes,
      const DeepCollectionEquality().hash(_customFields),
      createdBy,
      updatedBy,
      createdAt,
      updatedAt,
      deletedAt);

  /// Create a copy of Relationship
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelationshipImplCopyWith<_$RelationshipImpl> get copyWith =>
      __$$RelationshipImplCopyWithImpl<_$RelationshipImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RelationshipImplToJson(
      this,
    );
  }
}

abstract class _Relationship implements Relationship {
  const factory _Relationship(
      {required final String id,
      required final String treeId,
      required final RelationshipType type,
      required final String person1Id,
      required final String person2Id,
      final DateTime? startDate,
      final DateTime? endDate,
      final Place? place,
      final RelationshipStatus? status,
      final String? notes,
      final Map<String, dynamic> customFields,
      required final String createdBy,
      required final String updatedBy,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final DateTime? deletedAt}) = _$RelationshipImpl;

  factory _Relationship.fromJson(Map<String, dynamic> json) =
      _$RelationshipImpl.fromJson;

  @override
  String get id;
  @override
  String get treeId;
  @override
  RelationshipType get type; // Person References
  @override
  String get person1Id;
  @override
  String get person2Id; // Relationship Details
  @override
  DateTime? get startDate; // Marriage date, adoption date, etc.
  @override
  DateTime? get endDate; // Divorce date, death of spouse, etc.
  @override
  Place? get place;
  @override
  RelationshipStatus? get status; // Additional Context
  @override
  String? get notes;
  @override
  Map<String, dynamic> get customFields; // Audit
  @override
  String get createdBy;
  @override
  String get updatedBy;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of Relationship
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelationshipImplCopyWith<_$RelationshipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
