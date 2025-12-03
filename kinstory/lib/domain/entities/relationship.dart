import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'place.dart';

part 'relationship.freezed.dart';
part 'relationship.g.dart';

@freezed
class Relationship with _$Relationship {
  const factory Relationship({
    required String id,
    required String treeId,
    required RelationshipType type,

    // Person References
    required String person1Id,
    required String person2Id,

    // Relationship Details
    DateTime? startDate, // Marriage date, adoption date, etc.
    DateTime? endDate, // Divorce date, death of spouse, etc.
    Place? place,
    RelationshipStatus? status,

    // Additional Context
    String? notes,
    @Default({}) Map<String, dynamic> customFields,

    // Audit
    required String createdBy,
    required String updatedBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _Relationship;

  factory Relationship.fromJson(Map<String, dynamic> json) => _$RelationshipFromJson(json);

  // Factory for creating a new relationship
  factory Relationship.create({
    required String treeId,
    required RelationshipType type,
    required String person1Id,
    required String person2Id,
    required String createdBy,
    DateTime? startDate,
    Place? place,
    RelationshipStatus? status,
    String? notes,
  }) {
    final now = DateTime.now();
    return Relationship(
      id: const Uuid().v4(),
      treeId: treeId,
      type: type,
      person1Id: person1Id,
      person2Id: person2Id,
      startDate: startDate,
      place: place,
      status: status ?? _getDefaultStatus(type),
      notes: notes,
      createdBy: createdBy,
      updatedBy: createdBy,
      createdAt: now,
      updatedAt: now,
    );
  }

  // Helper method to get default status for relationship type
  static RelationshipStatus _getDefaultStatus(RelationshipType type) {
    switch (type) {
      case RelationshipType.spouse:
      case RelationshipType.partner:
        return RelationshipStatus.current;
      default:
        return RelationshipStatus.current;
    }
  }
}

enum RelationshipType {
  // Biological
  @JsonValue('biological_parent')
  biologicalParent,
  @JsonValue('biological_child')
  biologicalChild,

  // Adoptive
  @JsonValue('adoptive_parent')
  adoptiveParent,
  @JsonValue('adoptive_child')
  adoptiveChild,

  // Step
  @JsonValue('step_parent')
  stepParent,
  @JsonValue('step_child')
  stepChild,

  // Foster
  @JsonValue('foster_parent')
  fosterParent,
  @JsonValue('foster_child')
  fosterChild,

  // Marriage/Partnership
  @JsonValue('spouse')
  spouse,
  @JsonValue('partner')
  partner,

  // Siblings
  @JsonValue('sibling')
  sibling,
  @JsonValue('half_sibling')
  halfSibling,
  @JsonValue('step_sibling')
  stepSibling,

  // Other
  @JsonValue('guardian')
  guardian,
  @JsonValue('godparent')
  godparent,
}

enum RelationshipStatus {
  @JsonValue('current')
  current,
  @JsonValue('ended')
  ended,
  @JsonValue('divorced')
  divorced,
  @JsonValue('widowed')
  widowed,
  @JsonValue('separated')
  separated,
}

// Extensions for better UX
extension RelationshipTypeX on RelationshipType {
  String get displayName {
    switch (this) {
      case RelationshipType.biologicalParent:
        return 'Biological Parent';
      case RelationshipType.biologicalChild:
        return 'Biological Child';
      case RelationshipType.adoptiveParent:
        return 'Adoptive Parent';
      case RelationshipType.adoptiveChild:
        return 'Adoptive Child';
      case RelationshipType.stepParent:
        return 'Step Parent';
      case RelationshipType.stepChild:
        return 'Step Child';
      case RelationshipType.fosterParent:
        return 'Foster Parent';
      case RelationshipType.fosterChild:
        return 'Foster Child';
      case RelationshipType.spouse:
        return 'Spouse';
      case RelationshipType.partner:
        return 'Partner';
      case RelationshipType.sibling:
        return 'Sibling';
      case RelationshipType.halfSibling:
        return 'Half Sibling';
      case RelationshipType.stepSibling:
        return 'Step Sibling';
      case RelationshipType.guardian:
        return 'Guardian';
      case RelationshipType.godparent:
        return 'Godparent';
    }
  }

  String get shortName {
    switch (this) {
      case RelationshipType.biologicalParent:
        return 'Parent';
      case RelationshipType.biologicalChild:
        return 'Child';
      case RelationshipType.adoptiveParent:
        return 'Parent (Adopted)';
      case RelationshipType.adoptiveChild:
        return 'Child (Adopted)';
      case RelationshipType.stepParent:
        return 'Step Parent';
      case RelationshipType.stepChild:
        return 'Step Child';
      case RelationshipType.fosterParent:
        return 'Foster Parent';
      case RelationshipType.fosterChild:
        return 'Foster Child';
      case RelationshipType.spouse:
        return 'Spouse';
      case RelationshipType.partner:
        return 'Partner';
      case RelationshipType.sibling:
        return 'Sibling';
      case RelationshipType.halfSibling:
        return 'Half Sibling';
      case RelationshipType.stepSibling:
        return 'Step Sibling';
      case RelationshipType.guardian:
        return 'Guardian';
      case RelationshipType.godparent:
        return 'Godparent';
    }
  }

  // Get the inverse relationship type
  RelationshipType get inverse {
    switch (this) {
      case RelationshipType.biologicalParent:
        return RelationshipType.biologicalChild;
      case RelationshipType.biologicalChild:
        return RelationshipType.biologicalParent;
      case RelationshipType.adoptiveParent:
        return RelationshipType.adoptiveChild;
      case RelationshipType.adoptiveChild:
        return RelationshipType.adoptiveParent;
      case RelationshipType.stepParent:
        return RelationshipType.stepChild;
      case RelationshipType.stepChild:
        return RelationshipType.stepParent;
      case RelationshipType.fosterParent:
        return RelationshipType.fosterChild;
      case RelationshipType.fosterChild:
        return RelationshipType.fosterParent;
      case RelationshipType.spouse:
        return RelationshipType.spouse; // Spouse is symmetrical
      case RelationshipType.partner:
        return RelationshipType.partner; // Partner is symmetrical
      case RelationshipType.sibling:
        return RelationshipType.sibling; // Sibling is symmetrical
      case RelationshipType.halfSibling:
        return RelationshipType.halfSibling; // Half sibling is symmetrical
      case RelationshipType.stepSibling:
        return RelationshipType.stepSibling; // Step sibling is symmetrical
      case RelationshipType.guardian:
        return RelationshipType.guardian; // Guardian relationship is complex
      case RelationshipType.godparent:
        return RelationshipType.godparent; // Godparent relationship is complex
    }
  }

  bool get isParentChild {
    switch (this) {
      case RelationshipType.biologicalParent:
      case RelationshipType.biologicalChild:
      case RelationshipType.adoptiveParent:
      case RelationshipType.adoptiveChild:
      case RelationshipType.stepParent:
      case RelationshipType.stepChild:
      case RelationshipType.fosterParent:
      case RelationshipType.fosterChild:
        return true;
      default:
        return false;
    }
  }

  bool get isSpousePartner {
    switch (this) {
      case RelationshipType.spouse:
      case RelationshipType.partner:
        return true;
      default:
        return false;
    }
  }

  bool get isSibling {
    switch (this) {
      case RelationshipType.sibling:
      case RelationshipType.halfSibling:
      case RelationshipType.stepSibling:
        return true;
      default:
        return false;
    }
  }

  bool get isSymmetrical {
    switch (this) {
      case RelationshipType.spouse:
      case RelationshipType.partner:
      case RelationshipType.sibling:
      case RelationshipType.halfSibling:
      case RelationshipType.stepSibling:
        return true;
      default:
        return false;
    }
  }

  /// Get display name from person1's perspective
  String getDisplayNameForPerson1() {
    switch (this) {
      case RelationshipType.biologicalParent:
        return 'Parent of';
      case RelationshipType.biologicalChild:
        return 'Child of';
      case RelationshipType.adoptiveParent:
        return 'Adoptive parent of';
      case RelationshipType.adoptiveChild:
        return 'Adopted child of';
      case RelationshipType.stepParent:
        return 'Step parent of';
      case RelationshipType.stepChild:
        return 'Step child of';
      case RelationshipType.fosterParent:
        return 'Foster parent of';
      case RelationshipType.fosterChild:
        return 'Foster child of';
      case RelationshipType.spouse:
        return 'Married to';
      case RelationshipType.partner:
        return 'Partner of';
      case RelationshipType.sibling:
        return 'Sibling of';
      case RelationshipType.halfSibling:
        return 'Half sibling of';
      case RelationshipType.stepSibling:
        return 'Step sibling of';
      case RelationshipType.guardian:
        return 'Guardian of';
      case RelationshipType.godparent:
        return 'Godparent of';
    }
  }

  /// Get display name from person2's perspective
  String getDisplayNameForPerson2() {
    return inverse.getDisplayNameForPerson1();
  }
}

extension RelationshipStatusX on RelationshipStatus {
  String get displayName {
    switch (this) {
      case RelationshipStatus.current:
        return 'Current';
      case RelationshipStatus.ended:
        return 'Ended';
      case RelationshipStatus.divorced:
        return 'Divorced';
      case RelationshipStatus.widowed:
        return 'Widowed';
      case RelationshipStatus.separated:
        return 'Separated';
    }
  }

  bool get isActive {
    return this == RelationshipStatus.current;
  }
}

// Helper extension for relationship operations
extension RelationshipX on Relationship {
  /// Copy relationship with updated timestamp
  Relationship copyWithUpdate({
    DateTime? startDate,
    DateTime? endDate,
    Place? place,
    RelationshipStatus? status,
    String? notes,
    required String updatedBy,
  }) {
    return copyWith(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      place: place ?? this.place,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      updatedBy: updatedBy,
      updatedAt: DateTime.now(),
    );
  }

  /// Get the other person's ID in this relationship
  String getOtherPersonId(String personId) {
    if (person1Id == personId) {
      return person2Id;
    } else if (person2Id == personId) {
      return person1Id;
    } else {
      throw ArgumentError('Person $personId is not part of this relationship');
    }
  }

  /// Get relationship type from the perspective of a specific person
  RelationshipType getRelationshipTypeForPerson(String personId) {
    if (person1Id == personId) {
      return type;
    } else if (person2Id == personId) {
      return type.inverse;
    } else {
      throw ArgumentError('Person $personId is not part of this relationship');
    }
  }

  /// Check if this relationship involves a specific person
  bool involvesPerson(String personId) {
    return person1Id == personId || person2Id == personId;
  }

  /// Check if this relationship involves both persons
  bool involvesPersons(String person1, String person2) {
    return (person1Id == person1 && person2Id == person2) ||
           (person1Id == person2 && person2Id == person1);
  }

  bool get isDeleted => deletedAt != null;

  bool get isActive => status?.isActive ?? true;

  Duration? get duration {
    if (startDate == null) return null;
    final end = endDate ?? DateTime.now();
    return end.difference(startDate!);
  }
}