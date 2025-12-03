// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RelationshipImpl _$$RelationshipImplFromJson(Map<String, dynamic> json) =>
    _$RelationshipImpl(
      id: json['id'] as String,
      treeId: json['treeId'] as String,
      type: $enumDecode(_$RelationshipTypeEnumMap, json['type']),
      person1Id: json['person1Id'] as String,
      person2Id: json['person2Id'] as String,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      place: json['place'] == null
          ? null
          : Place.fromJson(json['place'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$RelationshipStatusEnumMap, json['status']),
      notes: json['notes'] as String?,
      customFields: json['customFields'] as Map<String, dynamic>? ?? const {},
      createdBy: json['createdBy'] as String,
      updatedBy: json['updatedBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$RelationshipImplToJson(_$RelationshipImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'treeId': instance.treeId,
      'type': _$RelationshipTypeEnumMap[instance.type]!,
      'person1Id': instance.person1Id,
      'person2Id': instance.person2Id,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'place': instance.place,
      'status': _$RelationshipStatusEnumMap[instance.status],
      'notes': instance.notes,
      'customFields': instance.customFields,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

const _$RelationshipTypeEnumMap = {
  RelationshipType.biologicalParent: 'biological_parent',
  RelationshipType.biologicalChild: 'biological_child',
  RelationshipType.adoptiveParent: 'adoptive_parent',
  RelationshipType.adoptiveChild: 'adoptive_child',
  RelationshipType.stepParent: 'step_parent',
  RelationshipType.stepChild: 'step_child',
  RelationshipType.fosterParent: 'foster_parent',
  RelationshipType.fosterChild: 'foster_child',
  RelationshipType.spouse: 'spouse',
  RelationshipType.partner: 'partner',
  RelationshipType.sibling: 'sibling',
  RelationshipType.halfSibling: 'half_sibling',
  RelationshipType.stepSibling: 'step_sibling',
  RelationshipType.guardian: 'guardian',
  RelationshipType.godparent: 'godparent',
};

const _$RelationshipStatusEnumMap = {
  RelationshipStatus.current: 'current',
  RelationshipStatus.ended: 'ended',
  RelationshipStatus.divorced: 'divorced',
  RelationshipStatus.widowed: 'widowed',
  RelationshipStatus.separated: 'separated',
};
