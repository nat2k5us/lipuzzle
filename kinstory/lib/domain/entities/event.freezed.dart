// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FamilyEvent _$FamilyEventFromJson(Map<String, dynamic> json) {
  return _FamilyEvent.fromJson(json);
}

/// @nodoc
mixin _$FamilyEvent {
  String get id => throw _privateConstructorUsedError;
  String get treeId => throw _privateConstructorUsedError;
  EventType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError; // Timing
  DateTime? get date => throw _privateConstructorUsedError;
  DateAccuracy get dateAccuracy => throw _privateConstructorUsedError;
  DateTime? get endDate =>
      throw _privateConstructorUsedError; // For events with duration
// Location
  Place? get place => throw _privateConstructorUsedError; // Participants
  String get primaryPersonId =>
      throw _privateConstructorUsedError; // References Person.id
  List<String> get otherPersonIds =>
      throw _privateConstructorUsedError; // References Person.id[]
// Supporting Information
  List<String> get mediaIds =>
      throw _privateConstructorUsedError; // References Media.id[]
  List<Source> get sources => throw _privateConstructorUsedError; // Audit
  String get createdBy => throw _privateConstructorUsedError;
  String get updatedBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this FamilyEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FamilyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FamilyEventCopyWith<FamilyEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FamilyEventCopyWith<$Res> {
  factory $FamilyEventCopyWith(
          FamilyEvent value, $Res Function(FamilyEvent) then) =
      _$FamilyEventCopyWithImpl<$Res, FamilyEvent>;
  @useResult
  $Res call(
      {String id,
      String treeId,
      EventType type,
      String title,
      String? description,
      DateTime? date,
      DateAccuracy dateAccuracy,
      DateTime? endDate,
      Place? place,
      String primaryPersonId,
      List<String> otherPersonIds,
      List<String> mediaIds,
      List<Source> sources,
      String createdBy,
      String updatedBy,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  $PlaceCopyWith<$Res>? get place;
}

/// @nodoc
class _$FamilyEventCopyWithImpl<$Res, $Val extends FamilyEvent>
    implements $FamilyEventCopyWith<$Res> {
  _$FamilyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FamilyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? treeId = null,
    Object? type = null,
    Object? title = null,
    Object? description = freezed,
    Object? date = freezed,
    Object? dateAccuracy = null,
    Object? endDate = freezed,
    Object? place = freezed,
    Object? primaryPersonId = null,
    Object? otherPersonIds = null,
    Object? mediaIds = null,
    Object? sources = null,
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
              as EventType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateAccuracy: null == dateAccuracy
          ? _value.dateAccuracy
          : dateAccuracy // ignore: cast_nullable_to_non_nullable
              as DateAccuracy,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as Place?,
      primaryPersonId: null == primaryPersonId
          ? _value.primaryPersonId
          : primaryPersonId // ignore: cast_nullable_to_non_nullable
              as String,
      otherPersonIds: null == otherPersonIds
          ? _value.otherPersonIds
          : otherPersonIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mediaIds: null == mediaIds
          ? _value.mediaIds
          : mediaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sources: null == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<Source>,
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

  /// Create a copy of FamilyEvent
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
abstract class _$$FamilyEventImplCopyWith<$Res>
    implements $FamilyEventCopyWith<$Res> {
  factory _$$FamilyEventImplCopyWith(
          _$FamilyEventImpl value, $Res Function(_$FamilyEventImpl) then) =
      __$$FamilyEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String treeId,
      EventType type,
      String title,
      String? description,
      DateTime? date,
      DateAccuracy dateAccuracy,
      DateTime? endDate,
      Place? place,
      String primaryPersonId,
      List<String> otherPersonIds,
      List<String> mediaIds,
      List<Source> sources,
      String createdBy,
      String updatedBy,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  @override
  $PlaceCopyWith<$Res>? get place;
}

/// @nodoc
class __$$FamilyEventImplCopyWithImpl<$Res>
    extends _$FamilyEventCopyWithImpl<$Res, _$FamilyEventImpl>
    implements _$$FamilyEventImplCopyWith<$Res> {
  __$$FamilyEventImplCopyWithImpl(
      _$FamilyEventImpl _value, $Res Function(_$FamilyEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of FamilyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? treeId = null,
    Object? type = null,
    Object? title = null,
    Object? description = freezed,
    Object? date = freezed,
    Object? dateAccuracy = null,
    Object? endDate = freezed,
    Object? place = freezed,
    Object? primaryPersonId = null,
    Object? otherPersonIds = null,
    Object? mediaIds = null,
    Object? sources = null,
    Object? createdBy = null,
    Object? updatedBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$FamilyEventImpl(
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
              as EventType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateAccuracy: null == dateAccuracy
          ? _value.dateAccuracy
          : dateAccuracy // ignore: cast_nullable_to_non_nullable
              as DateAccuracy,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as Place?,
      primaryPersonId: null == primaryPersonId
          ? _value.primaryPersonId
          : primaryPersonId // ignore: cast_nullable_to_non_nullable
              as String,
      otherPersonIds: null == otherPersonIds
          ? _value._otherPersonIds
          : otherPersonIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mediaIds: null == mediaIds
          ? _value._mediaIds
          : mediaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sources: null == sources
          ? _value._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<Source>,
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
class _$FamilyEventImpl implements _FamilyEvent {
  const _$FamilyEventImpl(
      {required this.id,
      required this.treeId,
      required this.type,
      required this.title,
      this.description,
      this.date,
      this.dateAccuracy = DateAccuracy.exact,
      this.endDate,
      this.place,
      required this.primaryPersonId,
      final List<String> otherPersonIds = const [],
      final List<String> mediaIds = const [],
      final List<Source> sources = const [],
      required this.createdBy,
      required this.updatedBy,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt})
      : _otherPersonIds = otherPersonIds,
        _mediaIds = mediaIds,
        _sources = sources;

  factory _$FamilyEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$FamilyEventImplFromJson(json);

  @override
  final String id;
  @override
  final String treeId;
  @override
  final EventType type;
  @override
  final String title;
  @override
  final String? description;
// Timing
  @override
  final DateTime? date;
  @override
  @JsonKey()
  final DateAccuracy dateAccuracy;
  @override
  final DateTime? endDate;
// For events with duration
// Location
  @override
  final Place? place;
// Participants
  @override
  final String primaryPersonId;
// References Person.id
  final List<String> _otherPersonIds;
// References Person.id
  @override
  @JsonKey()
  List<String> get otherPersonIds {
    if (_otherPersonIds is EqualUnmodifiableListView) return _otherPersonIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherPersonIds);
  }

// References Person.id[]
// Supporting Information
  final List<String> _mediaIds;
// References Person.id[]
// Supporting Information
  @override
  @JsonKey()
  List<String> get mediaIds {
    if (_mediaIds is EqualUnmodifiableListView) return _mediaIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaIds);
  }

// References Media.id[]
  final List<Source> _sources;
// References Media.id[]
  @override
  @JsonKey()
  List<Source> get sources {
    if (_sources is EqualUnmodifiableListView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sources);
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
    return 'FamilyEvent(id: $id, treeId: $treeId, type: $type, title: $title, description: $description, date: $date, dateAccuracy: $dateAccuracy, endDate: $endDate, place: $place, primaryPersonId: $primaryPersonId, otherPersonIds: $otherPersonIds, mediaIds: $mediaIds, sources: $sources, createdBy: $createdBy, updatedBy: $updatedBy, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FamilyEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.treeId, treeId) || other.treeId == treeId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dateAccuracy, dateAccuracy) ||
                other.dateAccuracy == dateAccuracy) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.primaryPersonId, primaryPersonId) ||
                other.primaryPersonId == primaryPersonId) &&
            const DeepCollectionEquality()
                .equals(other._otherPersonIds, _otherPersonIds) &&
            const DeepCollectionEquality().equals(other._mediaIds, _mediaIds) &&
            const DeepCollectionEquality().equals(other._sources, _sources) &&
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
      title,
      description,
      date,
      dateAccuracy,
      endDate,
      place,
      primaryPersonId,
      const DeepCollectionEquality().hash(_otherPersonIds),
      const DeepCollectionEquality().hash(_mediaIds),
      const DeepCollectionEquality().hash(_sources),
      createdBy,
      updatedBy,
      createdAt,
      updatedAt,
      deletedAt);

  /// Create a copy of FamilyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FamilyEventImplCopyWith<_$FamilyEventImpl> get copyWith =>
      __$$FamilyEventImplCopyWithImpl<_$FamilyEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FamilyEventImplToJson(
      this,
    );
  }
}

abstract class _FamilyEvent implements FamilyEvent {
  const factory _FamilyEvent(
      {required final String id,
      required final String treeId,
      required final EventType type,
      required final String title,
      final String? description,
      final DateTime? date,
      final DateAccuracy dateAccuracy,
      final DateTime? endDate,
      final Place? place,
      required final String primaryPersonId,
      final List<String> otherPersonIds,
      final List<String> mediaIds,
      final List<Source> sources,
      required final String createdBy,
      required final String updatedBy,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final DateTime? deletedAt}) = _$FamilyEventImpl;

  factory _FamilyEvent.fromJson(Map<String, dynamic> json) =
      _$FamilyEventImpl.fromJson;

  @override
  String get id;
  @override
  String get treeId;
  @override
  EventType get type;
  @override
  String get title;
  @override
  String? get description; // Timing
  @override
  DateTime? get date;
  @override
  DateAccuracy get dateAccuracy;
  @override
  DateTime? get endDate; // For events with duration
// Location
  @override
  Place? get place; // Participants
  @override
  String get primaryPersonId; // References Person.id
  @override
  List<String> get otherPersonIds; // References Person.id[]
// Supporting Information
  @override
  List<String> get mediaIds; // References Media.id[]
  @override
  List<Source> get sources; // Audit
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

  /// Create a copy of FamilyEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FamilyEventImplCopyWith<_$FamilyEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Source _$SourceFromJson(Map<String, dynamic> json) {
  return _Source.fromJson(json);
}

/// @nodoc
mixin _$Source {
  SourceType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get citation => throw _privateConstructorUsedError;
  int get reliability => throw _privateConstructorUsedError;

  /// Serializes this Source to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Source
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SourceCopyWith<Source> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceCopyWith<$Res> {
  factory $SourceCopyWith(Source value, $Res Function(Source) then) =
      _$SourceCopyWithImpl<$Res, Source>;
  @useResult
  $Res call(
      {SourceType type,
      String title,
      String? url,
      String? citation,
      int reliability});
}

/// @nodoc
class _$SourceCopyWithImpl<$Res, $Val extends Source>
    implements $SourceCopyWith<$Res> {
  _$SourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Source
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? url = freezed,
    Object? citation = freezed,
    Object? reliability = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SourceType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      citation: freezed == citation
          ? _value.citation
          : citation // ignore: cast_nullable_to_non_nullable
              as String?,
      reliability: null == reliability
          ? _value.reliability
          : reliability // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SourceImplCopyWith<$Res> implements $SourceCopyWith<$Res> {
  factory _$$SourceImplCopyWith(
          _$SourceImpl value, $Res Function(_$SourceImpl) then) =
      __$$SourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SourceType type,
      String title,
      String? url,
      String? citation,
      int reliability});
}

/// @nodoc
class __$$SourceImplCopyWithImpl<$Res>
    extends _$SourceCopyWithImpl<$Res, _$SourceImpl>
    implements _$$SourceImplCopyWith<$Res> {
  __$$SourceImplCopyWithImpl(
      _$SourceImpl _value, $Res Function(_$SourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Source
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? url = freezed,
    Object? citation = freezed,
    Object? reliability = null,
  }) {
    return _then(_$SourceImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SourceType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      citation: freezed == citation
          ? _value.citation
          : citation // ignore: cast_nullable_to_non_nullable
              as String?,
      reliability: null == reliability
          ? _value.reliability
          : reliability // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SourceImpl implements _Source {
  const _$SourceImpl(
      {required this.type,
      required this.title,
      this.url,
      this.citation,
      this.reliability = 3});

  factory _$SourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourceImplFromJson(json);

  @override
  final SourceType type;
  @override
  final String title;
  @override
  final String? url;
  @override
  final String? citation;
  @override
  @JsonKey()
  final int reliability;

  @override
  String toString() {
    return 'Source(type: $type, title: $title, url: $url, citation: $citation, reliability: $reliability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.citation, citation) ||
                other.citation == citation) &&
            (identical(other.reliability, reliability) ||
                other.reliability == reliability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, title, url, citation, reliability);

  /// Create a copy of Source
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceImplCopyWith<_$SourceImpl> get copyWith =>
      __$$SourceImplCopyWithImpl<_$SourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourceImplToJson(
      this,
    );
  }
}

abstract class _Source implements Source {
  const factory _Source(
      {required final SourceType type,
      required final String title,
      final String? url,
      final String? citation,
      final int reliability}) = _$SourceImpl;

  factory _Source.fromJson(Map<String, dynamic> json) = _$SourceImpl.fromJson;

  @override
  SourceType get type;
  @override
  String get title;
  @override
  String? get url;
  @override
  String? get citation;
  @override
  int get reliability;

  /// Create a copy of Source
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SourceImplCopyWith<_$SourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
