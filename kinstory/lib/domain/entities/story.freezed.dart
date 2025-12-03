// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Story _$StoryFromJson(Map<String, dynamic> json) {
  return _Story.fromJson(json);
}

/// @nodoc
mixin _$Story {
  String get id => throw _privateConstructorUsedError;
  String get treeId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content =>
      throw _privateConstructorUsedError; // Rich text / Markdown
// Relations
  String get authorId =>
      throw _privateConstructorUsedError; // References User.id
  List<String> get relatedPersonIds =>
      throw _privateConstructorUsedError; // References Person.id[]
// Media
  String? get coverImageId =>
      throw _privateConstructorUsedError; // References Media.id
  List<String> get mediaIds =>
      throw _privateConstructorUsedError; // References Media.id[]
// Publishing
  StoryStatus get status => throw _privateConstructorUsedError;
  DateTime? get publishedAt => throw _privateConstructorUsedError;
  PrivacyLevel get privacy => throw _privateConstructorUsedError; // Engagement
  int get viewCount => throw _privateConstructorUsedError;
  int get likeCount =>
      throw _privateConstructorUsedError; // AI-generated metadata
  StoryMetadata? get metadata => throw _privateConstructorUsedError; // Audit
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this Story to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryCopyWith<Story> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryCopyWith<$Res> {
  factory $StoryCopyWith(Story value, $Res Function(Story) then) =
      _$StoryCopyWithImpl<$Res, Story>;
  @useResult
  $Res call(
      {String id,
      String treeId,
      String title,
      String content,
      String authorId,
      List<String> relatedPersonIds,
      String? coverImageId,
      List<String> mediaIds,
      StoryStatus status,
      DateTime? publishedAt,
      PrivacyLevel privacy,
      int viewCount,
      int likeCount,
      StoryMetadata? metadata,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  $StoryMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$StoryCopyWithImpl<$Res, $Val extends Story>
    implements $StoryCopyWith<$Res> {
  _$StoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? treeId = null,
    Object? title = null,
    Object? content = null,
    Object? authorId = null,
    Object? relatedPersonIds = null,
    Object? coverImageId = freezed,
    Object? mediaIds = null,
    Object? status = null,
    Object? publishedAt = freezed,
    Object? privacy = null,
    Object? viewCount = null,
    Object? likeCount = null,
    Object? metadata = freezed,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      relatedPersonIds: null == relatedPersonIds
          ? _value.relatedPersonIds
          : relatedPersonIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      coverImageId: freezed == coverImageId
          ? _value.coverImageId
          : coverImageId // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaIds: null == mediaIds
          ? _value.mediaIds
          : mediaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StoryStatus,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      privacy: null == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as PrivacyLevel,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as StoryMetadata?,
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

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StoryMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $StoryMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoryImplCopyWith<$Res> implements $StoryCopyWith<$Res> {
  factory _$$StoryImplCopyWith(
          _$StoryImpl value, $Res Function(_$StoryImpl) then) =
      __$$StoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String treeId,
      String title,
      String content,
      String authorId,
      List<String> relatedPersonIds,
      String? coverImageId,
      List<String> mediaIds,
      StoryStatus status,
      DateTime? publishedAt,
      PrivacyLevel privacy,
      int viewCount,
      int likeCount,
      StoryMetadata? metadata,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  @override
  $StoryMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$StoryImplCopyWithImpl<$Res>
    extends _$StoryCopyWithImpl<$Res, _$StoryImpl>
    implements _$$StoryImplCopyWith<$Res> {
  __$$StoryImplCopyWithImpl(
      _$StoryImpl _value, $Res Function(_$StoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? treeId = null,
    Object? title = null,
    Object? content = null,
    Object? authorId = null,
    Object? relatedPersonIds = null,
    Object? coverImageId = freezed,
    Object? mediaIds = null,
    Object? status = null,
    Object? publishedAt = freezed,
    Object? privacy = null,
    Object? viewCount = null,
    Object? likeCount = null,
    Object? metadata = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$StoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      treeId: null == treeId
          ? _value.treeId
          : treeId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      relatedPersonIds: null == relatedPersonIds
          ? _value._relatedPersonIds
          : relatedPersonIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      coverImageId: freezed == coverImageId
          ? _value.coverImageId
          : coverImageId // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaIds: null == mediaIds
          ? _value._mediaIds
          : mediaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StoryStatus,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      privacy: null == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as PrivacyLevel,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as StoryMetadata?,
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
class _$StoryImpl implements _Story {
  const _$StoryImpl(
      {required this.id,
      required this.treeId,
      required this.title,
      required this.content,
      required this.authorId,
      final List<String> relatedPersonIds = const [],
      this.coverImageId,
      final List<String> mediaIds = const [],
      this.status = StoryStatus.draft,
      this.publishedAt,
      this.privacy = PrivacyLevel.family,
      this.viewCount = 0,
      this.likeCount = 0,
      this.metadata,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt})
      : _relatedPersonIds = relatedPersonIds,
        _mediaIds = mediaIds;

  factory _$StoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryImplFromJson(json);

  @override
  final String id;
  @override
  final String treeId;
  @override
  final String title;
  @override
  final String content;
// Rich text / Markdown
// Relations
  @override
  final String authorId;
// References User.id
  final List<String> _relatedPersonIds;
// References User.id
  @override
  @JsonKey()
  List<String> get relatedPersonIds {
    if (_relatedPersonIds is EqualUnmodifiableListView)
      return _relatedPersonIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedPersonIds);
  }

// References Person.id[]
// Media
  @override
  final String? coverImageId;
// References Media.id
  final List<String> _mediaIds;
// References Media.id
  @override
  @JsonKey()
  List<String> get mediaIds {
    if (_mediaIds is EqualUnmodifiableListView) return _mediaIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaIds);
  }

// References Media.id[]
// Publishing
  @override
  @JsonKey()
  final StoryStatus status;
  @override
  final DateTime? publishedAt;
  @override
  @JsonKey()
  final PrivacyLevel privacy;
// Engagement
  @override
  @JsonKey()
  final int viewCount;
  @override
  @JsonKey()
  final int likeCount;
// AI-generated metadata
  @override
  final StoryMetadata? metadata;
// Audit
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'Story(id: $id, treeId: $treeId, title: $title, content: $content, authorId: $authorId, relatedPersonIds: $relatedPersonIds, coverImageId: $coverImageId, mediaIds: $mediaIds, status: $status, publishedAt: $publishedAt, privacy: $privacy, viewCount: $viewCount, likeCount: $likeCount, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.treeId, treeId) || other.treeId == treeId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            const DeepCollectionEquality()
                .equals(other._relatedPersonIds, _relatedPersonIds) &&
            (identical(other.coverImageId, coverImageId) ||
                other.coverImageId == coverImageId) &&
            const DeepCollectionEquality().equals(other._mediaIds, _mediaIds) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.privacy, privacy) || other.privacy == privacy) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
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
      title,
      content,
      authorId,
      const DeepCollectionEquality().hash(_relatedPersonIds),
      coverImageId,
      const DeepCollectionEquality().hash(_mediaIds),
      status,
      publishedAt,
      privacy,
      viewCount,
      likeCount,
      metadata,
      createdAt,
      updatedAt,
      deletedAt);

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryImplCopyWith<_$StoryImpl> get copyWith =>
      __$$StoryImplCopyWithImpl<_$StoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryImplToJson(
      this,
    );
  }
}

abstract class _Story implements Story {
  const factory _Story(
      {required final String id,
      required final String treeId,
      required final String title,
      required final String content,
      required final String authorId,
      final List<String> relatedPersonIds,
      final String? coverImageId,
      final List<String> mediaIds,
      final StoryStatus status,
      final DateTime? publishedAt,
      final PrivacyLevel privacy,
      final int viewCount,
      final int likeCount,
      final StoryMetadata? metadata,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final DateTime? deletedAt}) = _$StoryImpl;

  factory _Story.fromJson(Map<String, dynamic> json) = _$StoryImpl.fromJson;

  @override
  String get id;
  @override
  String get treeId;
  @override
  String get title;
  @override
  String get content; // Rich text / Markdown
// Relations
  @override
  String get authorId; // References User.id
  @override
  List<String> get relatedPersonIds; // References Person.id[]
// Media
  @override
  String? get coverImageId; // References Media.id
  @override
  List<String> get mediaIds; // References Media.id[]
// Publishing
  @override
  StoryStatus get status;
  @override
  DateTime? get publishedAt;
  @override
  PrivacyLevel get privacy; // Engagement
  @override
  int get viewCount;
  @override
  int get likeCount; // AI-generated metadata
  @override
  StoryMetadata? get metadata; // Audit
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryImplCopyWith<_$StoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoryMetadata _$StoryMetadataFromJson(Map<String, dynamic> json) {
  return _StoryMetadata.fromJson(json);
}

/// @nodoc
mixin _$StoryMetadata {
  bool get isAIGenerated => throw _privateConstructorUsedError;
  AIStorySource? get aiSource => throw _privateConstructorUsedError;
  String? get generationPrompt => throw _privateConstructorUsedError;
  double? get confidenceScore => throw _privateConstructorUsedError;
  List<String> get sourceFacts => throw _privateConstructorUsedError;
  List<String> get suggestedTags => throw _privateConstructorUsedError;
  Map<String, dynamic>? get aiMetrics => throw _privateConstructorUsedError;

  /// Serializes this StoryMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoryMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryMetadataCopyWith<StoryMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryMetadataCopyWith<$Res> {
  factory $StoryMetadataCopyWith(
          StoryMetadata value, $Res Function(StoryMetadata) then) =
      _$StoryMetadataCopyWithImpl<$Res, StoryMetadata>;
  @useResult
  $Res call(
      {bool isAIGenerated,
      AIStorySource? aiSource,
      String? generationPrompt,
      double? confidenceScore,
      List<String> sourceFacts,
      List<String> suggestedTags,
      Map<String, dynamic>? aiMetrics});

  $AIStorySourceCopyWith<$Res>? get aiSource;
}

/// @nodoc
class _$StoryMetadataCopyWithImpl<$Res, $Val extends StoryMetadata>
    implements $StoryMetadataCopyWith<$Res> {
  _$StoryMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAIGenerated = null,
    Object? aiSource = freezed,
    Object? generationPrompt = freezed,
    Object? confidenceScore = freezed,
    Object? sourceFacts = null,
    Object? suggestedTags = null,
    Object? aiMetrics = freezed,
  }) {
    return _then(_value.copyWith(
      isAIGenerated: null == isAIGenerated
          ? _value.isAIGenerated
          : isAIGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
      aiSource: freezed == aiSource
          ? _value.aiSource
          : aiSource // ignore: cast_nullable_to_non_nullable
              as AIStorySource?,
      generationPrompt: freezed == generationPrompt
          ? _value.generationPrompt
          : generationPrompt // ignore: cast_nullable_to_non_nullable
              as String?,
      confidenceScore: freezed == confidenceScore
          ? _value.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as double?,
      sourceFacts: null == sourceFacts
          ? _value.sourceFacts
          : sourceFacts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      suggestedTags: null == suggestedTags
          ? _value.suggestedTags
          : suggestedTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      aiMetrics: freezed == aiMetrics
          ? _value.aiMetrics
          : aiMetrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  /// Create a copy of StoryMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AIStorySourceCopyWith<$Res>? get aiSource {
    if (_value.aiSource == null) {
      return null;
    }

    return $AIStorySourceCopyWith<$Res>(_value.aiSource!, (value) {
      return _then(_value.copyWith(aiSource: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoryMetadataImplCopyWith<$Res>
    implements $StoryMetadataCopyWith<$Res> {
  factory _$$StoryMetadataImplCopyWith(
          _$StoryMetadataImpl value, $Res Function(_$StoryMetadataImpl) then) =
      __$$StoryMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isAIGenerated,
      AIStorySource? aiSource,
      String? generationPrompt,
      double? confidenceScore,
      List<String> sourceFacts,
      List<String> suggestedTags,
      Map<String, dynamic>? aiMetrics});

  @override
  $AIStorySourceCopyWith<$Res>? get aiSource;
}

/// @nodoc
class __$$StoryMetadataImplCopyWithImpl<$Res>
    extends _$StoryMetadataCopyWithImpl<$Res, _$StoryMetadataImpl>
    implements _$$StoryMetadataImplCopyWith<$Res> {
  __$$StoryMetadataImplCopyWithImpl(
      _$StoryMetadataImpl _value, $Res Function(_$StoryMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoryMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAIGenerated = null,
    Object? aiSource = freezed,
    Object? generationPrompt = freezed,
    Object? confidenceScore = freezed,
    Object? sourceFacts = null,
    Object? suggestedTags = null,
    Object? aiMetrics = freezed,
  }) {
    return _then(_$StoryMetadataImpl(
      isAIGenerated: null == isAIGenerated
          ? _value.isAIGenerated
          : isAIGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
      aiSource: freezed == aiSource
          ? _value.aiSource
          : aiSource // ignore: cast_nullable_to_non_nullable
              as AIStorySource?,
      generationPrompt: freezed == generationPrompt
          ? _value.generationPrompt
          : generationPrompt // ignore: cast_nullable_to_non_nullable
              as String?,
      confidenceScore: freezed == confidenceScore
          ? _value.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as double?,
      sourceFacts: null == sourceFacts
          ? _value._sourceFacts
          : sourceFacts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      suggestedTags: null == suggestedTags
          ? _value._suggestedTags
          : suggestedTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      aiMetrics: freezed == aiMetrics
          ? _value._aiMetrics
          : aiMetrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryMetadataImpl implements _StoryMetadata {
  const _$StoryMetadataImpl(
      {this.isAIGenerated = false,
      this.aiSource,
      this.generationPrompt,
      this.confidenceScore,
      final List<String> sourceFacts = const [],
      final List<String> suggestedTags = const [],
      final Map<String, dynamic>? aiMetrics})
      : _sourceFacts = sourceFacts,
        _suggestedTags = suggestedTags,
        _aiMetrics = aiMetrics;

  factory _$StoryMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryMetadataImplFromJson(json);

  @override
  @JsonKey()
  final bool isAIGenerated;
  @override
  final AIStorySource? aiSource;
  @override
  final String? generationPrompt;
  @override
  final double? confidenceScore;
  final List<String> _sourceFacts;
  @override
  @JsonKey()
  List<String> get sourceFacts {
    if (_sourceFacts is EqualUnmodifiableListView) return _sourceFacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sourceFacts);
  }

  final List<String> _suggestedTags;
  @override
  @JsonKey()
  List<String> get suggestedTags {
    if (_suggestedTags is EqualUnmodifiableListView) return _suggestedTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedTags);
  }

  final Map<String, dynamic>? _aiMetrics;
  @override
  Map<String, dynamic>? get aiMetrics {
    final value = _aiMetrics;
    if (value == null) return null;
    if (_aiMetrics is EqualUnmodifiableMapView) return _aiMetrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'StoryMetadata(isAIGenerated: $isAIGenerated, aiSource: $aiSource, generationPrompt: $generationPrompt, confidenceScore: $confidenceScore, sourceFacts: $sourceFacts, suggestedTags: $suggestedTags, aiMetrics: $aiMetrics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryMetadataImpl &&
            (identical(other.isAIGenerated, isAIGenerated) ||
                other.isAIGenerated == isAIGenerated) &&
            (identical(other.aiSource, aiSource) ||
                other.aiSource == aiSource) &&
            (identical(other.generationPrompt, generationPrompt) ||
                other.generationPrompt == generationPrompt) &&
            (identical(other.confidenceScore, confidenceScore) ||
                other.confidenceScore == confidenceScore) &&
            const DeepCollectionEquality()
                .equals(other._sourceFacts, _sourceFacts) &&
            const DeepCollectionEquality()
                .equals(other._suggestedTags, _suggestedTags) &&
            const DeepCollectionEquality()
                .equals(other._aiMetrics, _aiMetrics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isAIGenerated,
      aiSource,
      generationPrompt,
      confidenceScore,
      const DeepCollectionEquality().hash(_sourceFacts),
      const DeepCollectionEquality().hash(_suggestedTags),
      const DeepCollectionEquality().hash(_aiMetrics));

  /// Create a copy of StoryMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryMetadataImplCopyWith<_$StoryMetadataImpl> get copyWith =>
      __$$StoryMetadataImplCopyWithImpl<_$StoryMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryMetadataImplToJson(
      this,
    );
  }
}

abstract class _StoryMetadata implements StoryMetadata {
  const factory _StoryMetadata(
      {final bool isAIGenerated,
      final AIStorySource? aiSource,
      final String? generationPrompt,
      final double? confidenceScore,
      final List<String> sourceFacts,
      final List<String> suggestedTags,
      final Map<String, dynamic>? aiMetrics}) = _$StoryMetadataImpl;

  factory _StoryMetadata.fromJson(Map<String, dynamic> json) =
      _$StoryMetadataImpl.fromJson;

  @override
  bool get isAIGenerated;
  @override
  AIStorySource? get aiSource;
  @override
  String? get generationPrompt;
  @override
  double? get confidenceScore;
  @override
  List<String> get sourceFacts;
  @override
  List<String> get suggestedTags;
  @override
  Map<String, dynamic>? get aiMetrics;

  /// Create a copy of StoryMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryMetadataImplCopyWith<_$StoryMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AIStorySource _$AIStorySourceFromJson(Map<String, dynamic> json) {
  return _AIStorySource.fromJson(json);
}

/// @nodoc
mixin _$AIStorySource {
  AISourceType get type => throw _privateConstructorUsedError;
  String? get interviewId => throw _privateConstructorUsedError;
  List<String> get personIds => throw _privateConstructorUsedError;
  List<String> get eventIds => throw _privateConstructorUsedError;
  List<String> get mediaIds => throw _privateConstructorUsedError;
  DateTime? get generatedAt => throw _privateConstructorUsedError;
  String? get modelVersion => throw _privateConstructorUsedError;

  /// Serializes this AIStorySource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AIStorySource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AIStorySourceCopyWith<AIStorySource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AIStorySourceCopyWith<$Res> {
  factory $AIStorySourceCopyWith(
          AIStorySource value, $Res Function(AIStorySource) then) =
      _$AIStorySourceCopyWithImpl<$Res, AIStorySource>;
  @useResult
  $Res call(
      {AISourceType type,
      String? interviewId,
      List<String> personIds,
      List<String> eventIds,
      List<String> mediaIds,
      DateTime? generatedAt,
      String? modelVersion});
}

/// @nodoc
class _$AIStorySourceCopyWithImpl<$Res, $Val extends AIStorySource>
    implements $AIStorySourceCopyWith<$Res> {
  _$AIStorySourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AIStorySource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? interviewId = freezed,
    Object? personIds = null,
    Object? eventIds = null,
    Object? mediaIds = null,
    Object? generatedAt = freezed,
    Object? modelVersion = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AISourceType,
      interviewId: freezed == interviewId
          ? _value.interviewId
          : interviewId // ignore: cast_nullable_to_non_nullable
              as String?,
      personIds: null == personIds
          ? _value.personIds
          : personIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      eventIds: null == eventIds
          ? _value.eventIds
          : eventIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mediaIds: null == mediaIds
          ? _value.mediaIds
          : mediaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modelVersion: freezed == modelVersion
          ? _value.modelVersion
          : modelVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AIStorySourceImplCopyWith<$Res>
    implements $AIStorySourceCopyWith<$Res> {
  factory _$$AIStorySourceImplCopyWith(
          _$AIStorySourceImpl value, $Res Function(_$AIStorySourceImpl) then) =
      __$$AIStorySourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AISourceType type,
      String? interviewId,
      List<String> personIds,
      List<String> eventIds,
      List<String> mediaIds,
      DateTime? generatedAt,
      String? modelVersion});
}

/// @nodoc
class __$$AIStorySourceImplCopyWithImpl<$Res>
    extends _$AIStorySourceCopyWithImpl<$Res, _$AIStorySourceImpl>
    implements _$$AIStorySourceImplCopyWith<$Res> {
  __$$AIStorySourceImplCopyWithImpl(
      _$AIStorySourceImpl _value, $Res Function(_$AIStorySourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of AIStorySource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? interviewId = freezed,
    Object? personIds = null,
    Object? eventIds = null,
    Object? mediaIds = null,
    Object? generatedAt = freezed,
    Object? modelVersion = freezed,
  }) {
    return _then(_$AIStorySourceImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AISourceType,
      interviewId: freezed == interviewId
          ? _value.interviewId
          : interviewId // ignore: cast_nullable_to_non_nullable
              as String?,
      personIds: null == personIds
          ? _value._personIds
          : personIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      eventIds: null == eventIds
          ? _value._eventIds
          : eventIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mediaIds: null == mediaIds
          ? _value._mediaIds
          : mediaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modelVersion: freezed == modelVersion
          ? _value.modelVersion
          : modelVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AIStorySourceImpl implements _AIStorySource {
  const _$AIStorySourceImpl(
      {required this.type,
      this.interviewId,
      final List<String> personIds = const [],
      final List<String> eventIds = const [],
      final List<String> mediaIds = const [],
      this.generatedAt,
      this.modelVersion})
      : _personIds = personIds,
        _eventIds = eventIds,
        _mediaIds = mediaIds;

  factory _$AIStorySourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AIStorySourceImplFromJson(json);

  @override
  final AISourceType type;
  @override
  final String? interviewId;
  final List<String> _personIds;
  @override
  @JsonKey()
  List<String> get personIds {
    if (_personIds is EqualUnmodifiableListView) return _personIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_personIds);
  }

  final List<String> _eventIds;
  @override
  @JsonKey()
  List<String> get eventIds {
    if (_eventIds is EqualUnmodifiableListView) return _eventIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eventIds);
  }

  final List<String> _mediaIds;
  @override
  @JsonKey()
  List<String> get mediaIds {
    if (_mediaIds is EqualUnmodifiableListView) return _mediaIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaIds);
  }

  @override
  final DateTime? generatedAt;
  @override
  final String? modelVersion;

  @override
  String toString() {
    return 'AIStorySource(type: $type, interviewId: $interviewId, personIds: $personIds, eventIds: $eventIds, mediaIds: $mediaIds, generatedAt: $generatedAt, modelVersion: $modelVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AIStorySourceImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.interviewId, interviewId) ||
                other.interviewId == interviewId) &&
            const DeepCollectionEquality()
                .equals(other._personIds, _personIds) &&
            const DeepCollectionEquality().equals(other._eventIds, _eventIds) &&
            const DeepCollectionEquality().equals(other._mediaIds, _mediaIds) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.modelVersion, modelVersion) ||
                other.modelVersion == modelVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      interviewId,
      const DeepCollectionEquality().hash(_personIds),
      const DeepCollectionEquality().hash(_eventIds),
      const DeepCollectionEquality().hash(_mediaIds),
      generatedAt,
      modelVersion);

  /// Create a copy of AIStorySource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AIStorySourceImplCopyWith<_$AIStorySourceImpl> get copyWith =>
      __$$AIStorySourceImplCopyWithImpl<_$AIStorySourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AIStorySourceImplToJson(
      this,
    );
  }
}

abstract class _AIStorySource implements AIStorySource {
  const factory _AIStorySource(
      {required final AISourceType type,
      final String? interviewId,
      final List<String> personIds,
      final List<String> eventIds,
      final List<String> mediaIds,
      final DateTime? generatedAt,
      final String? modelVersion}) = _$AIStorySourceImpl;

  factory _AIStorySource.fromJson(Map<String, dynamic> json) =
      _$AIStorySourceImpl.fromJson;

  @override
  AISourceType get type;
  @override
  String? get interviewId;
  @override
  List<String> get personIds;
  @override
  List<String> get eventIds;
  @override
  List<String> get mediaIds;
  @override
  DateTime? get generatedAt;
  @override
  String? get modelVersion;

  /// Create a copy of AIStorySource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AIStorySourceImplCopyWith<_$AIStorySourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
