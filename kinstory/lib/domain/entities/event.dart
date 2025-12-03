import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'place.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class FamilyEvent with _$FamilyEvent {
  const factory FamilyEvent({
    required String id,
    required String treeId,
    required EventType type,
    required String title,
    String? description,

    // Timing
    DateTime? date,
    @Default(DateAccuracy.exact) DateAccuracy dateAccuracy,
    DateTime? endDate, // For events with duration

    // Location
    Place? place,

    // Participants
    required String primaryPersonId, // References Person.id
    @Default([]) List<String> otherPersonIds, // References Person.id[]

    // Supporting Information
    @Default([]) List<String> mediaIds, // References Media.id[]
    @Default([]) List<Source> sources,

    // Audit
    required String createdBy,
    required String updatedBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _FamilyEvent;

  factory FamilyEvent.fromJson(Map<String, dynamic> json) => _$FamilyEventFromJson(json);

  // Factory for creating a new event
  factory FamilyEvent.create({
    required String treeId,
    required EventType type,
    required String title,
    required String primaryPersonId,
    required String createdBy,
    String? description,
    DateTime? date,
    DateAccuracy dateAccuracy = DateAccuracy.exact,
    DateTime? endDate,
    Place? place,
    List<String>? otherPersonIds,
    List<String>? mediaIds,
    List<Source>? sources,
  }) {
    final now = DateTime.now();
    return FamilyEvent(
      id: const Uuid().v4(),
      treeId: treeId,
      type: type,
      title: title,
      description: description,
      date: date,
      dateAccuracy: dateAccuracy,
      endDate: endDate,
      place: place,
      primaryPersonId: primaryPersonId,
      otherPersonIds: otherPersonIds ?? [],
      mediaIds: mediaIds ?? [],
      sources: sources ?? [],
      createdBy: createdBy,
      updatedBy: createdBy,
      createdAt: now,
      updatedAt: now,
    );
  }

  // Factory for life milestone events
  factory FamilyEvent.createMilestone({
    required String treeId,
    required EventType type,
    required String personId,
    required String createdBy,
    DateTime? date,
    Place? place,
    String? description,
  }) {
    final title = _getDefaultTitle(type);
    return FamilyEvent.create(
      treeId: treeId,
      type: type,
      title: title,
      primaryPersonId: personId,
      createdBy: createdBy,
      date: date,
      place: place,
      description: description,
    );
  }

  static String _getDefaultTitle(EventType type) {
    switch (type) {
      case EventType.birth:
        return 'Birth';
      case EventType.death:
        return 'Death';
      case EventType.marriage:
        return 'Marriage';
      case EventType.divorce:
        return 'Divorce';
      case EventType.baptism:
        return 'Baptism';
      case EventType.graduation:
        return 'Graduation';
      case EventType.militaryService:
        return 'Military Service';
      case EventType.immigration:
        return 'Immigration';
      case EventType.emigration:
        return 'Emigration';
      case EventType.residence:
        return 'Residence Change';
      case EventType.occupation:
        return 'New Occupation';
      case EventType.retirement:
        return 'Retirement';
      case EventType.census:
        return 'Census Record';
      case EventType.other:
        return 'Life Event';
    }
  }
}

@freezed
class Source with _$Source {
  const factory Source({
    required SourceType type,
    required String title,
    String? url,
    String? citation,
    @Default(3) int reliability, // 1 = lowest, 5 = highest
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

enum EventType {
  @JsonValue('birth')
  birth,
  @JsonValue('death')
  death,
  @JsonValue('marriage')
  marriage,
  @JsonValue('divorce')
  divorce,
  @JsonValue('baptism')
  baptism,
  @JsonValue('graduation')
  graduation,
  @JsonValue('military_service')
  militaryService,
  @JsonValue('immigration')
  immigration,
  @JsonValue('emigration')
  emigration,
  @JsonValue('residence')
  residence,
  @JsonValue('occupation')
  occupation,
  @JsonValue('retirement')
  retirement,
  @JsonValue('census')
  census,
  @JsonValue('other')
  other,
}

enum DateAccuracy {
  @JsonValue('exact')
  exact,
  @JsonValue('circa')
  circa, // Approximately
  @JsonValue('before')
  before,
  @JsonValue('after')
  after,
  @JsonValue('between')
  between,
  @JsonValue('unknown')
  unknown,
}

enum SourceType {
  @JsonValue('document')
  document,
  @JsonValue('oral')
  oral,
  @JsonValue('record')
  record,
  @JsonValue('other')
  other,
}

// Extensions for better UX
extension EventTypeX on EventType {
  String get displayName {
    switch (this) {
      case EventType.birth:
        return 'Birth';
      case EventType.death:
        return 'Death';
      case EventType.marriage:
        return 'Marriage';
      case EventType.divorce:
        return 'Divorce';
      case EventType.baptism:
        return 'Baptism';
      case EventType.graduation:
        return 'Graduation';
      case EventType.militaryService:
        return 'Military Service';
      case EventType.immigration:
        return 'Immigration';
      case EventType.emigration:
        return 'Emigration';
      case EventType.residence:
        return 'Residence';
      case EventType.occupation:
        return 'Occupation';
      case EventType.retirement:
        return 'Retirement';
      case EventType.census:
        return 'Census';
      case EventType.other:
        return 'Other';
    }
  }

  String get icon {
    switch (this) {
      case EventType.birth:
        return '👶';
      case EventType.death:
        return '🕊️';
      case EventType.marriage:
        return '💍';
      case EventType.divorce:
        return '💔';
      case EventType.baptism:
        return '✝️';
      case EventType.graduation:
        return '🎓';
      case EventType.militaryService:
        return '🎖️';
      case EventType.immigration:
        return '🛫';
      case EventType.emigration:
        return '🛬';
      case EventType.residence:
        return '🏠';
      case EventType.occupation:
        return '💼';
      case EventType.retirement:
        return '🏖️';
      case EventType.census:
        return '📊';
      case EventType.other:
        return '📅';
    }
  }

  bool get isMajorLifeEvent {
    switch (this) {
      case EventType.birth:
      case EventType.death:
      case EventType.marriage:
      case EventType.graduation:
        return true;
      default:
        return false;
    }
  }

  int get sortPriority {
    switch (this) {
      case EventType.birth:
        return 1;
      case EventType.baptism:
        return 2;
      case EventType.graduation:
        return 3;
      case EventType.marriage:
        return 4;
      case EventType.occupation:
        return 5;
      case EventType.retirement:
        return 6;
      case EventType.death:
        return 7;
      default:
        return 8;
    }
  }
}

extension DateAccuracyX on DateAccuracy {
  String get displayName {
    switch (this) {
      case DateAccuracy.exact:
        return 'Exact';
      case DateAccuracy.circa:
        return 'Circa';
      case DateAccuracy.before:
        return 'Before';
      case DateAccuracy.after:
        return 'After';
      case DateAccuracy.between:
        return 'Between';
      case DateAccuracy.unknown:
        return 'Unknown';
    }
  }

  String get symbol {
    switch (this) {
      case DateAccuracy.exact:
        return '';
      case DateAccuracy.circa:
        return 'c. ';
      case DateAccuracy.before:
        return '< ';
      case DateAccuracy.after:
        return '> ';
      case DateAccuracy.between:
        return '≈ ';
      case DateAccuracy.unknown:
        return '? ';
    }
  }
}

extension SourceTypeX on SourceType {
  String get displayName {
    switch (this) {
      case SourceType.document:
        return 'Document';
      case SourceType.oral:
        return 'Oral History';
      case SourceType.record:
        return 'Official Record';
      case SourceType.other:
        return 'Other';
    }
  }

  String get icon {
    switch (this) {
      case SourceType.document:
        return '📄';
      case SourceType.oral:
        return '🎙️';
      case SourceType.record:
        return '📋';
      case SourceType.other:
        return '📝';
    }
  }
}

// Helper extension for event operations
extension FamilyEventX on FamilyEvent {
  /// Copy event with updated timestamp
  FamilyEvent copyWithUpdate({
    String? title,
    String? description,
    DateTime? date,
    DateAccuracy? dateAccuracy,
    DateTime? endDate,
    Place? place,
    List<String>? otherPersonIds,
    List<String>? mediaIds,
    List<Source>? sources,
    required String updatedBy,
  }) {
    return copyWith(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      dateAccuracy: dateAccuracy ?? this.dateAccuracy,
      endDate: endDate ?? this.endDate,
      place: place ?? this.place,
      otherPersonIds: otherPersonIds ?? this.otherPersonIds,
      mediaIds: mediaIds ?? this.mediaIds,
      sources: sources ?? this.sources,
      updatedBy: updatedBy,
      updatedAt: DateTime.now(),
    );
  }

  bool get isDeleted => deletedAt != null;

  /// Get formatted date string
  String get formattedDate {
    if (date == null) return 'Date unknown';

    final dateStr = '${date!.day}/${date!.month}/${date!.year}';
    return '${dateAccuracy.symbol}$dateStr';
  }

  /// Get year only
  int? get year => date?.year;

  /// Get all person IDs involved in this event
  List<String> get allPersonIds {
    return [primaryPersonId, ...otherPersonIds];
  }

  /// Check if event involves a specific person
  bool involvesPersonId(String personId) {
    return allPersonIds.contains(personId);
  }

  /// Get duration of event (if has end date)
  Duration? get duration {
    if (date == null || endDate == null) return null;
    return endDate!.difference(date!);
  }

  /// Check if event has valid date
  bool get hasValidDate {
    return date != null && dateAccuracy != DateAccuracy.unknown;
  }

  /// Get event age in years
  int? get ageInYears {
    if (date == null) return null;
    final now = DateTime.now();
    return now.difference(date!).inDays ~/ 365;
  }

  /// Check if event is recent (within last year)
  bool get isRecent {
    if (date == null) return false;
    final now = DateTime.now();
    return now.difference(date!).inDays < 365;
  }

  /// Check if event is historical (more than 50 years ago)
  bool get isHistorical {
    if (date == null) return false;
    final now = DateTime.now();
    return now.difference(date!).inDays > (50 * 365);
  }

  /// Get display title with type icon
  String get displayTitle {
    return '${type.icon} $title';
  }

  /// Check if event has supporting media
  bool get hasMedia => mediaIds.isNotEmpty;

  /// Check if event has sources
  bool get hasSources => sources.isNotEmpty;

  /// Get reliability score from sources (average)
  double get reliabilityScore {
    if (sources.isEmpty) return 0.0;
    final total = sources.map((s) => s.reliability).reduce((a, b) => a + b);
    return total / sources.length;
  }

  /// Check if event is well-documented
  bool get isWellDocumented {
    return hasSources && reliabilityScore >= 3.0;
  }
}

extension SourceX on Source {
  /// Get reliability as a display string
  String get reliabilityDisplay {
    switch (reliability) {
      case 1:
        return 'Very Low';
      case 2:
        return 'Low';
      case 3:
        return 'Medium';
      case 4:
        return 'High';
      case 5:
        return 'Very High';
      default:
        return 'Unknown';
    }
  }

  /// Get reliability as stars
  String get reliabilityStars {
    return '★' * reliability + '☆' * (5 - reliability);
  }

  bool get hasUrl => url != null && url!.isNotEmpty;
  bool get hasCitation => citation != null && citation!.isNotEmpty;
}