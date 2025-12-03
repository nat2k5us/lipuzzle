/// JSON Tree Models for Import/Export functionality
/// These models represent the JSON schema for family tree data

import 'package:freezed_annotation/freezed_annotation.dart';

part 'json_tree_models.freezed.dart';
part 'json_tree_models.g.dart';

/// Root JSON tree document
@freezed
class JsonFamilyTree with _$JsonFamilyTree {
  const factory JsonFamilyTree({
    @JsonKey(name: '\$schema') String? schema,
    required String version,
    required JsonTreeMetadata metadata,
    @JsonKey(name: 'root_persons') List<JsonRootPerson>? rootPersons,
    required List<JsonPerson> persons,
    required List<JsonRelationship> relationships,
    List<JsonLineage>? lineages,
    @JsonKey(name: 'cross_references') List<JsonCrossReference>? crossReferences,
    List<JsonEvent>? events,
    List<JsonPlace>? places,
    JsonValidation? validation,
  }) = _JsonFamilyTree;

  factory JsonFamilyTree.fromJson(Map<String, dynamic> json) =>
      _$JsonFamilyTreeFromJson(json);
}

/// Tree metadata
@freezed
class JsonTreeMetadata with _$JsonTreeMetadata {
  const factory JsonTreeMetadata({
    String? id,
    required String name,
    String? description,
    @JsonKey(defaultValue: 'historical') String type, // mythological|historical|modern
    String? culture,
    String? language,
    String? author,
    List<String>? sources,
    String? createdAt,
    String? updatedAt,
    @JsonKey(name: 'generation_system', defaultValue: 'calculated')
    String generationSystem, // root_based|manual|calculated
  }) = _JsonTreeMetadata;

  factory JsonTreeMetadata.fromJson(Map<String, dynamic> json) =>
      _$JsonTreeMetadataFromJson(json);
}

/// Root person designation
@freezed
class JsonRootPerson with _$JsonRootPerson {
  const factory JsonRootPerson({
    required String id,
    @JsonKey(defaultValue: 0) int generation,
    @JsonKey(name: 'is_origin', defaultValue: true) bool isOrigin,
  }) = _JsonRootPerson;

  factory JsonRootPerson.fromJson(Map<String, dynamic> json) =>
      _$JsonRootPersonFromJson(json);
}

/// Person entity in JSON
@freezed
class JsonPerson with _$JsonPerson {
  const factory JsonPerson({
    required String id,
    @JsonKey(name: 'external_id') String? externalId,
    required JsonPersonNames names,
    JsonPersonDemographics? demographics,
    JsonPersonAttributes? attributes,
    String? biography,
    int? generation,
    @JsonKey(name: 'generation_override') int? generationOverride,
    @JsonKey(name: 'custom_fields') Map<String, dynamic>? customFields,
  }) = _JsonPerson;

  factory JsonPerson.fromJson(Map<String, dynamic> json) =>
      _$JsonPersonFromJson(json);
}

/// Person names structure
@freezed
class JsonPersonNames with _$JsonPersonNames {
  const factory JsonPersonNames({
    required String primary,
    List<String>? alternate,
    String? prefix,
    List<String>? epithets,
  }) = _JsonPersonNames;

  factory JsonPersonNames.fromJson(Map<String, dynamic> json) =>
      _$JsonPersonNamesFromJson(json);
}

/// Person demographics
@freezed
class JsonPersonDemographics with _$JsonPersonDemographics {
  const factory JsonPersonDemographics({
    String? gender, // male|female|divine|unknown
    JsonLifeEvent? birth,
    JsonLifeEvent? death,
    @JsonKey(name: 'is_living', defaultValue: false) bool isLiving,
  }) = _JsonPersonDemographics;

  factory JsonPersonDemographics.fromJson(Map<String, dynamic> json) =>
      _$JsonPersonDemographicsFromJson(json);
}

/// Life event (birth/death)
@freezed
class JsonLifeEvent with _$JsonLifeEvent {
  const factory JsonLifeEvent({
    dynamic date, // Can be string or flexible date object
    String? place,
    String? type, // natural|divine|miraculous|transcendental|battle
  }) = _JsonLifeEvent;

  factory JsonLifeEvent.fromJson(Map<String, dynamic> json) =>
      _$JsonLifeEventFromJson(json);
}

/// Person attributes
@freezed
class JsonPersonAttributes with _$JsonPersonAttributes {
  const factory JsonPersonAttributes({
    @JsonKey(name: 'divine_status') String? divineStatus, // supreme|avatar|deva|asura|human
    List<String>? occupation,
    String? realm, // material|spiritual|celestial
    String? lineage,
    String? dynasty,
  }) = _JsonPersonAttributes;

  factory JsonPersonAttributes.fromJson(Map<String, dynamic> json) =>
      _$JsonPersonAttributesFromJson(json);
}

/// Relationship entity in JSON
@freezed
class JsonRelationship with _$JsonRelationship {
  const factory JsonRelationship({
    required String id,
    required String type, // biological_parent|divine_birth|emanation|spouse|foster_parent
    @JsonKey(name: 'person1_id') required String person1Id,
    @JsonKey(name: 'person2_id') required String person2Id,
    JsonRelationshipMetadata? metadata,
  }) = _JsonRelationship;

