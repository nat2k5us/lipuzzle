import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
class Person with _$Person {
  const factory Person({
    required String id,
    required String treeId,

    // Basic Information
    required String firstName,
    String? middleName,
    String? lastName,
    String? maidenName,
    @Default([]) List<String> nicknames,
    String? suffix, // Jr., Sr., III, etc.
    String? prefix, // Dr., Rev., etc.

    // Demographics
    Gender? gender,
    DateTime? dateOfBirth,
    Place? placeOfBirth,
    DateTime? dateOfDeath,
    Place? placeOfDeath,
    @Default(true) bool isLiving,

    // Additional Information
    String? biography,
    @Default([]) List<String> occupation,
    @Default([]) List<String> education,
    String? religion,
    @Default([]) List<String> ethnicity,

    // Contact (for living relatives)
    String? email,
    String? phoneNumber,
    Address? address,

    // Metadata
    @Default(PrivacyLevel.family) PrivacyLevel privacy,
    String? profilePictureId, // References Media.id
    @Default({}) Map<String, dynamic> customFields,

    // Audit
    required String createdBy,
    required String updatedBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  // Factory for creating a new person
  factory Person.create({
    required String treeId,
    required String firstName,
    String? lastName,
    required String createdBy,
    Gender? gender,
    DateTime? dateOfBirth,
    bool isLiving = true,
  }) {
    final now = DateTime.now();
    return Person(
      id: const Uuid().v4(),
      treeId: treeId,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      dateOfBirth: dateOfBirth,
      isLiving: isLiving,
      createdBy: createdBy,
      updatedBy: createdBy,
      createdAt: now,
      updatedAt: now,
    );
  }
}

// Helper extension for person operations
extension PersonX on Person {
  String get fullName {
    final parts = <String>[];
    if (prefix != null) parts.add(prefix!);
    parts.add(firstName);
    if (middleName != null) parts.add(middleName!);
    if (lastName != null) parts.add(lastName!);
    if (suffix != null) parts.add(suffix!);
    return parts.join(' ');
  }

  String get displayName {
    if (nicknames.isNotEmpty) {
      return '$firstName "${nicknames.first}"${lastName != null ? ' $lastName' : ''}';
    }
    return '$firstName${lastName != null ? ' $lastName' : ''}';
  }

  int? get age {
    if (dateOfBirth == null) return null;
    final endDate = dateOfDeath ?? DateTime.now();
    final age = endDate.difference(dateOfBirth!).inDays ~/ 365;
    return age;
  }

  bool get isDeceased => !isLiving || dateOfDeath != null;

  /// Copy person with updated timestamp
  Person copyWithUpdate({
    String? firstName,
    String? lastName,
    Gender? gender,
    DateTime? dateOfBirth,
    DateTime? dateOfDeath,
    bool? isLiving,
    String? biography,
    PrivacyLevel? privacy,
    String? profilePictureId,
    required String updatedBy,
  }) {
    return copyWith(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      dateOfDeath: dateOfDeath ?? this.dateOfDeath,
      isLiving: isLiving ?? this.isLiving,
      biography: biography ?? this.biography,
      privacy: privacy ?? this.privacy,
      profilePictureId: profilePictureId ?? this.profilePictureId,
      updatedBy: updatedBy,
      updatedAt: DateTime.now(),
    );
  }
}

@freezed
class Place with _$Place {
  const factory Place({
    required String name,
    String? city,
    String? state,
    String? country,
    double? latitude,
    double? longitude,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}

enum Gender {
  @JsonValue('male')
  male,
  @JsonValue('female')
  female,
  @JsonValue('other')
  other,
  @JsonValue('unknown')
  unknown,
}

enum PrivacyLevel {
  @JsonValue('private')
  private,
  @JsonValue('family')
  family,
  @JsonValue('public')
  public,
}

extension GenderX on Gender {
  String get displayName {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.other:
        return 'Other';
      case Gender.unknown:
        return 'Unknown';
    }
  }
}

extension PrivacyLevelX on PrivacyLevel {
  String get displayName {
    switch (this) {
      case PrivacyLevel.private:
        return 'Private';
      case PrivacyLevel.family:
        return 'Family';
      case PrivacyLevel.public:
        return 'Public';
    }
  }

  String get description {
    switch (this) {
      case PrivacyLevel.private:
        return 'Only you can see this information';
      case PrivacyLevel.family:
        return 'Family members can see this information';
      case PrivacyLevel.public:
        return 'Anyone can see this information';
    }
  }
}