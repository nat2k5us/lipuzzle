import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'tree.freezed.dart';
part 'tree.g.dart';

@freezed
class FamilyTree with _$FamilyTree {
  const factory FamilyTree({
    required String id,
    required String name,
    String? description,
    required String ownerId,
    @Default(TreeVisibility.private) TreeVisibility visibility,
    @Default(TreeSettings()) TreeSettings settings,
    String? coverImageUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _FamilyTree;

  factory FamilyTree.fromJson(Map<String, dynamic> json) => _$FamilyTreeFromJson(json);

  // Factory for creating a new tree
  factory FamilyTree.create({
    required String name,
    required String ownerId,
    String? description,
    TreeVisibility visibility = TreeVisibility.private,
  }) {
    final now = DateTime.now();
    return FamilyTree(
      id: const Uuid().v4(),
      name: name,
      description: description,
      ownerId: ownerId,
      visibility: visibility,
      createdAt: now,
      updatedAt: now,
    );
  }
}

@freezed
class TreeSettings with _$TreeSettings {
  const factory TreeSettings({
    @Default(true) bool allowCollaboration,
    @Default(false) bool requireApprovalForEdits,
    @Default(false) bool showLivingPersonDetails,
    @Default(100) int privacyYearThreshold, // e.g., 100 years
    @Default(PrivacyLevel.family) PrivacyLevel defaultPersonPrivacy,
  }) = _TreeSettings;

  factory TreeSettings.fromJson(Map<String, dynamic> json) => _$TreeSettingsFromJson(json);
}

@freezed
class TreeMember with _$TreeMember {
  const factory TreeMember({
    required String id,
    required String treeId,
    required String userId,
    required TreeRole role,
    required String invitedBy,
    required DateTime invitedAt,
    DateTime? acceptedAt,
    @Default(TreePermissions()) TreePermissions permissions,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TreeMember;

  factory TreeMember.fromJson(Map<String, dynamic> json) => _$TreeMemberFromJson(json);

  // Factory for creating a new member invitation
  factory TreeMember.createInvitation({
    required String treeId,
    required String userId,
    required String invitedBy,
    required TreeRole role,
  }) {
    final now = DateTime.now();
    return TreeMember(
      id: const Uuid().v4(),
      treeId: treeId,
      userId: userId,
      role: role,
      invitedBy: invitedBy,
      invitedAt: now,
      permissions: TreePermissions.fromRole(role),
      createdAt: now,
      updatedAt: now,
    );
  }
}

@freezed
class TreePermissions with _$TreePermissions {
  const factory TreePermissions({
    @Default(false) bool canAddPerson,
    @Default(false) bool canEditPerson,
    @Default(false) bool canDeletePerson,
    @Default(false) bool canAddRelationship,
    @Default(false) bool canEditRelationship,
    @Default(false) bool canDeleteRelationship,
    @Default(false) bool canUploadMedia,
    @Default(false) bool canDeleteMedia,
    @Default(false) bool canInviteMembers,
    @Default(false) bool canEditSettings,
  }) = _TreePermissions;

  factory TreePermissions.fromJson(Map<String, dynamic> json) => _$TreePermissionsFromJson(json);

  // Factory methods for different roles
  factory TreePermissions.fromRole(TreeRole role) {
    switch (role) {
      case TreeRole.owner:
        return const TreePermissions(
          canAddPerson: true,
          canEditPerson: true,
          canDeletePerson: true,
          canAddRelationship: true,
          canEditRelationship: true,
          canDeleteRelationship: true,
          canUploadMedia: true,
          canDeleteMedia: true,
          canInviteMembers: true,
          canEditSettings: true,
        );
      case TreeRole.admin:
        return const TreePermissions(
          canAddPerson: true,
          canEditPerson: true,
          canDeletePerson: true,
          canAddRelationship: true,
          canEditRelationship: true,
          canDeleteRelationship: true,
          canUploadMedia: true,
          canDeleteMedia: true,
          canInviteMembers: true,
          canEditSettings: false,
        );
      case TreeRole.editor:
        return const TreePermissions(
          canAddPerson: true,
          canEditPerson: true,
          canDeletePerson: false,
          canAddRelationship: true,
          canEditRelationship: true,
          canDeleteRelationship: false,
          canUploadMedia: true,
          canDeleteMedia: false,
          canInviteMembers: false,
          canEditSettings: false,
        );
      case TreeRole.viewer:
        return const TreePermissions();
    }
  }
}

enum TreeVisibility {
  @JsonValue('private')
  private,
  @JsonValue('family')
  family,
  @JsonValue('public')
  public,
}

enum TreeRole {
  @JsonValue('owner')
  owner,
  @JsonValue('admin')
  admin,
  @JsonValue('editor')
  editor,
  @JsonValue('viewer')
  viewer,
}

enum PrivacyLevel {
  @JsonValue('private')
  private,
  @JsonValue('family')
  family,
  @JsonValue('public')
  public,
}

// Extensions for better UX
extension TreeVisibilityX on TreeVisibility {
  String get displayName {
    switch (this) {
      case TreeVisibility.private:
        return 'Private';
      case TreeVisibility.family:
        return 'Family';
      case TreeVisibility.public:
        return 'Public';
    }
  }

  String get description {
    switch (this) {
      case TreeVisibility.private:
        return 'Only invited members can view';
      case TreeVisibility.family:
        return 'Family members can view with link';
      case TreeVisibility.public:
        return 'Anyone can find and view';
    }
  }
}

extension TreeRoleX on TreeRole {
  String get displayName {
    switch (this) {
      case TreeRole.owner:
        return 'Owner';
      case TreeRole.admin:
        return 'Admin';
      case TreeRole.editor:
        return 'Editor';
      case TreeRole.viewer:
        return 'Viewer';
    }
  }

  String get description {
    switch (this) {
      case TreeRole.owner:
        return 'Full control over the tree';
      case TreeRole.admin:
        return 'Can edit and manage members';
      case TreeRole.editor:
        return 'Can add and edit people';
      case TreeRole.viewer:
        return 'Can only view the tree';
    }
  }

  int get priority {
    switch (this) {
      case TreeRole.owner:
        return 4;
      case TreeRole.admin:
        return 3;
      case TreeRole.editor:
        return 2;
      case TreeRole.viewer:
        return 1;
    }
  }
}

// Helper extension for tree operations
extension FamilyTreeX on FamilyTree {
  /// Copy tree with updated timestamp
  FamilyTree copyWithUpdate({
    String? name,
    String? description,
    TreeVisibility? visibility,
    TreeSettings? settings,
    String? coverImageUrl,
  }) {
    return copyWith(
      name: name ?? this.name,
      description: description ?? this.description,
      visibility: visibility ?? this.visibility,
      settings: settings ?? this.settings,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      updatedAt: DateTime.now(),
    );
  }

  bool get isDeleted => deletedAt != null;
}

extension TreeMemberX on TreeMember {
  bool get isAccepted => acceptedAt != null;
  bool get isPending => acceptedAt == null;

  Duration get membershipDuration {
    final endDate = DateTime.now();
    final startDate = acceptedAt ?? invitedAt;
    return endDate.difference(startDate);
  }
}