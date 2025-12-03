// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FamilyEventImpl _$$FamilyEventImplFromJson(Map<String, dynamic> json) =>
    _$FamilyEventImpl(
      id: json['id'] as String,
      treeId: json['treeId'] as String,
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      title: json['title'] as String,
      description: json['description'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      dateAccuracy:
          $enumDecodeNullable(_$DateAccuracyEnumMap, json['dateAccuracy']) ??
              DateAccuracy.exact,
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      place: json['place'] == null
          ? null
          : Place.fromJson(json['place'] as Map<String, dynamic>),
      primaryPersonId: json['primaryPersonId'] as String,
      otherPersonIds: (json['otherPersonIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      mediaIds: (json['mediaIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      sources: (json['sources'] as List<dynamic>?)
              ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdBy: json['createdBy'] as String,
      updatedBy: json['updatedBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$FamilyEventImplToJson(_$FamilyEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'treeId': instance.treeId,
      'type': _$EventTypeEnumMap[instance.type]!,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date?.toIso8601String(),
      'dateAccuracy': _$DateAccuracyEnumMap[instance.dateAccuracy]!,
      'endDate': instance.endDate?.toIso8601String(),
      'place': instance.place,
      'primaryPersonId': instance.primaryPersonId,
      'otherPersonIds': instance.otherPersonIds,
      'mediaIds': instance.mediaIds,
      'sources': instance.sources,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

const _$EventTypeEnumMap = {
  EventType.birth: 'birth',
  EventType.death: 'death',
  EventType.marriage: 'marriage',
  EventType.divorce: 'divorce',
  EventType.baptism: 'baptism',
  EventType.graduation: 'graduation',
  EventType.militaryService: 'military_service',
  EventType.immigration: 'immigration',
  EventType.emigration: 'emigration',
  EventType.residence: 'residence',
  EventType.occupation: 'occupation',
  EventType.retirement: 'retirement',
  EventType.census: 'census',
  EventType.other: 'other',
};

const _$DateAccuracyEnumMap = {
  DateAccuracy.exact: 'exact',
  DateAccuracy.circa: 'circa',
  DateAccuracy.before: 'before',
  DateAccuracy.after: 'after',
  DateAccuracy.between: 'between',
  DateAccuracy.unknown: 'unknown',
};

_$SourceImpl _$$SourceImplFromJson(Map<String, dynamic> json) => _$SourceImpl(
      type: $enumDecode(_$SourceTypeEnumMap, json['type']),
      title: json['title'] as String,
      url: json['url'] as String?,
      citation: json['citation'] as String?,
      reliability: (json['reliability'] as num?)?.toInt() ?? 3,
    );

Map<String, dynamic> _$$SourceImplToJson(_$SourceImpl instance) =>
    <String, dynamic>{
      'type': _$SourceTypeEnumMap[instance.type]!,
      'title': instance.title,
      'url': instance.url,
      'citation': instance.citation,
      'reliability': instance.reliability,
    };

const _$SourceTypeEnumMap = {
  SourceType.document: 'document',
  SourceType.oral: 'oral',
  SourceType.record: 'record',
  SourceType.other: 'other',
};
