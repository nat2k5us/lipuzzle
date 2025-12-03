// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Media _$MediaFromJson(Map<String, dynamic> json) {
  return _Media.fromJson(json);
}

/// @nodoc
mixin _$Media {
  String get id => throw _privateConstructorUsedError;
  String get treeId => throw _privateConstructorUsedError;
  String? get personId =>
      throw _privateConstructorUsedError; // References Person.id (nullable for tree-level media)
// File Information
  MediaType get type => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  int get fileSize => throw _privateConstructorUsedError; // bytes
  String get mimeType => throw _privateConstructorUsedError;
  String get storageKey =>
      throw _privateConstructorUsedError; // S3 key or storage path
  String get url => throw _privateConstructorUsedError; // CDN or storage URL
  String? get thumbnailUrl => throw _privateConstructorUsedError; // Metadata
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get dateTaken => throw _privateConstructorUsedError;
  Place? get location => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError; // Image-specific
  int? get width => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError; // Permissions
  PrivacyLevel get privacy =>
      throw _privateConstructorUsedError; // Face Recognition
  List<DetectedFace> get detectedFaces =>
      throw _privateConstructorUsedError; // Audit
  String get uploadedBy =>
      throw _privateConstructorUsedError; // References User.id
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this Media to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaCopyWith<Media> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCopyWith<$Res> {
  factory $MediaCopyWith(Media value, $Res Function(Media) then) =
      _$MediaCopyWithImpl<$Res, Media>;
  @useResult
  $Res call(
      {String id,
      String treeId,
      String? personId,
      MediaType type,
      String fileName,
      int fileSize,
      String mimeType,
      String storageKey,
      String url,
      String? thumbnailUrl,
      String? title,
      String? description,
      DateTime? dateTaken,
      Place? location,
      List<String> tags,
      int? width,
      int? height,
      PrivacyLevel privacy,
      List<DetectedFace> detectedFaces,
      String uploadedBy,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  $PlaceCopyWith<$Res>? get location;
}

/// @nodoc
class _$MediaCopyWithImpl<$Res, $Val extends Media>
    implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? treeId = null,
    Object? personId = freezed,
    Object? type = null,
    Object? fileName = null,
    Object? fileSize = null,
    Object? mimeType = null,
    Object? storageKey = null,
    Object? url = null,
    Object? thumbnailUrl = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? dateTaken = freezed,
    Object? location = freezed,
    Object? tags = null,
    Object? width = freezed,
    Object? height = freezed,
    Object? privacy = null,
    Object? detectedFaces = null,
    Object? uploadedBy = null,
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
      personId: freezed == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaType,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      storageKey: null == storageKey
          ? _value.storageKey
          : storageKey // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTaken: freezed == dateTaken
          ? _value.dateTaken
          : dateTaken // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Place?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      privacy: null == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as PrivacyLevel,
      detectedFaces: null == detectedFaces
          ? _value.detectedFaces
          : detectedFaces // ignore: cast_nullable_to_non_nullable
              as List<DetectedFace>,
      uploadedBy: null == uploadedBy
          ? _value.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $PlaceCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MediaImplCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$$MediaImplCopyWith(
          _$MediaImpl value, $Res Function(_$MediaImpl) then) =
      __$$MediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String treeId,
      String? personId,
      MediaType type,
      String fileName,
      int fileSize,
      String mimeType,
      String storageKey,
      String url,
      String? thumbnailUrl,
      String? title,
      String? description,
      DateTime? dateTaken,
      Place? location,
      List<String> tags,
      int? width,
      int? height,
      PrivacyLevel privacy,
      List<DetectedFace> detectedFaces,
      String uploadedBy,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  @override
  $PlaceCopyWith<$Res>? get location;
}

/// @nodoc
class __$$MediaImplCopyWithImpl<$Res>
    extends _$MediaCopyWithImpl<$Res, _$MediaImpl>
    implements _$$MediaImplCopyWith<$Res> {
  __$$MediaImplCopyWithImpl(
      _$MediaImpl _value, $Res Function(_$MediaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? treeId = null,
    Object? personId = freezed,
    Object? type = null,
    Object? fileName = null,
    Object? fileSize = null,
    Object? mimeType = null,
    Object? storageKey = null,
    Object? url = null,
    Object? thumbnailUrl = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? dateTaken = freezed,
    Object? location = freezed,
    Object? tags = null,
    Object? width = freezed,
    Object? height = freezed,
    Object? privacy = null,
    Object? detectedFaces = null,
    Object? uploadedBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$MediaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      treeId: null == treeId
          ? _value.treeId
          : treeId // ignore: cast_nullable_to_non_nullable
              as String,
      personId: freezed == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaType,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      storageKey: null == storageKey
          ? _value.storageKey
          : storageKey // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTaken: freezed == dateTaken
          ? _value.dateTaken
          : dateTaken // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Place?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      privacy: null == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as PrivacyLevel,
      detectedFaces: null == detectedFaces
          ? _value._detectedFaces
          : detectedFaces // ignore: cast_nullable_to_non_nullable
              as List<DetectedFace>,
      uploadedBy: null == uploadedBy
          ? _value.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
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
class _$MediaImpl implements _Media {
  const _$MediaImpl(
      {required this.id,
      required this.treeId,
      this.personId,
      required this.type,
      required this.fileName,
      required this.fileSize,
      required this.mimeType,
      required this.storageKey,
      required this.url,
      this.thumbnailUrl,
      this.title,
      this.description,
      this.dateTaken,
      this.location,
      final List<String> tags = const [],
      this.width,
      this.height,
      this.privacy = PrivacyLevel.family,
      final List<DetectedFace> detectedFaces = const [],
      required this.uploadedBy,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt})
      : _tags = tags,
        _detectedFaces = detectedFaces;

  factory _$MediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaImplFromJson(json);

  @override
  final String id;
  @override
  final String treeId;
  @override
  final String? personId;
// References Person.id (nullable for tree-level media)
// File Information
  @override
  final MediaType type;
  @override
  final String fileName;
  @override
  final int fileSize;
// bytes
  @override
  final String mimeType;
  @override
  final String storageKey;
// S3 key or storage path
  @override
  final String url;
// CDN or storage URL
  @override
  final String? thumbnailUrl;
// Metadata
  @override
  final String? title;
  @override
  final String? description;
  @override
  final DateTime? dateTaken;
  @override
  final Place? location;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

// Image-specific
  @override
  final int? width;
  @override
  final int? height;
// Permissions
  @override
  @JsonKey()
  final PrivacyLevel privacy;
// Face Recognition
  final List<DetectedFace> _detectedFaces;
// Face Recognition
  @override
  @JsonKey()
  List<DetectedFace> get detectedFaces {
    if (_detectedFaces is EqualUnmodifiableListView) return _detectedFaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detectedFaces);
  }

// Audit
  @override
  final String uploadedBy;
// References User.id
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'Media(id: $id, treeId: $treeId, personId: $personId, type: $type, fileName: $fileName, fileSize: $fileSize, mimeType: $mimeType, storageKey: $storageKey, url: $url, thumbnailUrl: $thumbnailUrl, title: $title, description: $description, dateTaken: $dateTaken, location: $location, tags: $tags, width: $width, height: $height, privacy: $privacy, detectedFaces: $detectedFaces, uploadedBy: $uploadedBy, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.treeId, treeId) || other.treeId == treeId) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.storageKey, storageKey) ||
                other.storageKey == storageKey) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dateTaken, dateTaken) ||
                other.dateTaken == dateTaken) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.privacy, privacy) || other.privacy == privacy) &&
            const DeepCollectionEquality()
                .equals(other._detectedFaces, _detectedFaces) &&
            (identical(other.uploadedBy, uploadedBy) ||
                other.uploadedBy == uploadedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        treeId,
        personId,
        type,
        fileName,
        fileSize,
        mimeType,
        storageKey,
        url,
        thumbnailUrl,
        title,
        description,
        dateTaken,
        location,
        const DeepCollectionEquality().hash(_tags),
        width,
        height,
        privacy,
        const DeepCollectionEquality().hash(_detectedFaces),
        uploadedBy,
        createdAt,
        updatedAt,
        deletedAt
      ]);

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaImplCopyWith<_$MediaImpl> get copyWith =>
      __$$MediaImplCopyWithImpl<_$MediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaImplToJson(
      this,
    );
  }
}