  factory JsonRelationship.fromJson(Map<String, dynamic> json) =>
      _$JsonRelationshipFromJson(json);
}

/// Relationship metadata
@freezed
class JsonRelationshipMetadata with _$JsonRelationshipMetadata {
  const factory JsonRelationshipMetadata({
    String? method, // natural|divine_intervention|yogamaya|niyoga
    @JsonKey(name: 'start_date') dynamic startDate,
    @JsonKey(name: 'end_date') dynamic endDate,
    String? place,
    String? notes,
    int? order,
    String? status, // current|ended|widowed
  }) = _JsonRelationshipMetadata;

  factory JsonRelationshipMetadata.fromJson(Map<String, dynamic> json) =>
      _$JsonRelationshipMetadataFromJson(json);
}

/// Lineage/Dynasty entity
@freezed
class JsonLineage with _$JsonLineage {
  const factory JsonLineage({
    required String id,
    required String name,
    @JsonKey(name: 'founder_id') String? founderId,
    String? type, // dynasty|lineage|branch
    @JsonKey(name: 'parent_lineage_id') String? parentLineageId,
    String? description,
    List<String>? persons,
  }) = _JsonLineage;

  factory JsonLineage.fromJson(Map<String, dynamic> json) =>
      _$JsonLineageFromJson(json);
}

/// Cross reference to other trees
@freezed
class JsonCrossReference with _$JsonCrossReference {
  const factory JsonCrossReference({
    @JsonKey(name: 'person_id') required String personId,
    @JsonKey(name: 'external_tree_id') required String externalTreeId,
    String? relationship,
    String? notes,
  }) = _JsonCrossReference;

  factory JsonCrossReference.fromJson(Map<String, dynamic> json) =>
      _$JsonCrossReferenceFromJson(json);
}

/// Event entity
@freezed
class JsonEvent with _$JsonEvent {
  const factory JsonEvent({
    required String id,
    required String title,
    String? description,
    dynamic date,
    String? place,
    @JsonKey(name: 'person_ids') List<String>? personIds,
    List<String>? tags,
    String? category,
  }) = _JsonEvent;

  factory JsonEvent.fromJson(Map<String, dynamic> json) =>
      _$JsonEventFromJson(json);
}

/// Place entity
@freezed
class JsonPlace with _$JsonPlace {
  const factory JsonPlace({
    required String name,
    @JsonKey(name: 'alternate_names') List<String>? alternateNames,
    String? type, // city|kingdom|divine_realm
    JsonLocation? location,
  }) = _JsonPlace;

  factory JsonPlace.fromJson(Map<String, dynamic> json) =>
      _$JsonPlaceFromJson(json);
}

/// Location details
@freezed
class JsonLocation with _$JsonLocation {
  const factory JsonLocation({
    double? latitude,
    double? longitude,
    @JsonKey(name: 'modern_name') String? modernName,
    String? country,
    String? region,
  }) = _JsonLocation;

  factory JsonLocation.fromJson(Map<String, dynamic> json) =>
      _$JsonLocationFromJson(json);
}

/// Validation settings
@freezed
class JsonValidation with _$JsonValidation {
  const factory JsonValidation({
    @JsonKey(name: 'circular_check', defaultValue: true) bool circularCheck,
    @JsonKey(name: 'generation_validation', defaultValue: true) bool generationValidation,
    @JsonKey(name: 'relationship_consistency', defaultValue: true) bool relationshipConsistency,
  }) = _JsonValidation;

  factory JsonValidation.fromJson(Map<String, dynamic> json) =>
      _$JsonValidationFromJson(json);
}

/// Flexible date object for handling various date formats
@freezed
class FlexibleDate with _$FlexibleDate {
  const factory FlexibleDate({
    required String type, // exact|circa|range|unknown|mythological
    int? year,
    int? month,
    int? day,
    String? era, // BCE|CE|Kali_Yuga|Dwapara_Yuga
    String? confidence, // high|medium|low
    String? display,
  }) = _FlexibleDate;

  factory FlexibleDate.fromJson(Map<String, dynamic> json) =>
      _$FlexibleDateFromJson(json);

  const FlexibleDate._();

  /// Parse from various formats
  static FlexibleDate? parse(dynamic value) {
    if (value == null) return null;

    if (value is String) {
      // Try to parse ISO date
      final date = DateTime.tryParse(value);
      if (date != null) {
        return FlexibleDate(
          type: 'exact',
          year: date.year,
          month: date.month,
          day: date.day,
          era: date.year < 0 ? 'BCE' : 'CE',
          confidence: 'high',
          display: value,
        );
      }

      // Check for mythological dates
      if (value.contains('Yuga') || value.contains('-')) {
        return FlexibleDate(
          type: 'mythological',
          display: value,
        );
      }

      return FlexibleDate(
        type: 'unknown',
        display: value,
      );
    }

    if (value is Map<String, dynamic>) {
      return FlexibleDate.fromJson(value);
    }

    return null;
  }

  /// Convert to DateTime if possible
  DateTime? toDateTime() {
    if (type == 'exact' && year != null) {
      try {
        return DateTime(year!, month ?? 1, day ?? 1);
      } catch (_) {
        return null;
      }
    }
    return null;
  }
}