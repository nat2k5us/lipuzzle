import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id, // UUID
    required String email, // Unique, required
    required String firstName,
    required String lastName,
    String? profilePictureUrl,
    String? phoneNumber,
    DateTime? dateOfBirth,
    @Default(UserPreferences()) UserPreferences preferences,
    @Default(false) bool emailVerified,
    @Default(false) bool mfaEnabled,
    String? mfaSecret,
    DateTime? lastLoginAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt, // Soft delete
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Factory for creating a new user
  factory User.create({
    required String email,
    required String firstName,
    required String lastName,
    String? profilePictureUrl,
    String? phoneNumber,
    DateTime? dateOfBirth,
    UserPreferences? preferences,
  }) {
    final now = DateTime.now();
    return User(
      id: const Uuid().v4(),
      email: email.toLowerCase().trim(),
      firstName: firstName.trim(),
      lastName: lastName.trim(),
      profilePictureUrl: profilePictureUrl,
      phoneNumber: phoneNumber?.trim(),
      dateOfBirth: dateOfBirth,
      preferences: preferences ?? const UserPreferences(),
      createdAt: now,
      updatedAt: now,
    );
  }
}

@freezed
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    @Default('en') String language, // Default: 'en'
    @Default(ThemeMode.auto) ThemeMode theme,
    @Default('MM/dd/yyyy') String dateFormat,
    @Default(TreeViewMode.vertical) TreeViewMode defaultTreeView,
    @Default(NotificationSettings()) NotificationSettings notifications,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) => _$UserPreferencesFromJson(json);
}

@freezed
class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    @Default(true) bool email,
    @Default(true) bool push,
    @Default(true) bool treeUpdates,
    @Default(true) bool collaborationInvites,
    @Default(false) bool weeklyDigest,
    @Default(false) bool monthlyReport,
    @Default(true) bool securityAlerts,
  }) = _NotificationSettings;

  factory NotificationSettings.fromJson(Map<String, dynamic> json) => _$NotificationSettingsFromJson(json);
}

enum ThemeMode {
  @JsonValue('light')
  light,
  @JsonValue('dark')
  dark,
  @JsonValue('auto')
  auto,
}

enum TreeViewMode {
  @JsonValue('vertical')
  vertical,
  @JsonValue('horizontal')
  horizontal,
  @JsonValue('radial')
  radial,
}

// Extensions for better UX
extension ThemeModeX on ThemeMode {
  String get displayName {
    switch (this) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.auto:
        return 'Auto';
    }
  }

  String get description {
    switch (this) {
      case ThemeMode.light:
        return 'Light theme';
      case ThemeMode.dark:
        return 'Dark theme';
      case ThemeMode.auto:
        return 'Follow system setting';
    }
  }

  String get icon {
    switch (this) {
      case ThemeMode.light:
        return '☀️';
      case ThemeMode.dark:
        return '🌙';
      case ThemeMode.auto:
        return '🤖';
    }
  }
}

extension TreeViewModeX on TreeViewMode {
  String get displayName {
    switch (this) {
      case TreeViewMode.vertical:
        return 'Vertical';
      case TreeViewMode.horizontal:
        return 'Horizontal';
      case TreeViewMode.radial:
        return 'Radial';
    }
  }

  String get description {
    switch (this) {
      case TreeViewMode.vertical:
        return 'Traditional family tree layout';
      case TreeViewMode.horizontal:
        return 'Timeline-style layout';
      case TreeViewMode.radial:
        return 'Circular tree layout';
    }
  }

  String get icon {
    switch (this) {
      case TreeViewMode.vertical:
        return '📊';
      case TreeViewMode.horizontal:
        return '📈';
      case TreeViewMode.radial:
        return '🎯';
    }
  }
}

// Helper extension for user operations
extension UserX on User {
  /// Get full name
  String get fullName => '$firstName $lastName';

  /// Get initials
  String get initials {
    final firstInitial = firstName.isNotEmpty ? firstName[0].toUpperCase() : '';
    final lastInitial = lastName.isNotEmpty ? lastName[0].toUpperCase() : '';
    return '$firstInitial$lastInitial';
  }

  /// Get display name (full name or email)
  String get displayName => fullName.trim().isNotEmpty ? fullName : email;

  /// Copy user with updated timestamp
  User copyWithUpdate({
    String? firstName,
    String? lastName,
    String? profilePictureUrl,
    String? phoneNumber,
    DateTime? dateOfBirth,
    UserPreferences? preferences,
    bool? emailVerified,
    bool? mfaEnabled,
    String? mfaSecret,
    DateTime? lastLoginAt,
  }) {
    return copyWith(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      preferences: preferences ?? this.preferences,
      emailVerified: emailVerified ?? this.emailVerified,
      mfaEnabled: mfaEnabled ?? this.mfaEnabled,
      mfaSecret: mfaSecret ?? this.mfaSecret,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      updatedAt: DateTime.now(),
    );
  }

  /// Mark email as verified
  User verifyEmail() {
    return copyWith(
      emailVerified: true,
      updatedAt: DateTime.now(),
    );
  }

  /// Enable MFA
  User enableMFA(String secret) {
    return copyWith(
      mfaEnabled: true,
      mfaSecret: secret,
      updatedAt: DateTime.now(),
    );
  }

  /// Disable MFA
  User disableMFA() {
    return copyWith(
      mfaEnabled: false,
      mfaSecret: null,
      updatedAt: DateTime.now(),
    );
  }