abstract class _Media implements Media {
  const factory _Media(
      {required final String id,
      required final String treeId,
      final String? personId,
      required final MediaType type,
      required final String fileName,
      required final int fileSize,
      required final String mimeType,
      required final String storageKey,
      required final String url,
      final String? thumbnailUrl,
      final String? title,
      final String? description,
      final DateTime? dateTaken,
      final Place? location,
      final List<String> tags,
      final int? width,
      final int? height,
      final PrivacyLevel privacy,
      final List<DetectedFace> detectedFaces,
      required final String uploadedBy,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final DateTime? deletedAt}) = _$MediaImpl;

  factory _Media.fromJson(Map<String, dynamic> json) = _$MediaImpl.fromJson;

  @override
  String get id;
  @override
  String get treeId;
  @override
  String? get personId; // References Person.id (nullable for tree-level media)
// File Information
  @override
  MediaType get type;
  @override
  String get fileName;
  @override
  int get fileSize; // bytes
  @override
  String get mimeType;
  @override
  String get storageKey; // S3 key or storage path
  @override
  String get url; // CDN or storage URL
  @override
  String? get thumbnailUrl; // Metadata
  @override
  String? get title;
  @override
  String? get description;
  @override
  DateTime? get dateTaken;
  @override
  Place? get location;
  @override
  List<String> get tags; // Image-specific
  @override
  int? get width;
  @override
  int? get height; // Permissions
  @override
  PrivacyLevel get privacy; // Face Recognition
  @override
  List<DetectedFace> get detectedFaces; // Audit
  @override
  String get uploadedBy; // References User.id
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of Media
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaImplCopyWith<_$MediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetectedFace _$DetectedFaceFromJson(Map<String, dynamic> json) {
  return _DetectedFace.fromJson(json);
}

/// @nodoc
mixin _$DetectedFace {
  String? get personId =>
      throw _privateConstructorUsedError; // References Person.id
  BoundingBox get boundingBox => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;

  /// Serializes this DetectedFace to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetectedFace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetectedFaceCopyWith<DetectedFace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectedFaceCopyWith<$Res> {
  factory $DetectedFaceCopyWith(
          DetectedFace value, $Res Function(DetectedFace) then) =
      _$DetectedFaceCopyWithImpl<$Res, DetectedFace>;
  @useResult
  $Res call({String? personId, BoundingBox boundingBox, double confidence});

  $BoundingBoxCopyWith<$Res> get boundingBox;
}

/// @nodoc
class _$DetectedFaceCopyWithImpl<$Res, $Val extends DetectedFace>
    implements $DetectedFaceCopyWith<$Res> {
  _$DetectedFaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetectedFace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personId = freezed,
    Object? boundingBox = null,
    Object? confidence = null,
  }) {
    return _then(_value.copyWith(
      personId: freezed == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as String?,
      boundingBox: null == boundingBox
          ? _value.boundingBox
          : boundingBox // ignore: cast_nullable_to_non_nullable
              as BoundingBox,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of DetectedFace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BoundingBoxCopyWith<$Res> get boundingBox {
    return $BoundingBoxCopyWith<$Res>(_value.boundingBox, (value) {
      return _then(_value.copyWith(boundingBox: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetectedFaceImplCopyWith<$Res>
    implements $DetectedFaceCopyWith<$Res> {
  factory _$$DetectedFaceImplCopyWith(
          _$DetectedFaceImpl value, $Res Function(_$DetectedFaceImpl) then) =
      __$$DetectedFaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? personId, BoundingBox boundingBox, double confidence});

  @override
  $BoundingBoxCopyWith<$Res> get boundingBox;
}

/// @nodoc
class __$$DetectedFaceImplCopyWithImpl<$Res>
    extends _$DetectedFaceCopyWithImpl<$Res, _$DetectedFaceImpl>
    implements _$$DetectedFaceImplCopyWith<$Res> {
  __$$DetectedFaceImplCopyWithImpl(
      _$DetectedFaceImpl _value, $Res Function(_$DetectedFaceImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetectedFace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personId = freezed,
    Object? boundingBox = null,
    Object? confidence = null,
  }) {
    return _then(_$DetectedFaceImpl(
      personId: freezed == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as String?,
      boundingBox: null == boundingBox
          ? _value.boundingBox
          : boundingBox // ignore: cast_nullable_to_non_nullable
              as BoundingBox,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetectedFaceImpl implements _DetectedFace {
  const _$DetectedFaceImpl(
      {this.personId, required this.boundingBox, required this.confidence});

  factory _$DetectedFaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetectedFaceImplFromJson(json);

  @override
  final String? personId;
// References Person.id
  @override
  final BoundingBox boundingBox;
  @override
  final double confidence;

  @override
  String toString() {
    return 'DetectedFace(personId: $personId, boundingBox: $boundingBox, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectedFaceImpl &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.boundingBox, boundingBox) ||
                other.boundingBox == boundingBox) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, personId, boundingBox, confidence);

  /// Create a copy of DetectedFace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectedFaceImplCopyWith<_$DetectedFaceImpl> get copyWith =>
      __$$DetectedFaceImplCopyWithImpl<_$DetectedFaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetectedFaceImplToJson(
      this,
    );
  }
}

abstract class _DetectedFace implements DetectedFace {
  const factory _DetectedFace(
      {final String? personId,
      required final BoundingBox boundingBox,
      required final double confidence}) = _$DetectedFaceImpl;

  factory _DetectedFace.fromJson(Map<String, dynamic> json) =
      _$DetectedFaceImpl.fromJson;

  @override
  String? get personId; // References Person.id
  @override
  BoundingBox get boundingBox;
  @override
  double get confidence;

  /// Create a copy of DetectedFace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetectedFaceImplCopyWith<_$DetectedFaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BoundingBox _$BoundingBoxFromJson(Map<String, dynamic> json) {
  return _BoundingBox.fromJson(json);
}

/// @nodoc
mixin _$BoundingBox {
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;

  /// Serializes this BoundingBox to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BoundingBox
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoundingBoxCopyWith<BoundingBox> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoundingBoxCopyWith<$Res> {
  factory $BoundingBoxCopyWith(
          BoundingBox value, $Res Function(BoundingBox) then) =
      _$BoundingBoxCopyWithImpl<$Res, BoundingBox>;
  @useResult
  $Res call({double x, double y, double width, double height});
}

/// @nodoc
class _$BoundingBoxCopyWithImpl<$Res, $Val extends BoundingBox>
    implements $BoundingBoxCopyWith<$Res> {
  _$BoundingBoxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BoundingBox
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoundingBoxImplCopyWith<$Res>
    implements $BoundingBoxCopyWith<$Res> {
  factory _$$BoundingBoxImplCopyWith(
          _$BoundingBoxImpl value, $Res Function(_$BoundingBoxImpl) then) =
      __$$BoundingBoxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double x, double y, double width, double height});
}

/// @nodoc
class __$$BoundingBoxImplCopyWithImpl<$Res>
    extends _$BoundingBoxCopyWithImpl<$Res, _$BoundingBoxImpl>
    implements _$$BoundingBoxImplCopyWith<$Res> {
  __$$BoundingBoxImplCopyWithImpl(
      _$BoundingBoxImpl _value, $Res Function(_$BoundingBoxImpl) _then)
      : super(_value, _then);

  /// Create a copy of BoundingBox
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_$BoundingBoxImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoundingBoxImpl implements _BoundingBox {
  const _$BoundingBoxImpl(
      {required this.x,
      required this.y,
      required this.width,
      required this.height});

  factory _$BoundingBoxImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoundingBoxImplFromJson(json);

  @override
  final double x;
  @override
  final double y;
  @override
  final double width;
  @override
  final double height;

  @override
  String toString() {
    return 'BoundingBox(x: $x, y: $y, width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoundingBoxImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, width, height);

  /// Create a copy of BoundingBox
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoundingBoxImplCopyWith<_$BoundingBoxImpl> get copyWith =>
      __$$BoundingBoxImplCopyWithImpl<_$BoundingBoxImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoundingBoxImplToJson(
      this,
    );
  }
}

abstract class _BoundingBox implements BoundingBox {
  const factory _BoundingBox(
      {required final double x,
      required final double y,
      required final double width,
      required final double height}) = _$BoundingBoxImpl;

  factory _BoundingBox.fromJson(Map<String, dynamic> json) =
      _$BoundingBoxImpl.fromJson;

  @override
  double get x;
  @override
  double get y;
  @override
  double get width;
  @override
  double get height;

  /// Create a copy of BoundingBox
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoundingBoxImplCopyWith<_$BoundingBoxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
