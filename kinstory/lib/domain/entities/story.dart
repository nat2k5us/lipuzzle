import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'story.freezed.dart';
part 'story.g.dart';

@freezed
class Story with _$Story {
  const factory Story({
    required String id,
    required String treeId,
    required String title,
    required String content, // Rich text / Markdown

    // Relations
    required String authorId, // References User.id
    @Default([]) List<String> relatedPersonIds, // References Person.id[]

    // Media
    String? coverImageId, // References Media.id
    @Default([]) List<String> mediaIds, // References Media.id[]

    // Publishing
    @Default(StoryStatus.draft) StoryStatus status,
    DateTime? publishedAt,
    @Default(PrivacyLevel.family) PrivacyLevel privacy,

    // Engagement
    @Default(0) int viewCount,
    @Default(0) int likeCount,

    // AI-generated metadata
    StoryMetadata? metadata,

    // Audit
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

  // Factory for creating a new story
  factory Story.create({
    required String treeId,
    required String title,
    required String content,
    required String authorId,
    List<String>? relatedPersonIds,
    String? coverImageId,
    StoryStatus status = StoryStatus.draft,
    PrivacyLevel privacy = PrivacyLevel.family,
  }) {
    final now = DateTime.now();
    return Story(
      id: const Uuid().v4(),
      treeId: treeId,
      title: title,
      content: content,
      authorId: authorId,
      relatedPersonIds: relatedPersonIds ?? [],
      coverImageId: coverImageId,
      status: status,
      privacy: privacy,
      createdAt: now,
      updatedAt: now,
    );
  }

  // Factory for AI-generated story
  factory Story.createAIGenerated({
    required String treeId,
    required String title,
    required String content,
    required String authorId,
    required List<String> relatedPersonIds,
    required StoryMetadata metadata,
    PrivacyLevel privacy = PrivacyLevel.family,
  }) {
    final now = DateTime.now();
    return Story(
      id: const Uuid().v4(),
      treeId: treeId,
      title: title,
      content: content,
      authorId: authorId,
      relatedPersonIds: relatedPersonIds,
      status: StoryStatus.draft, // AI stories start as drafts
      privacy: privacy,
      metadata: metadata,
      createdAt: now,
      updatedAt: now,
    );
  }
}

@freezed
class StoryMetadata with _$StoryMetadata {
  const factory StoryMetadata({
    @Default(false) bool isAIGenerated,
    AIStorySource? aiSource,
    String? generationPrompt,
    double? confidenceScore,
    @Default([]) List<String> sourceFacts,
    @Default([]) List<String> suggestedTags,
    Map<String, dynamic>? aiMetrics,
  }) = _StoryMetadata;

  factory StoryMetadata.fromJson(Map<String, dynamic> json) => _$StoryMetadataFromJson(json);
}

@freezed
class AIStorySource with _$AIStorySource {
  const factory AIStorySource({
    required AISourceType type,
    String? interviewId,
    @Default([]) List<String> personIds,
    @Default([]) List<String> eventIds,
    @Default([]) List<String> mediaIds,
    DateTime? generatedAt,
    String? modelVersion,
  }) = _AIStorySource;

  factory AIStorySource.fromJson(Map<String, dynamic> json) => _$AIStorySourceFromJson(json);
}

enum StoryStatus {
  @JsonValue('draft')
  draft,
  @JsonValue('published')
  published,
  @JsonValue('archived')
  archived,
}

enum PrivacyLevel {
  @JsonValue('private')
  private,
  @JsonValue('family')
  family,
  @JsonValue('public')
  public,
}

enum AISourceType {
  @JsonValue('interview')
  interview,
  @JsonValue('data_compilation')
  dataCompilation,
  @JsonValue('timeline_narrative')
  timelineNarrative,
  @JsonValue('memory_prompt')
  memoryPrompt,
}

// Extensions for better UX
extension StoryStatusX on StoryStatus {
  String get displayName {
    switch (this) {
      case StoryStatus.draft:
        return 'Draft';
      case StoryStatus.published:
        return 'Published';
      case StoryStatus.archived:
        return 'Archived';
    }
  }

  String get description {
    switch (this) {
      case StoryStatus.draft:
        return 'Work in progress, not visible to others';
      case StoryStatus.published:
        return 'Visible to family members';
      case StoryStatus.archived:
        return 'Hidden from main view';
    }
  }

  bool get isVisible {
    return this == StoryStatus.published;
  }

  bool get isEditable {
    return this == StoryStatus.draft;
  }
}

extension PrivacyLevelX on PrivacyLevel {
  String get displayName {
    switch (this) {
      case PrivacyLevel.private:
        return 'Private';
      case PrivacyLevel.family:
        return 'Family';
      case PrivacyLevel.public:
        return 'Public';
    }
  }

  String get description {
    switch (this) {
      case PrivacyLevel.private:
        return 'Only you can see this story';
      case PrivacyLevel.family:
        return 'Family members can see this story';
      case PrivacyLevel.public:
        return 'Anyone can see this story';
    }
  }
}

extension AISourceTypeX on AISourceType {
  String get displayName {
    switch (this) {
      case AISourceType.interview:
        return 'Interview';
      case AISourceType.dataCompilation:
        return 'Data Compilation';
      case AISourceType.timelineNarrative:
        return 'Timeline Narrative';
      case AISourceType.memoryPrompt:
        return 'Memory Prompt';
    }
  }

  String get description {
    switch (this) {
      case AISourceType.interview:
        return 'Generated from recorded interview';
      case AISourceType.dataCompilation:
        return 'Generated from family tree data';
      case AISourceType.timelineNarrative:
        return 'Generated from life events timeline';
      case AISourceType.memoryPrompt:
        return 'Generated from memory prompts';
    }
  }
}

// Helper extension for story operations
extension StoryX on Story {
  /// Copy story with updated timestamp
  Story copyWithUpdate({
    String? title,
    String? content,
    List<String>? relatedPersonIds,
    String? coverImageId,
    List<String>? mediaIds,
    StoryStatus? status,
    PrivacyLevel? privacy,
    StoryMetadata? metadata,
  }) {
    return copyWith(
      title: title ?? this.title,
      content: content ?? this.content,
      relatedPersonIds: relatedPersonIds ?? this.relatedPersonIds,
      coverImageId: coverImageId ?? this.coverImageId,
      mediaIds: mediaIds ?? this.mediaIds,
      status: status ?? this.status,
      privacy: privacy ?? this.privacy,
      metadata: metadata ?? this.metadata,
      updatedAt: DateTime.now(),
    );
  }

  /// Publish the story
  Story publish() {
    return copyWith(
      status: StoryStatus.published,
      publishedAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// Archive the story
  Story archive() {
    return copyWith(
      status: StoryStatus.archived,
      updatedAt: DateTime.now(),
    );
  }

  /// Increment view count
  Story incrementViews() {
    return copyWith(
      viewCount: viewCount + 1,
    );
  }

  /// Increment like count
  Story incrementLikes() {
    return copyWith(
      likeCount: likeCount + 1,
    );
  }

  /// Decrement like count
  Story decrementLikes() {
    return copyWith(
      likeCount: (likeCount - 1).clamp(0, double.infinity).toInt(),
    );
  }

  bool get isDeleted => deletedAt != null;
  bool get isPublished => status == StoryStatus.published;
  bool get isDraft => status == StoryStatus.draft;
  bool get isArchived => status == StoryStatus.archived;
  bool get isAIGenerated => metadata?.isAIGenerated ?? false;

  /// Get reading time estimate (words per minute)
  int get estimatedReadingTimeMinutes {
    const wordsPerMinute = 200;
    final wordCount = content.split(' ').length;
    return (wordCount / wordsPerMinute).ceil();
  }

  /// Get content preview (first 150 characters)
  String get preview {
    if (content.length <= 150) return content;
    final preview = content.substring(0, 147);
    return '$preview...';
  }

  /// Get word count
  int get wordCount {
    return content.split(' ').where((word) => word.isNotEmpty).length;
  }

  /// Check if story involves a specific person
  bool involvesPersonId(String personId) {
    return relatedPersonIds.contains(personId);
  }

  /// Get age of story
  Duration get age {
    return DateTime.now().difference(createdAt);
  }

  /// Check if story was recently updated
  bool get isRecentlyUpdated {
    return DateTime.now().difference(updatedAt).inDays < 7;
  }

  /// Get engagement score (simple algorithm)
  double get engagementScore {
    final ageInDays = age.inDays + 1; // Add 1 to avoid division by zero
    return (viewCount + (likeCount * 3)) / ageInDays;
  }
}