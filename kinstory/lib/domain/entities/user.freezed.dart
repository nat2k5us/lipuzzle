// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError; // UUID
  String get email => throw _privateConstructorUsedError; // Unique, required
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get profilePictureUrl => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  UserPreferences get preferences => throw _privateConstructorUsedError;
  bool get emailVerified => throw _privateConstructorUsedError;
  bool get mfaEnabled => throw _privateConstructorUsedError;
  String? get mfaSecret => throw _privateConstructorUsedError;
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      String email,
      String firstName,
      String lastName,
      String? profilePictureUrl,
      String? phoneNumber,
      DateTime? dateOfBirth,
      UserPreferences preferences,
      bool emailVerified,
      bool mfaEnabled,
      String? mfaSecret,
      DateTime? lastLoginAt,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  $UserPreferencesCopyWith<$Res> get preferences;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? profilePictureUrl = freezed,
    Object? phoneNumber = freezed,
    Object? dateOfBirth = freezed,
    Object? preferences = null,
    Object? emailVerified = null,
    Object? mfaEnabled = null,
    Object? mfaSecret = freezed,
    Object? lastLoginAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as UserPreferences,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      mfaEnabled: null == mfaEnabled
          ? _value.mfaEnabled
          : mfaEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      mfaSecret: freezed == mfaSecret
          ? _value.mfaSecret
          : mfaSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPreferencesCopyWith<$Res> get preferences {
    return $UserPreferencesCopyWith<$Res>(_value.preferences, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String firstName,
      String lastName,
      String? profilePictureUrl,
      String? phoneNumber,
      DateTime? dateOfBirth,
      UserPreferences preferences,
      bool emailVerified,
      bool mfaEnabled,
      String? mfaSecret,
      DateTime? lastLoginAt,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  @override
  $UserPreferencesCopyWith<$Res> get preferences;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? profilePictureUrl = freezed,
    Object? phoneNumber = freezed,
    Object? dateOfBirth = freezed,
    Object? preferences = null,
    Object? emailVerified = null,
    Object? mfaEnabled = null,
    Object? mfaSecret = freezed,
    Object? lastLoginAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as UserPreferences,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      mfaEnabled: null == mfaEnabled
          ? _value.mfaEnabled
          : mfaEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      mfaSecret: freezed == mfaSecret
          ? _value.mfaSecret
          : mfaSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      this.profilePictureUrl,
      this.phoneNumber,
      this.dateOfBirth,
      this.preferences = const UserPreferences(),
      this.emailVerified = false,
      this.mfaEnabled = false,
      this.mfaSecret,
      this.lastLoginAt,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;
// UUID
  @override
  final String email;
// Unique, required
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? profilePictureUrl;
  @override
  final String? phoneNumber;
  @override
  final DateTime? dateOfBirth;
  @override
  @JsonKey()
  final UserPreferences preferences;
  @override
  @JsonKey()
  final bool emailVerified;
  @override
  @JsonKey()
  final bool mfaEnabled;
  @override
  final String? mfaSecret;
  @override
  final DateTime? lastLoginAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'User(id: $id, email: $email, firstName: $firstName, lastName: $lastName, profilePictureUrl: $profilePictureUrl, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, preferences: $preferences, emailVerified: $emailVerified, mfaEnabled: $mfaEnabled, mfaSecret: $mfaSecret, lastLoginAt: $lastLoginAt, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.profilePictureUrl, profilePictureUrl) ||
                other.profilePictureUrl == profilePictureUrl) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.mfaEnabled, mfaEnabled) ||
                other.mfaEnabled == mfaEnabled) &&
            (identical(other.mfaSecret, mfaSecret) ||
                other.mfaSecret == mfaSecret) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
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
      email,
      firstName,
      lastName,
      profilePictureUrl,
      phoneNumber,
      dateOfBirth,
      preferences,
      emailVerified,
      mfaEnabled,
      mfaSecret,
      lastLoginAt,
      createdAt,
      updatedAt,
      deletedAt);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String id,
      required final String email,
      required final String firstName,
      required final String lastName,
      final String? profilePictureUrl,
      final String? phoneNumber,
      final DateTime? dateOfBirth,
      final UserPreferences preferences,
      final bool emailVerified,
      final bool mfaEnabled,
      final String? mfaSecret,
      final DateTime? lastLoginAt,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final DateTime? deletedAt}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id; // UUID
  @override
  String get email; // Unique, required
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get profilePictureUrl;
  @override
  String? get phoneNumber;
  @override
  DateTime? get dateOfBirth;
  @override
  UserPreferences get preferences;
  @override
  bool get emailVerified;
  @override
  bool get mfaEnabled;
  @override
  String? get mfaSecret;
  @override
  DateTime? get lastLoginAt;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) {
  return _UserPreferences.fromJson(json);
}

