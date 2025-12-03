// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FamilyTreeImpl _$$FamilyTreeImplFromJson(Map<String, dynamic> json) =>
    _$FamilyTreeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      ownerId: json['ownerId'] as String,
      visibility:
          $enumDecodeNullable(_$TreeVisibilityEnumMap, json['visibility']) ??
              TreeVisibility.private,
      settings: json['settings'] == null
          ? const TreeSettings()
          : TreeSettings.fromJson(json['settings'] as Map<String, dynamic>),
      coverImageUrl: json['coverImageUrl'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$FamilyTreeImplToJson(_$FamilyTreeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'ownerId': instance.ownerId,
      'visibility': _$TreeVisibilityEnumMap[instance.visibility]!,
      'settings': instance.settings,
      'coverImageUrl': instance.coverImageUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

const _$TreeVisibilityEnumMap = {
  TreeVisibility.private: 'private',
  TreeVisibility.family: 'family',
  TreeVisibility.public: 'public',
};

_$TreeSettingsImpl _$$TreeSettingsImplFromJson(Map<String, dynamic> json) =>
    _$TreeSettingsImpl(
      allowCollaboration: json['allowCollaboration'] as bool? ?? true,
      requireApprovalForEdits:
          json['requireApprovalForEdits'] as bool? ?? false,
      showLivingPersonDetails:
          json['showLivingPersonDetails'] as bool? ?? false,
      privacyYearThreshold:
          (json['privacyYearThreshold'] as num?)?.toInt() ?? 100,
      defaultPersonPrivacy: $enumDecodeNullable(
              _$PrivacyLevelEnumMap, json['defaultPersonPrivacy']) ??
          PrivacyLevel.family,
    );

Map<String, dynamic> _$$TreeSettingsImplToJson(_$TreeSettingsImpl instance) =>
    <String, dynamic>{
      'allowCollaboration': instance.allowCollaboration,
      'requireApprovalForEdits': instance.requireApprovalForEdits,
      'showLivingPersonDetails': instance.showLivingPersonDetails,
      'privacyYearThreshold': instance.privacyYearThreshold,
      'defaultPersonPrivacy':
          _$PrivacyLevelEnumMap[instance.defaultPersonPrivacy]!,
    };

const _$PrivacyLevelEnumMap = {
  PrivacyLevel.private: 'private',
  PrivacyLevel.family: 'family',
  PrivacyLevel.public: 'public',
};

_$TreeMemberImpl _$$TreeMemberImplFromJson(Map<String, dynamic> json) =>
    _$TreeMemberImpl(
      id: json['id'] as String,
      treeId: json['treeId'] as String,
      userId: json['userId'] as String,
      role: $enumDecode(_$TreeRoleEnumMap, json['role']),
      invitedBy: json['invitedBy'] as String,
      invitedAt: DateTime.parse(json['invitedAt'] as String),
      acceptedAt: json['acceptedAt'] == null
          ? null
          : DateTime.parse(json['acceptedAt'] as String),
      permissions: json['permissions'] == null
          ? const TreePermissions()
          : TreePermissions.fromJson(
              json['permissions'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TreeMemberImplToJson(_$TreeMemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'treeId': instance.treeId,
      'userId': instance.userId,
      'role': _$TreeRoleEnumMap[instance.role]!,
      'invitedBy': instance.invitedBy,
      'invitedAt': instance.invitedAt.toIso8601String(),
      'acceptedAt': instance.acceptedAt?.toIso8601String(),
      'permissions': instance.permissions,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$TreeRoleEnumMap = {
  TreeRole.owner: 'owner',
  TreeRole.admin: 'admin',
  TreeRole.editor: 'editor',
  TreeRole.viewer: 'viewer',
};

_$TreePermissionsImpl _$$TreePermissionsImplFromJson(
        Map<String, dynamic> json) =>
    _$TreePermissionsImpl(
      canAddPerson: json['canAddPerson'] as bool? ?? false,
      canEditPerson: json['canEditPerson'] as bool? ?? false,
      canDeletePerson: json['canDeletePerson'] as bool? ?? false,
      canAddRelationship: json['canAddRelationship'] as bool? ?? false,
      canEditRelationship: json['canEditRelationship'] as bool? ?? false,
      canDeleteRelationship: json['canDeleteRelationship'] as bool? ?? false,
      canUploadMedia: json['canUploadMedia'] as bool? ?? false,
      canDeleteMedia: json['canDeleteMedia'] as bool? ?? false,
      canInviteMembers: json['canInviteMembers'] as bool? ?? false,
      canEditSettings: json['canEditSettings'] as bool? ?? false,
    );

Map<String, dynamic> _$$TreePermissionsImplToJson(
        _$TreePermissionsImpl instance) =>
    <String, dynamic>{
      'canAddPerson': instance.canAddPerson,
      'canEditPerson': instance.canEditPerson,
      'canDeletePerson': instance.canDeletePerson,
      'canAddRelationship': instance.canAddRelationship,
      'canEditRelationship': instance.canEditRelationship,
      'canDeleteRelationship': instance.canDeleteRelationship,
      'canUploadMedia': instance.canUploadMedia,
      'canDeleteMedia': instance.canDeleteMedia,
      'canInviteMembers': instance.canInviteMembers,
      'canEditSettings': instance.canEditSettings,
    };
