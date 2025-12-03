// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaImpl _$$MediaImplFromJson(Map<String, dynamic> json) => _$MediaImpl(
      id: json['id'] as String,
      treeId: json['treeId'] as String,
      personId: json['personId'] as String?,
      type: $enumDecode(_$MediaTypeEnumMap, json['type']),
      fileName: json['fileName'] as String,
      fileSize: (json['fileSize'] as num).toInt(),
      mimeType: json['mimeType'] as String,
      storageKey: json['storageKey'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      dateTaken: json['dateTaken'] == null
          ? null
          : DateTime.parse(json['dateTaken'] as String),
      location: json['location'] == null
          ? null
          : Place.fromJson(json['location'] as Map<String, dynamic>),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      privacy: $enumDecodeNullable(_$PrivacyLevelEnumMap, json['privacy']) ??
          PrivacyLevel.family,
      detectedFaces: (json['detectedFaces'] as List<dynamic>?)
              ?.map((e) => DetectedFace.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      uploadedBy: json['uploadedBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$MediaImplToJson(_$MediaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'treeId': instance.treeId,
      'personId': instance.personId,
      'type': _$MediaTypeEnumMap[instance.type]!,
      'fileName': instance.fileName,
      'fileSize': instance.fileSize,
      'mimeType': instance.mimeType,
      'storageKey': instance.storageKey,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
      'title': instance.title,
      'description': instance.description,
      'dateTaken': instance.dateTaken?.toIso8601String(),
      'location': instance.location,
      'tags': instance.tags,
      'width': instance.width,
      'height': instance.height,
      'privacy': _$PrivacyLevelEnumMap[instance.privacy]!,
      'detectedFaces': instance.detectedFaces,
      'uploadedBy': instance.uploadedBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

const _$MediaTypeEnumMap = {
  MediaType.photo: 'photo',
  MediaType.video: 'video',
  MediaType.document: 'document',
  MediaType.audio: 'audio',
};

const _$PrivacyLevelEnumMap = {
  PrivacyLevel.private: 'private',
  PrivacyLevel.family: 'family',
  PrivacyLevel.public: 'public',
};

_$DetectedFaceImpl _$$DetectedFaceImplFromJson(Map<String, dynamic> json) =>
    _$DetectedFaceImpl(
      personId: json['personId'] as String?,
      boundingBox:
          BoundingBox.fromJson(json['boundingBox'] as Map<String, dynamic>),
      confidence: (json['confidence'] as num).toDouble(),
    );

Map<String, dynamic> _$$DetectedFaceImplToJson(_$DetectedFaceImpl instance) =>
    <String, dynamic>{
      'personId': instance.personId,
      'boundingBox': instance.boundingBox,
      'confidence': instance.confidence,
    };

_$BoundingBoxImpl _$$BoundingBoxImplFromJson(Map<String, dynamic> json) =>
    _$BoundingBoxImpl(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
    );

Map<String, dynamic> _$$BoundingBoxImplToJson(_$BoundingBoxImpl instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'width': instance.width,
      'height': instance.height,
    };
