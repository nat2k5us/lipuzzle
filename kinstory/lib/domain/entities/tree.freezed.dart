// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FamilyTree _$FamilyTreeFromJson(Map<String, dynamic> json) {
  return _FamilyTree.fromJson(json);
}

/// @nodoc
mixin _$FamilyTree {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  TreeVisibility get visibility => throw _privateConstructorUsedError;
  TreeSettings get settings => throw _privateConstructorUsedError;
  String? get coverImageUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this FamilyTree to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FamilyTree
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FamilyTreeCopyWith<FamilyTree> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FamilyTreeCopyWith<$Res> {
  factory $FamilyTreeCopyWith(
          FamilyTree value, $Res Function(FamilyTree) then) =
      _$FamilyTreeCopyWithImpl<$Res, FamilyTree>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String ownerId,
      TreeVisibility visibility,
      TreeSettings settings,
      String? coverImageUrl,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  $TreeSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$FamilyTreeCopyWithImpl<$Res, $Val extends FamilyTree>
    implements $FamilyTreeCopyWith<$Res> {
  _$FamilyTreeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FamilyTree
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? ownerId = null,
    Object? visibility = null,
    Object? settings = null,
    Object? coverImageUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as TreeVisibility,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as TreeSettings,
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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

  /// Create a copy of FamilyTree
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TreeSettingsCopyWith<$Res> get settings {
    return $TreeSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FamilyTreeImplCopyWith<$Res>
    implements $FamilyTreeCopyWith<$Res> {
  factory _$$FamilyTreeImplCopyWith(
          _$FamilyTreeImpl value, $Res Function(_$FamilyTreeImpl) then) =
      __$$FamilyTreeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String ownerId,
      TreeVisibility visibility,
      TreeSettings settings,
      String? coverImageUrl,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  @override
  $TreeSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$FamilyTreeImplCopyWithImpl<$Res>
    extends _$FamilyTreeCopyWithImpl<$Res, _$FamilyTreeImpl>
    implements _$$FamilyTreeImplCopyWith<$Res> {
  __$$FamilyTreeImplCopyWithImpl(
      _$FamilyTreeImpl _value, $Res Function(_$FamilyTreeImpl) _then)
      : super(_value, _then);

  /// Create a copy of FamilyTree
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? ownerId = null,
    Object? visibility = null,
    Object? settings = null,
    Object? coverImageUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$FamilyTreeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as TreeVisibility,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as TreeSettings,
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$FamilyTreeImpl implements _FamilyTree {
  const _$FamilyTreeImpl(
      {required this.id,
      required this.name,
      this.description,
      required this.ownerId,
      this.visibility = TreeVisibility.private,
      this.settings = const TreeSettings(),
      this.coverImageUrl,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});

  factory _$FamilyTreeImpl.fromJson(Map<String, dynamic> json) =>
      _$$FamilyTreeImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String ownerId;
  @override
  @JsonKey()
  final TreeVisibility visibility;
  @override
  @JsonKey()
  final TreeSettings settings;
  @override
  final String? coverImageUrl;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'FamilyTree(id: $id, name: $name, description: $description, ownerId: $ownerId, visibility: $visibility, settings: $settings, coverImageUrl: $coverImageUrl, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FamilyTreeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, ownerId,
      visibility, settings, coverImageUrl, createdAt, updatedAt, deletedAt);

  /// Create a copy of FamilyTree
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FamilyTreeImplCopyWith<_$FamilyTreeImpl> get copyWith =>
      __$$FamilyTreeImplCopyWithImpl<_$FamilyTreeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FamilyTreeImplToJson(
      this,
    );
  }
}

abstract class _FamilyTree implements FamilyTree {
  const factory _FamilyTree(
      {required final String id,
      required final String name,
      final String? description,
      required final String ownerId,
      final TreeVisibility visibility,
      final TreeSettings settings,
      final String? coverImageUrl,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final DateTime? deletedAt}) = _$FamilyTreeImpl;

  factory _FamilyTree.fromJson(Map<String, dynamic> json) =
      _$FamilyTreeImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String get ownerId;
  @override
  TreeVisibility get visibility;
  @override
  TreeSettings get settings;
  @override
  String? get coverImageUrl;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of FamilyTree
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FamilyTreeImplCopyWith<_$FamilyTreeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TreeSettings _$TreeSettingsFromJson(Map<String, dynamic> json) {
  return _TreeSettings.fromJson(json);
}

/// @nodoc
mixin _$TreeSettings {
  bool get allowCollaboration => throw _privateConstructorUsedError;
  bool get requireApprovalForEdits => throw _privateConstructorUsedError;
  bool get showLivingPersonDetails => throw _privateConstructorUsedError;
  int get privacyYearThreshold =>
      throw _privateConstructorUsedError; // e.g., 100 years
  PrivacyLevel get defaultPersonPrivacy => throw _privateConstructorUsedError;

  /// Serializes this TreeSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TreeSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreeSettingsCopyWith<TreeSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeSettingsCopyWith<$Res> {
  factory $TreeSettingsCopyWith(
          TreeSettings value, $Res Function(TreeSettings) then) =
      _$TreeSettingsCopyWithImpl<$Res, TreeSettings>;
  @useResult
  $Res call(
      {bool allowCollaboration,
      bool requireApprovalForEdits,
      bool showLivingPersonDetails,
      int privacyYearThreshold,
      PrivacyLevel defaultPersonPrivacy});
}

/// @nodoc
class _$TreeSettingsCopyWithImpl<$Res, $Val extends TreeSettings>
    implements $TreeSettingsCopyWith<$Res> {
  _$TreeSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreeSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowCollaboration = null,
    Object? requireApprovalForEdits = null,
    Object? showLivingPersonDetails = null,
    Object? privacyYearThreshold = null,
    Object? defaultPersonPrivacy = null,
  }) {
    return _then(_value.copyWith(
      allowCollaboration: null == allowCollaboration
          ? _value.allowCollaboration
          : allowCollaboration // ignore: cast_nullable_to_non_nullable
              as bool,
      requireApprovalForEdits: null == requireApprovalForEdits
          ? _value.requireApprovalForEdits
          : requireApprovalForEdits // ignore: cast_nullable_to_non_nullable
              as bool,
      showLivingPersonDetails: null == showLivingPersonDetails
          ? _value.showLivingPersonDetails
          : showLivingPersonDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      privacyYearThreshold: null == privacyYearThreshold
          ? _value.privacyYearThreshold
          : privacyYearThreshold // ignore: cast_nullable_to_non_nullable
              as int,
      defaultPersonPrivacy: null == defaultPersonPrivacy
          ? _value.defaultPersonPrivacy
          : defaultPersonPrivacy // ignore: cast_nullable_to_non_nullable
              as PrivacyLevel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TreeSettingsImplCopyWith<$Res>
    implements $TreeSettingsCopyWith<$Res> {
  factory _$$TreeSettingsImplCopyWith(
          _$TreeSettingsImpl value, $Res Function(_$TreeSettingsImpl) then) =
      __$$TreeSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool allowCollaboration,
      bool requireApprovalForEdits,
      bool showLivingPersonDetails,
      int privacyYearThreshold,
      PrivacyLevel defaultPersonPrivacy});
}

/// @nodoc
class __$$TreeSettingsImplCopyWithImpl<$Res>
    extends _$TreeSettingsCopyWithImpl<$Res, _$TreeSettingsImpl>
    implements _$$TreeSettingsImplCopyWith<$Res> {
  __$$TreeSettingsImplCopyWithImpl(
      _$TreeSettingsImpl _value, $Res Function(_$TreeSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TreeSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowCollaboration = null,
    Object? requireApprovalForEdits = null,
    Object? showLivingPersonDetails = null,
    Object? privacyYearThreshold = null,
    Object? defaultPersonPrivacy = null,
  }) {
    return _then(_$TreeSettingsImpl(
      allowCollaboration: null == allowCollaboration
          ? _value.allowCollaboration
          : allowCollaboration // ignore: cast_nullable_to_non_nullable
              as bool,
      requireApprovalForEdits: null == requireApprovalForEdits
          ? _value.requireApprovalForEdits
          : requireApprovalForEdits // ignore: cast_nullable_to_non_nullable
              as bool,
      showLivingPersonDetails: null == showLivingPersonDetails
          ? _value.showLivingPersonDetails
          : showLivingPersonDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      privacyYearThreshold: null == privacyYearThreshold
          ? _value.privacyYearThreshold
          : privacyYearThreshold // ignore: cast_nullable_to_non_nullable
              as int,
      defaultPersonPrivacy: null == defaultPersonPrivacy
          ? _value.defaultPersonPrivacy
          : defaultPersonPrivacy // ignore: cast_nullable_to_non_nullable
              as PrivacyLevel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TreeSettingsImpl implements _TreeSettings {
  const _$TreeSettingsImpl(
      {this.allowCollaboration = true,
      this.requireApprovalForEdits = false,
      this.showLivingPersonDetails = false,
      this.privacyYearThreshold = 100,
      this.defaultPersonPrivacy = PrivacyLevel.family});

  factory _$TreeSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreeSettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool allowCollaboration;
  @override
  @JsonKey()
  final bool requireApprovalForEdits;
  @override
  @JsonKey()
  final bool showLivingPersonDetails;
  @override
  @JsonKey()
  final int privacyYearThreshold;
// e.g., 100 years
  @override
  @JsonKey()
  final PrivacyLevel defaultPersonPrivacy;

  @override
  String toString() {
    return 'TreeSettings(allowCollaboration: $allowCollaboration, requireApprovalForEdits: $requireApprovalForEdits, showLivingPersonDetails: $showLivingPersonDetails, privacyYearThreshold: $privacyYearThreshold, defaultPersonPrivacy: $defaultPersonPrivacy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeSettingsImpl &&
            (identical(other.allowCollaboration, allowCollaboration) ||
                other.allowCollaboration == allowCollaboration) &&
            (identical(
                    other.requireApprovalForEdits, requireApprovalForEdits) ||
                other.requireApprovalForEdits == requireApprovalForEdits) &&
            (identical(
                    other.showLivingPersonDetails, showLivingPersonDetails) ||
                other.showLivingPersonDetails == showLivingPersonDetails) &&
            (identical(other.privacyYearThreshold, privacyYearThreshold) ||
                other.privacyYearThreshold == privacyYearThreshold) &&
            (identical(other.defaultPersonPrivacy, defaultPersonPrivacy) ||
                other.defaultPersonPrivacy == defaultPersonPrivacy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      allowCollaboration,
      requireApprovalForEdits,
      showLivingPersonDetails,
      privacyYearThreshold,
      defaultPersonPrivacy);

  /// Create a copy of TreeSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeSettingsImplCopyWith<_$TreeSettingsImpl> get copyWith =>
      __$$TreeSettingsImplCopyWithImpl<_$TreeSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TreeSettingsImplToJson(
      this,
    );
  }
}

abstract class _TreeSettings implements TreeSettings {
  const factory _TreeSettings(
      {final bool allowCollaboration,
      final bool requireApprovalForEdits,
      final bool showLivingPersonDetails,
      final int privacyYearThreshold,
      final PrivacyLevel defaultPersonPrivacy}) = _$TreeSettingsImpl;

  factory _TreeSettings.fromJson(Map<String, dynamic> json) =
      _$TreeSettingsImpl.fromJson;

  @override
  bool get allowCollaboration;
  @override
  bool get requireApprovalForEdits;
  @override
  bool get showLivingPersonDetails;
  @override
  int get privacyYearThreshold; // e.g., 100 years
  @override
  PrivacyLevel get defaultPersonPrivacy;

  /// Create a copy of TreeSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreeSettingsImplCopyWith<_$TreeSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TreeMember _$TreeMemberFromJson(Map<String, dynamic> json) {
  return _TreeMember.fromJson(json);
}

/// @nodoc
mixin _$TreeMember {
  String get id => throw _privateConstructorUsedError;
  String get treeId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  TreeRole get role => throw _privateConstructorUsedError;
  String get invitedBy => throw _privateConstructorUsedError;
  DateTime get invitedAt => throw _privateConstructorUsedError;
  DateTime? get acceptedAt => throw _privateConstructorUsedError;
  TreePermissions get permissions => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TreeMember to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TreeMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreeMemberCopyWith<TreeMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeMemberCopyWith<$Res> {
  factory $TreeMemberCopyWith(
          TreeMember value, $Res Function(TreeMember) then) =
      _$TreeMemberCopyWithImpl<$Res, TreeMember>;
  @useResult
  $Res call(
      {String id,
      String treeId,
      String userId,
      TreeRole role,
      String invitedBy,
      DateTime invitedAt,
      DateTime? acceptedAt,
      TreePermissions permissions,
      DateTime createdAt,
      DateTime updatedAt});

  $TreePermissionsCopyWith<$Res> get permissions;
}

/// @nodoc
class _$TreeMemberCopyWithImpl<$Res, $Val extends TreeMember>
    implements $TreeMemberCopyWith<$Res> {
  _$TreeMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreeMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? treeId = null,
    Object? userId = null,
    Object? role = null,
    Object? invitedBy = null,
    Object? invitedAt = null,
    Object? acceptedAt = freezed,
    Object? permissions = null,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as TreeRole,
      invitedBy: null == invitedBy
          ? _value.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as String,
      invitedAt: null == invitedAt
          ? _value.invitedAt
          : invitedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      acceptedAt: freezed == acceptedAt
          ? _value.acceptedAt
          : acceptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as TreePermissions,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of TreeMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TreePermissionsCopyWith<$Res> get permissions {
    return $TreePermissionsCopyWith<$Res>(_value.permissions, (value) {
      return _then(_value.copyWith(permissions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TreeMemberImplCopyWith<$Res>
    implements $TreeMemberCopyWith<$Res> {
  factory _$$TreeMemberImplCopyWith(
          _$TreeMemberImpl value, $Res Function(_$TreeMemberImpl) then) =
      __$$TreeMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String treeId,
      String userId,
      TreeRole role,
      String invitedBy,
      DateTime invitedAt,
      DateTime? acceptedAt,
      TreePermissions permissions,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $TreePermissionsCopyWith<$Res> get permissions;
}

/// @nodoc
class __$$TreeMemberImplCopyWithImpl<$Res>
    extends _$TreeMemberCopyWithImpl<$Res, _$TreeMemberImpl>
    implements _$$TreeMemberImplCopyWith<$Res> {
  __$$TreeMemberImplCopyWithImpl(
      _$TreeMemberImpl _value, $Res Function(_$TreeMemberImpl) _then)
      : super(_value, _then);

  /// Create a copy of TreeMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? treeId = null,
    Object? userId = null,
    Object? role = null,
    Object? invitedBy = null,
    Object? invitedAt = null,
    Object? acceptedAt = freezed,
    Object? permissions = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$TreeMemberImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      treeId: null == treeId
          ? _value.treeId
          : treeId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as TreeRole,
      invitedBy: null == invitedBy
          ? _value.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as String,
      invitedAt: null == invitedAt
          ? _value.invitedAt
          : invitedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      acceptedAt: freezed == acceptedAt
          ? _value.acceptedAt
          : acceptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as TreePermissions,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TreeMemberImpl implements _TreeMember {
  const _$TreeMemberImpl(
      {required this.id,
      required this.treeId,
      required this.userId,
      required this.role,
      required this.invitedBy,
      required this.invitedAt,
      this.acceptedAt,
      this.permissions = const TreePermissions(),
      required this.createdAt,
      required this.updatedAt});

  factory _$TreeMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreeMemberImplFromJson(json);

  @override
  final String id;
  @override
  final String treeId;
  @override
  final String userId;
  @override
  final TreeRole role;
  @override
  final String invitedBy;
  @override
  final DateTime invitedAt;
  @override
  final DateTime? acceptedAt;
  @override
  @JsonKey()
  final TreePermissions permissions;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'TreeMember(id: $id, treeId: $treeId, userId: $userId, role: $role, invitedBy: $invitedBy, invitedAt: $invitedAt, acceptedAt: $acceptedAt, permissions: $permissions, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeMemberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.treeId, treeId) || other.treeId == treeId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.invitedBy, invitedBy) ||
                other.invitedBy == invitedBy) &&
            (identical(other.invitedAt, invitedAt) ||
                other.invitedAt == invitedAt) &&
            (identical(other.acceptedAt, acceptedAt) ||
                other.acceptedAt == acceptedAt) &&
            (identical(other.permissions, permissions) ||
                other.permissions == permissions) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, treeId, userId, role,
      invitedBy, invitedAt, acceptedAt, permissions, createdAt, updatedAt);

  /// Create a copy of TreeMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeMemberImplCopyWith<_$TreeMemberImpl> get copyWith =>
      __$$TreeMemberImplCopyWithImpl<_$TreeMemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TreeMemberImplToJson(
      this,
    );
  }
}

abstract class _TreeMember implements TreeMember {
  const factory _TreeMember(
      {required final String id,
      required final String treeId,
      required final String userId,
      required final TreeRole role,
      required final String invitedBy,
      required final DateTime invitedAt,
      final DateTime? acceptedAt,
      final TreePermissions permissions,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$TreeMemberImpl;

  factory _TreeMember.fromJson(Map<String, dynamic> json) =
      _$TreeMemberImpl.fromJson;

  @override
  String get id;
  @override
  String get treeId;
  @override
  String get userId;
  @override
  TreeRole get role;
  @override
  String get invitedBy;
  @override
  DateTime get invitedAt;
  @override
  DateTime? get acceptedAt;
  @override
  TreePermissions get permissions;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of TreeMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreeMemberImplCopyWith<_$TreeMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TreePermissions _$TreePermissionsFromJson(Map<String, dynamic> json) {
  return _TreePermissions.fromJson(json);
}

/// @nodoc
mixin _$TreePermissions {
  bool get canAddPerson => throw _privateConstructorUsedError;
  bool get canEditPerson => throw _privateConstructorUsedError;
  bool get canDeletePerson => throw _privateConstructorUsedError;
  bool get canAddRelationship => throw _privateConstructorUsedError;
  bool get canEditRelationship => throw _privateConstructorUsedError;
  bool get canDeleteRelationship => throw _privateConstructorUsedError;
  bool get canUploadMedia => throw _privateConstructorUsedError;
  bool get canDeleteMedia => throw _privateConstructorUsedError;
  bool get canInviteMembers => throw _privateConstructorUsedError;
  bool get canEditSettings => throw _privateConstructorUsedError;

  /// Serializes this TreePermissions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TreePermissions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreePermissionsCopyWith<TreePermissions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreePermissionsCopyWith<$Res> {
  factory $TreePermissionsCopyWith(
          TreePermissions value, $Res Function(TreePermissions) then) =
      _$TreePermissionsCopyWithImpl<$Res, TreePermissions>;
  @useResult
  $Res call(
      {bool canAddPerson,
      bool canEditPerson,
      bool canDeletePerson,
      bool canAddRelationship,
      bool canEditRelationship,
      bool canDeleteRelationship,
      bool canUploadMedia,
      bool canDeleteMedia,
      bool canInviteMembers,
      bool canEditSettings});
}

/// @nodoc
class _$TreePermissionsCopyWithImpl<$Res, $Val extends TreePermissions>
    implements $TreePermissionsCopyWith<$Res> {
  _$TreePermissionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreePermissions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canAddPerson = null,
    Object? canEditPerson = null,
    Object? canDeletePerson = null,
    Object? canAddRelationship = null,
    Object? canEditRelationship = null,
    Object? canDeleteRelationship = null,
    Object? canUploadMedia = null,
    Object? canDeleteMedia = null,
    Object? canInviteMembers = null,
    Object? canEditSettings = null,
  }) {
    return _then(_value.copyWith(
      canAddPerson: null == canAddPerson
          ? _value.canAddPerson
          : canAddPerson // ignore: cast_nullable_to_non_nullable
              as bool,
      canEditPerson: null == canEditPerson
          ? _value.canEditPerson
          : canEditPerson // ignore: cast_nullable_to_non_nullable
              as bool,
      canDeletePerson: null == canDeletePerson
          ? _value.canDeletePerson
          : canDeletePerson // ignore: cast_nullable_to_non_nullable
              as bool,
      canAddRelationship: null == canAddRelationship
          ? _value.canAddRelationship
          : canAddRelationship // ignore: cast_nullable_to_non_nullable
              as bool,
      canEditRelationship: null == canEditRelationship
          ? _value.canEditRelationship
          : canEditRelationship // ignore: cast_nullable_to_non_nullable
              as bool,
      canDeleteRelationship: null == canDeleteRelationship
          ? _value.canDeleteRelationship
          : canDeleteRelationship // ignore: cast_nullable_to_non_nullable
              as bool,
      canUploadMedia: null == canUploadMedia
          ? _value.canUploadMedia
          : canUploadMedia // ignore: cast_nullable_to_non_nullable
              as bool,
      canDeleteMedia: null == canDeleteMedia
          ? _value.canDeleteMedia
          : canDeleteMedia // ignore: cast_nullable_to_non_nullable
              as bool,
      canInviteMembers: null == canInviteMembers
          ? _value.canInviteMembers
          : canInviteMembers // ignore: cast_nullable_to_non_nullable
              as bool,
      canEditSettings: null == canEditSettings
          ? _value.canEditSettings
          : canEditSettings // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TreePermissionsImplCopyWith<$Res>
    implements $TreePermissionsCopyWith<$Res> {
  factory _$$TreePermissionsImplCopyWith(_$TreePermissionsImpl value,
          $Res Function(_$TreePermissionsImpl) then) =
      __$$TreePermissionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool canAddPerson,
      bool canEditPerson,
      bool canDeletePerson,
      bool canAddRelationship,
      bool canEditRelationship,
      bool canDeleteRelationship,
      bool canUploadMedia,
      bool canDeleteMedia,
      bool canInviteMembers,
      bool canEditSettings});
}

/// @nodoc
class __$$TreePermissionsImplCopyWithImpl<$Res>
    extends _$TreePermissionsCopyWithImpl<$Res, _$TreePermissionsImpl>
    implements _$$TreePermissionsImplCopyWith<$Res> {
  __$$TreePermissionsImplCopyWithImpl(
      _$TreePermissionsImpl _value, $Res Function(_$TreePermissionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TreePermissions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canAddPerson = null,
    Object? canEditPerson = null,
    Object? canDeletePerson = null,
    Object? canAddRelationship = null,
    Object? canEditRelationship = null,
    Object? canDeleteRelationship = null,
    Object? canUploadMedia = null,
    Object? canDeleteMedia = null,
    Object? canInviteMembers = null,
    Object? canEditSettings = null,
  }) {
    return _then(_$TreePermissionsImpl(
      canAddPerson: null == canAddPerson
          ? _value.canAddPerson
          : canAddPerson // ignore: cast_nullable_to_non_nullable
              as bool,
      canEditPerson: null == canEditPerson
          ? _value.canEditPerson
          : canEditPerson // ignore: cast_nullable_to_non_nullable
              as bool,
      canDeletePerson: null == canDeletePerson
          ? _value.canDeletePerson
          : canDeletePerson // ignore: cast_nullable_to_non_nullable
              as bool,
      canAddRelationship: null == canAddRelationship
          ? _value.canAddRelationship
          : canAddRelationship // ignore: cast_nullable_to_non_nullable
              as bool,
      canEditRelationship: null == canEditRelationship
          ? _value.canEditRelationship
          : canEditRelationship // ignore: cast_nullable_to_non_nullable
              as bool,
      canDeleteRelationship: null == canDeleteRelationship
          ? _value.canDeleteRelationship
          : canDeleteRelationship // ignore: cast_nullable_to_non_nullable
              as bool,
      canUploadMedia: null == canUploadMedia
          ? _value.canUploadMedia
          : canUploadMedia // ignore: cast_nullable_to_non_nullable
              as bool,
      canDeleteMedia: null == canDeleteMedia
          ? _value.canDeleteMedia
          : canDeleteMedia // ignore: cast_nullable_to_non_nullable
              as bool,
      canInviteMembers: null == canInviteMembers
          ? _value.canInviteMembers
          : canInviteMembers // ignore: cast_nullable_to_non_nullable
              as bool,
      canEditSettings: null == canEditSettings
          ? _value.canEditSettings
          : canEditSettings // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TreePermissionsImpl implements _TreePermissions {
  const _$TreePermissionsImpl(
      {this.canAddPerson = false,
      this.canEditPerson = false,
      this.canDeletePerson = false,
      this.canAddRelationship = false,
      this.canEditRelationship = false,
      this.canDeleteRelationship = false,
      this.canUploadMedia = false,
      this.canDeleteMedia = false,
      this.canInviteMembers = false,
      this.canEditSettings = false});

  factory _$TreePermissionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreePermissionsImplFromJson(json);

  @override
  @JsonKey()
  final bool canAddPerson;
  @override
  @JsonKey()
  final bool canEditPerson;
  @override
  @JsonKey()
  final bool canDeletePerson;
  @override
  @JsonKey()
  final bool canAddRelationship;
  @override
  @JsonKey()
  final bool canEditRelationship;
  @override
  @JsonKey()
  final bool canDeleteRelationship;
  @override
  @JsonKey()
  final bool canUploadMedia;
  @override
  @JsonKey()
  final bool canDeleteMedia;
  @override
  @JsonKey()
  final bool canInviteMembers;
  @override
  @JsonKey()
  final bool canEditSettings;

  @override
  String toString() {
    return 'TreePermissions(canAddPerson: $canAddPerson, canEditPerson: $canEditPerson, canDeletePerson: $canDeletePerson, canAddRelationship: $canAddRelationship, canEditRelationship: $canEditRelationship, canDeleteRelationship: $canDeleteRelationship, canUploadMedia: $canUploadMedia, canDeleteMedia: $canDeleteMedia, canInviteMembers: $canInviteMembers, canEditSettings: $canEditSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreePermissionsImpl &&
            (identical(other.canAddPerson, canAddPerson) ||
                other.canAddPerson == canAddPerson) &&
            (identical(other.canEditPerson, canEditPerson) ||
                other.canEditPerson == canEditPerson) &&
            (identical(other.canDeletePerson, canDeletePerson) ||
                other.canDeletePerson == canDeletePerson) &&
            (identical(other.canAddRelationship, canAddRelationship) ||
                other.canAddRelationship == canAddRelationship) &&
            (identical(other.canEditRelationship, canEditRelationship) ||
                other.canEditRelationship == canEditRelationship) &&
            (identical(other.canDeleteRelationship, canDeleteRelationship) ||
                other.canDeleteRelationship == canDeleteRelationship) &&
            (identical(other.canUploadMedia, canUploadMedia) ||
                other.canUploadMedia == canUploadMedia) &&
            (identical(other.canDeleteMedia, canDeleteMedia) ||
                other.canDeleteMedia == canDeleteMedia) &&
            (identical(other.canInviteMembers, canInviteMembers) ||
                other.canInviteMembers == canInviteMembers) &&
            (identical(other.canEditSettings, canEditSettings) ||
                other.canEditSettings == canEditSettings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      canAddPerson,
      canEditPerson,
      canDeletePerson,
      canAddRelationship,
      canEditRelationship,
      canDeleteRelationship,
      canUploadMedia,
      canDeleteMedia,
      canInviteMembers,
      canEditSettings);

  /// Create a copy of TreePermissions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreePermissionsImplCopyWith<_$TreePermissionsImpl> get copyWith =>
      __$$TreePermissionsImplCopyWithImpl<_$TreePermissionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TreePermissionsImplToJson(
      this,
    );
  }
}

abstract class _TreePermissions implements TreePermissions {
  const factory _TreePermissions(
      {final bool canAddPerson,
      final bool canEditPerson,
      final bool canDeletePerson,
      final bool canAddRelationship,
      final bool canEditRelationship,
      final bool canDeleteRelationship,
      final bool canUploadMedia,
      final bool canDeleteMedia,
      final bool canInviteMembers,
      final bool canEditSettings}) = _$TreePermissionsImpl;

  factory _TreePermissions.fromJson(Map<String, dynamic> json) =
      _$TreePermissionsImpl.fromJson;

  @override
  bool get canAddPerson;
  @override
  bool get canEditPerson;
  @override
  bool get canDeletePerson;
  @override
  bool get canAddRelationship;
  @override
  bool get canEditRelationship;
  @override
  bool get canDeleteRelationship;
  @override
  bool get canUploadMedia;
  @override
  bool get canDeleteMedia;
  @override
  bool get canInviteMembers;
  @override
  bool get canEditSettings;

  /// Create a copy of TreePermissions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreePermissionsImplCopyWith<_$TreePermissionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