/// @nodoc
mixin _$UserPreferences {
  String get language => throw _privateConstructorUsedError; // Default: 'en'
  ThemeMode get theme => throw _privateConstructorUsedError;
  String get dateFormat => throw _privateConstructorUsedError;
  TreeViewMode get defaultTreeView => throw _privateConstructorUsedError;
  NotificationSettings get notifications => throw _privateConstructorUsedError;

  /// Serializes this UserPreferences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPreferencesCopyWith<UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
          UserPreferences value, $Res Function(UserPreferences) then) =
      _$UserPreferencesCopyWithImpl<$Res, UserPreferences>;
  @useResult
  $Res call(
      {String language,
      ThemeMode theme,
      String dateFormat,
      TreeViewMode defaultTreeView,
      NotificationSettings notifications});

  $NotificationSettingsCopyWith<$Res> get notifications;
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res, $Val extends UserPreferences>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? theme = null,
    Object? dateFormat = null,
    Object? defaultTreeView = null,
    Object? notifications = null,
  }) {
    return _then(_value.copyWith(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      dateFormat: null == dateFormat
          ? _value.dateFormat
          : dateFormat // ignore: cast_nullable_to_non_nullable
              as String,
      defaultTreeView: null == defaultTreeView
          ? _value.defaultTreeView
          : defaultTreeView // ignore: cast_nullable_to_non_nullable
              as TreeViewMode,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as NotificationSettings,
    ) as $Val);
  }

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res> get notifications {
    return $NotificationSettingsCopyWith<$Res>(_value.notifications, (value) {
      return _then(_value.copyWith(notifications: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserPreferencesImplCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$$UserPreferencesImplCopyWith(_$UserPreferencesImpl value,
          $Res Function(_$UserPreferencesImpl) then) =
      __$$UserPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String language,
      ThemeMode theme,
      String dateFormat,
      TreeViewMode defaultTreeView,
      NotificationSettings notifications});

  @override
  $NotificationSettingsCopyWith<$Res> get notifications;
}

/// @nodoc
class __$$UserPreferencesImplCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res, _$UserPreferencesImpl>
    implements _$$UserPreferencesImplCopyWith<$Res> {
  __$$UserPreferencesImplCopyWithImpl(
      _$UserPreferencesImpl _value, $Res Function(_$UserPreferencesImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? theme = null,
    Object? dateFormat = null,
    Object? defaultTreeView = null,
    Object? notifications = null,
  }) {
    return _then(_$UserPreferencesImpl(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      dateFormat: null == dateFormat
          ? _value.dateFormat
          : dateFormat // ignore: cast_nullable_to_non_nullable
              as String,
      defaultTreeView: null == defaultTreeView
          ? _value.defaultTreeView
          : defaultTreeView // ignore: cast_nullable_to_non_nullable
              as TreeViewMode,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as NotificationSettings,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPreferencesImpl implements _UserPreferences {
  const _$UserPreferencesImpl(
      {this.language = 'en',
      this.theme = ThemeMode.auto,
      this.dateFormat = 'MM/dd/yyyy',
      this.defaultTreeView = TreeViewMode.vertical,
      this.notifications = const NotificationSettings()});

  factory _$UserPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPreferencesImplFromJson(json);

  @override
  @JsonKey()
  final String language;
// Default: 'en'
  @override
  @JsonKey()
  final ThemeMode theme;
  @override
  @JsonKey()
  final String dateFormat;
  @override
  @JsonKey()
  final TreeViewMode defaultTreeView;
  @override
  @JsonKey()
  final NotificationSettings notifications;

  @override
  String toString() {
    return 'UserPreferences(language: $language, theme: $theme, dateFormat: $dateFormat, defaultTreeView: $defaultTreeView, notifications: $notifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.dateFormat, dateFormat) ||
                other.dateFormat == dateFormat) &&
            (identical(other.defaultTreeView, defaultTreeView) ||
                other.defaultTreeView == defaultTreeView) &&
            (identical(other.notifications, notifications) ||
                other.notifications == notifications));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, language, theme, dateFormat, defaultTreeView, notifications);

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      __$$UserPreferencesImplCopyWithImpl<_$UserPreferencesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPreferencesImplToJson(
      this,
    );
  }
}

abstract class _UserPreferences implements UserPreferences {
  const factory _UserPreferences(
      {final String language,
      final ThemeMode theme,
      final String dateFormat,
      final TreeViewMode defaultTreeView,
      final NotificationSettings notifications}) = _$UserPreferencesImpl;

  factory _UserPreferences.fromJson(Map<String, dynamic> json) =
      _$UserPreferencesImpl.fromJson;

  @override
  String get language; // Default: 'en'
  @override
  ThemeMode get theme;
  @override
  String get dateFormat;
  @override
  TreeViewMode get defaultTreeView;
  @override
  NotificationSettings get notifications;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationSettings _$NotificationSettingsFromJson(Map<String, dynamic> json) {
  return _NotificationSettings.fromJson(json);
}

/// @nodoc
mixin _$NotificationSettings {
  bool get email => throw _privateConstructorUsedError;
  bool get push => throw _privateConstructorUsedError;
  bool get treeUpdates => throw _privateConstructorUsedError;
  bool get collaborationInvites => throw _privateConstructorUsedError;
  bool get weeklyDigest => throw _privateConstructorUsedError;
  bool get monthlyReport => throw _privateConstructorUsedError;
  bool get securityAlerts => throw _privateConstructorUsedError;

  /// Serializes this NotificationSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationSettingsCopyWith<NotificationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingsCopyWith<$Res> {
  factory $NotificationSettingsCopyWith(NotificationSettings value,
          $Res Function(NotificationSettings) then) =
      _$NotificationSettingsCopyWithImpl<$Res, NotificationSettings>;
  @useResult
  $Res call(
      {bool email,
      bool push,
      bool treeUpdates,
      bool collaborationInvites,
      bool weeklyDigest,
      bool monthlyReport,
      bool securityAlerts});
}

/// @nodoc
class _$NotificationSettingsCopyWithImpl<$Res,
        $Val extends NotificationSettings>
    implements $NotificationSettingsCopyWith<$Res> {
  _$NotificationSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? push = null,
    Object? treeUpdates = null,
    Object? collaborationInvites = null,
    Object? weeklyDigest = null,
    Object? monthlyReport = null,
    Object? securityAlerts = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as bool,
      push: null == push
          ? _value.push
          : push // ignore: cast_nullable_to_non_nullable
              as bool,
      treeUpdates: null == treeUpdates
          ? _value.treeUpdates
          : treeUpdates // ignore: cast_nullable_to_non_nullable
              as bool,
      collaborationInvites: null == collaborationInvites
          ? _value.collaborationInvites
          : collaborationInvites // ignore: cast_nullable_to_non_nullable
              as bool,
      weeklyDigest: null == weeklyDigest
          ? _value.weeklyDigest
          : weeklyDigest // ignore: cast_nullable_to_non_nullable
              as bool,
      monthlyReport: null == monthlyReport
          ? _value.monthlyReport
          : monthlyReport // ignore: cast_nullable_to_non_nullable
              as bool,
      securityAlerts: null == securityAlerts
          ? _value.securityAlerts
          : securityAlerts // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationSettingsImplCopyWith<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  factory _$$NotificationSettingsImplCopyWith(_$NotificationSettingsImpl value,
          $Res Function(_$NotificationSettingsImpl) then) =
      __$$NotificationSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool email,
      bool push,
      bool treeUpdates,
      bool collaborationInvites,
      bool weeklyDigest,
      bool monthlyReport,
      bool securityAlerts});
}

/// @nodoc
class __$$NotificationSettingsImplCopyWithImpl<$Res>
    extends _$NotificationSettingsCopyWithImpl<$Res, _$NotificationSettingsImpl>
    implements _$$NotificationSettingsImplCopyWith<$Res> {
  __$$NotificationSettingsImplCopyWithImpl(_$NotificationSettingsImpl _value,
      $Res Function(_$NotificationSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? push = null,
    Object? treeUpdates = null,
    Object? collaborationInvites = null,
    Object? weeklyDigest = null,
    Object? monthlyReport = null,
    Object? securityAlerts = null,
  }) {
    return _then(_$NotificationSettingsImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as bool,
      push: null == push
          ? _value.push
          : push // ignore: cast_nullable_to_non_nullable
              as bool,
      treeUpdates: null == treeUpdates
          ? _value.treeUpdates
          : treeUpdates // ignore: cast_nullable_to_non_nullable
              as bool,
      collaborationInvites: null == collaborationInvites
          ? _value.collaborationInvites
          : collaborationInvites // ignore: cast_nullable_to_non_nullable
              as bool,
      weeklyDigest: null == weeklyDigest
          ? _value.weeklyDigest
          : weeklyDigest // ignore: cast_nullable_to_non_nullable
              as bool,
      monthlyReport: null == monthlyReport
          ? _value.monthlyReport
          : monthlyReport // ignore: cast_nullable_to_non_nullable
              as bool,
      securityAlerts: null == securityAlerts
          ? _value.securityAlerts
          : securityAlerts // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSettingsImpl implements _NotificationSettings {
  const _$NotificationSettingsImpl(
      {this.email = true,
      this.push = true,
      this.treeUpdates = true,
      this.collaborationInvites = true,
      this.weeklyDigest = false,
      this.monthlyReport = false,
      this.securityAlerts = true});

  factory _$NotificationSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool email;
  @override
  @JsonKey()
  final bool push;
  @override
  @JsonKey()
  final bool treeUpdates;
  @override
  @JsonKey()
  final bool collaborationInvites;
  @override
  @JsonKey()
  final bool weeklyDigest;
  @override
  @JsonKey()
  final bool monthlyReport;
  @override
  @JsonKey()
  final bool securityAlerts;

  @override
  String toString() {
    return 'NotificationSettings(email: $email, push: $push, treeUpdates: $treeUpdates, collaborationInvites: $collaborationInvites, weeklyDigest: $weeklyDigest, monthlyReport: $monthlyReport, securityAlerts: $securityAlerts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.push, push) || other.push == push) &&
            (identical(other.treeUpdates, treeUpdates) ||
                other.treeUpdates == treeUpdates) &&
            (identical(other.collaborationInvites, collaborationInvites) ||
                other.collaborationInvites == collaborationInvites) &&
            (identical(other.weeklyDigest, weeklyDigest) ||
                other.weeklyDigest == weeklyDigest) &&
            (identical(other.monthlyReport, monthlyReport) ||
                other.monthlyReport == monthlyReport) &&
            (identical(other.securityAlerts, securityAlerts) ||
                other.securityAlerts == securityAlerts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, push, treeUpdates,
      collaborationInvites, weeklyDigest, monthlyReport, securityAlerts);

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
      get copyWith =>
          __$$NotificationSettingsImplCopyWithImpl<_$NotificationSettingsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSettingsImplToJson(
      this,
    );
  }
}

abstract class _NotificationSettings implements NotificationSettings {
  const factory _NotificationSettings(
      {final bool email,
      final bool push,
      final bool treeUpdates,
      final bool collaborationInvites,
      final bool weeklyDigest,
      final bool monthlyReport,
      final bool securityAlerts}) = _$NotificationSettingsImpl;

  factory _NotificationSettings.fromJson(Map<String, dynamic> json) =
      _$NotificationSettingsImpl.fromJson;

  @override
  bool get email;
  @override
  bool get push;
  @override
  bool get treeUpdates;
  @override
  bool get collaborationInvites;
  @override
  bool get weeklyDigest;
  @override
  bool get monthlyReport;
  @override
  bool get securityAlerts;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
