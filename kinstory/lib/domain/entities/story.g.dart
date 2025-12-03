// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryImpl _$$StoryImplFromJson(Map<String, dynamic> json) => _$StoryImpl(
      id: json['id'] as String,
      treeId: json['treeId'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      authorId: json['authorId'] as String,
      relatedPersonIds: (json['relatedPersonIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      coverImageId: json['coverImageId'] as String?,
      mediaIds: (json['mediaIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      status: $enumDecodeNullable(_$StoryStatusEnumMap, json['status']) ??
          StoryStatus.draft,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      privacy: $enumDecodeNullable(_$PrivacyLevelEnumMap, json['privacy']) ??
          PrivacyLevel.family,
      viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
      likeCount: (json['likeCount'] as num?)?.toInt() ?? 0,
      metadata: json['metadata'] == null
          ? null
          : StoryMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$StoryImplToJson(_$StoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'treeId': instance.treeId,
      'title': instance.title,
      'content': instance.content,
      'authorId': instance.authorId,
      'relatedPersonIds': instance.relatedPersonIds,
      'coverImageId': instance.coverImageId,
      'mediaIds': instance.mediaIds,
      'status': _$StoryStatusEnumMap[instance.status]!,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'privacy': _$PrivacyLevelEnumMap[instance.privacy]!,
      'viewCount': instance.viewCount,
      'likeCount': instance.likeCount,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

const _$StoryStatusEnumMap = {
  StoryStatus.draft: 'draft',
  StoryStatus.published: 'published',
  StoryStatus.archived: 'archived',
};

const _$PrivacyLevelEnumMap = {
  PrivacyLevel.private: 'private',
  PrivacyLevel.family: 'family',
  PrivacyLevel.public: 'public',
};

_$StoryMetadataImpl _$$StoryMetadataImplFromJson(Map<String, dynamic> json) =>
    _$StoryMetadataImpl(
      isAIGenerated: json['isAIGenerated'] as bool? ?? false,
      aiSource: json['aiSource'] == null
          ? null
          : AIStorySource.fromJson(json['aiSource'] as Map<String, dynamic>),
      generationPrompt: json['generationPrompt'] as String?,
      confidenceScore: (json['confidenceScore'] as num?)?.toDouble(),
      sourceFacts: (json['sourceFacts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      suggestedTags: (json['suggestedTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      aiMetrics: json['aiMetrics'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$StoryMetadataImplToJson(_$StoryMetadataImpl instance) =>
    <String, dynamic>{
      'isAIGenerated': instance.isAIGenerated,
      'aiSource': instance.aiSource,
      'generationPrompt': instance.generationPrompt,
      'confidenceScore': instance.confidenceScore,
      'sourceFacts': instance.sourceFacts,
      'suggestedTags': instance.suggestedTags,
      'aiMetrics': instance.aiMetrics,
    };

_$AIStorySourceImpl _$$AIStorySourceImplFromJson(Map<String, dynamic> json) =>
    _$AIStorySourceImpl(
      type: $enumDecode(_$AISourceTypeEnumMap, json['type']),
      interviewId: json['interviewId'] as String?,
      personIds: (json['personIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      eventIds: (json['eventIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      mediaIds: (json['mediaIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      generatedAt: json['generatedAt'] == null
          ? null
          : DateTime.parse(json['generatedAt'] as String),
      modelVersion: json['modelVersion'] as String?,
    );

Map<String, dynamic> _$$AIStorySourceImplToJson(_$AIStorySourceImpl instance) =>
    <String, dynamic>{
      'type': _$AISourceTypeEnumMap[instance.type]!,
      'interviewId': instance.interviewId,
      'personIds': instance.personIds,
      'eventIds': instance.eventIds,
      'mediaIds': instance.mediaIds,
      'generatedAt': instance.generatedAt?.toIso8601String(),
      'modelVersion': instance.modelVersion,
    };

const _$AISourceTypeEnumMap = {
  AISourceType.interview: 'interview',
  AISourceType.dataCompilation: 'data_compilation',
  AISourceType.timelineNarrative: 'timeline_narrative',
  AISourceType.memoryPrompt: 'memory_prompt',
};