  /// Update last login
  User updateLastLogin() {
    return copyWith(
      lastLoginAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// Update preferences
  User updatePreferences(UserPreferences newPreferences) {
    return copyWith(
      preferences: newPreferences,
      updatedAt: DateTime.now(),
    );
  }

  bool get isDeleted => deletedAt != null;

  /// Check if user has a profile picture
  bool get hasProfilePicture => profilePictureUrl != null && profilePictureUrl!.isNotEmpty;

  /// Calculate age
  int? get age {
    if (dateOfBirth == null) return null;
    final now = DateTime.now();
    int age = now.year - dateOfBirth!.year;
    if (now.month < dateOfBirth!.month ||
        (now.month == dateOfBirth!.month && now.day < dateOfBirth!.day)) {
      age--;
    }
    return age;
  }

  /// Get account age in days
  int get accountAge {
    return DateTime.now().difference(createdAt).inDays;
  }

  /// Check if account is new (less than 30 days)
  bool get isNewAccount => accountAge < 30;

  /// Get time since last login
  Duration? get timeSinceLastLogin {
    if (lastLoginAt == null) return null;
    return DateTime.now().difference(lastLoginAt!);
  }

  /// Check if user has logged in recently (within 7 days)
  bool get hasRecentLogin {
    final time = timeSinceLastLogin;
    if (time == null) return false;
    return time.inDays < 7;
  }

  /// Check if user is dormant (no login in 90+ days)
  bool get isDormant {
    final time = timeSinceLastLogin;
    if (time == null) return accountAge > 90;
    return time.inDays > 90;
  }

  /// Check if phone number is provided
  bool get hasPhoneNumber => phoneNumber != null && phoneNumber!.isNotEmpty;

  /// Get formatted phone number (basic US formatting)
  String? get formattedPhoneNumber {
    if (!hasPhoneNumber) return null;
    final cleaned = phoneNumber!.replaceAll(RegExp(r'[^\d]'), '');
    if (cleaned.length == 10) {
      return '(${cleaned.substring(0, 3)}) ${cleaned.substring(3, 6)}-${cleaned.substring(6)}';
    }
    if (cleaned.length == 11 && cleaned.startsWith('1')) {
      return '+1 (${cleaned.substring(1, 4)}) ${cleaned.substring(4, 7)}-${cleaned.substring(7)}';
    }
    return phoneNumber;
  }

  /// Get user's timezone based on preferences (placeholder - would need geo data)
  String get timezone => 'UTC'; // Default to UTC, could be enhanced

  /// Check if user has completed profile
  bool get hasCompleteProfile {
    return hasProfilePicture && hasPhoneNumber && dateOfBirth != null;
  }

  /// Get profile completion percentage
  double get profileCompletion {
    int completed = 0;
    const int total = 4; // firstName, lastName, profilePicture, phoneNumber

    completed += 1; // firstName (required)
    completed += 1; // lastName (required)
    if (hasProfilePicture) completed += 1;
    if (hasPhoneNumber) completed += 1;

    return (completed / total) * 100;
  }
}

extension UserPreferencesX on UserPreferences {
  /// Update theme preference
  UserPreferences updateTheme(ThemeMode newTheme) {
    return copyWith(theme: newTheme);
  }

  /// Update language preference
  UserPreferences updateLanguage(String newLanguage) {
    return copyWith(language: newLanguage);
  }

  /// Update date format preference
  UserPreferences updateDateFormat(String newFormat) {
    return copyWith(dateFormat: newFormat);
  }

  /// Update default tree view
  UserPreferences updateTreeView(TreeViewMode newView) {
    return copyWith(defaultTreeView: newView);
  }

  /// Update notification settings
  UserPreferences updateNotifications(NotificationSettings newSettings) {
    return copyWith(notifications: newSettings);
  }

  /// Check if dark mode is enabled
  bool get isDarkMode => theme == ThemeMode.dark;

  /// Check if light mode is enabled
  bool get isLightMode => theme == ThemeMode.light;

  /// Check if auto mode is enabled
  bool get isAutoMode => theme == ThemeMode.auto;

  /// Get formatted date using user's preference
  String formatDate(DateTime date) {
    // This is a simplified implementation - in real app would use intl package
    switch (dateFormat) {
      case 'dd/MM/yyyy':
        return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
      case 'yyyy-MM-dd':
        return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
      case 'MM/dd/yyyy':
      default:
        return '${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}/${date.year}';
    }
  }
}

extension NotificationSettingsX on NotificationSettings {
  /// Enable all notifications
  NotificationSettings enableAll() {
    return copyWith(
      email: true,
      push: true,
      treeUpdates: true,
      collaborationInvites: true,
      weeklyDigest: true,
      monthlyReport: true,
      securityAlerts: true,
    );
  }

  /// Disable all notifications (except security alerts)
  NotificationSettings disableAll() {
    return copyWith(
      email: false,
      push: false,
      treeUpdates: false,
      collaborationInvites: false,
      weeklyDigest: false,
      monthlyReport: false,
      securityAlerts: true, // Keep security alerts enabled
    );
  }

  /// Enable only essential notifications
  NotificationSettings essentialOnly() {
    return copyWith(
      email: true,
      push: false,
      treeUpdates: false,
      collaborationInvites: true,
      weeklyDigest: false,
      monthlyReport: false,
      securityAlerts: true,
    );
  }

  /// Check if any notifications are enabled
  bool get hasAnyEnabled {
    return email || push || treeUpdates || collaborationInvites ||
           weeklyDigest || monthlyReport || securityAlerts;
  }

  /// Check if all notifications are enabled
  bool get hasAllEnabled {
    return email && push && treeUpdates && collaborationInvites &&
           weeklyDigest && monthlyReport && securityAlerts;
  }

  /// Get count of enabled notification types
  int get enabledCount {
    int count = 0;
    if (email) count++;
    if (push) count++;
    if (treeUpdates) count++;
    if (collaborationInvites) count++;
    if (weeklyDigest) count++;
    if (monthlyReport) count++;
    if (securityAlerts) count++;
    return count;
  }
}