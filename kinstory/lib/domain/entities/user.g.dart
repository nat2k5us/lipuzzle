// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      profilePictureUrl: json['profilePictureUrl'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      preferences: json['preferences'] == null
          ? const UserPreferences()
          : UserPreferences.fromJson(
              json['preferences'] as Map<String, dynamic>),
      emailVerified: json['emailVerified'] as bool? ?? false,
      mfaEnabled: json['mfaEnabled'] as bool? ?? false,
      mfaSecret: json['mfaSecret'] as String?,
      lastLoginAt: json['lastLoginAt'] == null
          ? null
          : DateTime.parse(json['lastLoginAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profilePictureUrl': instance.profilePictureUrl,
      'phoneNumber': instance.phoneNumber,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'preferences': instance.preferences,
      'emailVerified': instance.emailVerified,
      'mfaEnabled': instance.mfaEnabled,
      'mfaSecret': instance.mfaSecret,
      'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

_$UserPreferencesImpl _$$UserPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPreferencesImpl(
      language: json['language'] as String? ?? 'en',
      theme: $enumDecodeNullable(_$ThemeModeEnumMap, json['theme']) ??
          ThemeMode.auto,
      dateFormat: json['dateFormat'] as String? ?? 'MM/dd/yyyy',
      defaultTreeView:
          $enumDecodeNullable(_$TreeViewModeEnumMap, json['defaultTreeView']) ??
              TreeViewMode.vertical,
      notifications: json['notifications'] == null
          ? const NotificationSettings()
          : NotificationSettings.fromJson(
              json['notifications'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserPreferencesImplToJson(
        _$UserPreferencesImpl instance) =>
    <String, dynamic>{
      'language': instance.language,
      'theme': _$ThemeModeEnumMap[instance.theme]!,
      'dateFormat': instance.dateFormat,
      'defaultTreeView': _$TreeViewModeEnumMap[instance.defaultTreeView]!,
      'notifications': instance.notifications,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
  ThemeMode.auto: 'auto',
};

const _$TreeViewModeEnumMap = {
  TreeViewMode.vertical: 'vertical',
  TreeViewMode.horizontal: 'horizontal',
  TreeViewMode.radial: 'radial',
};

_$NotificationSettingsImpl _$$NotificationSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationSettingsImpl(
      email: json['email'] as bool? ?? true,
      push: json['push'] as bool? ?? true,
      treeUpdates: json['treeUpdates'] as bool? ?? true,
      collaborationInvites: json['collaborationInvites'] as bool? ?? true,
      weeklyDigest: json['weeklyDigest'] as bool? ?? false,
      monthlyReport: json['monthlyReport'] as bool? ?? false,
      securityAlerts: json['securityAlerts'] as bool? ?? true,
    );

Map<String, dynamic> _$$NotificationSettingsImplToJson(
        _$NotificationSettingsImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'push': instance.push,
      'treeUpdates': instance.treeUpdates,
      'collaborationInvites': instance.collaborationInvites,
      'weeklyDigest': instance.weeklyDigest,
      'monthlyReport': instance.monthlyReport,
      'securityAlerts': instance.securityAlerts,
    };
