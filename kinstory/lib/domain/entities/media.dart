import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'place.dart';

part 'media.freezed.dart';
part 'media.g.dart';

@freezed
class Media with _$Media {
  const factory Media({
    required String id,
    required String treeId,
    String? personId, // References Person.id (nullable for tree-level media)

    // File Information
    required MediaType type,
    required String fileName,
    required int fileSize, // bytes
    required String mimeType,
    required String storageKey, // S3 key or storage path
    required String url, // CDN or storage URL
    String? thumbnailUrl,

    // Metadata
    String? title,
    String? description,
    DateTime? dateTaken,
    Place? location,
    @Default([]) List<String> tags,

    // Image-specific
    int? width,
    int? height,

    // Permissions
    @Default(PrivacyLevel.family) PrivacyLevel privacy,

    // Face Recognition
    @Default([]) List<DetectedFace> detectedFaces,

    // Audit
    required String uploadedBy, // References User.id
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  // Factory for creating new media
  factory Media.create({
    required String treeId,
    required MediaType type,
    required String fileName,
    required int fileSize,
    required String mimeType,
    required String storageKey,
    required String url,
    required String uploadedBy,
    String? personId,
    String? thumbnailUrl,
    String? title,
    String? description,
    DateTime? dateTaken,
    Place? location,
    List<String>? tags,
    int? width,
    int? height,
    PrivacyLevel privacy = PrivacyLevel.family,
  }) {
    final now = DateTime.now();
    return Media(
      id: const Uuid().v4(),
      treeId: treeId,
      personId: personId,
      type: type,
      fileName: fileName,
      fileSize: fileSize,
      mimeType: mimeType,
      storageKey: storageKey,
      url: url,
      thumbnailUrl: thumbnailUrl,
      title: title ?? fileName,
      description: description,
      dateTaken: dateTaken,
      location: location,
      tags: tags ?? [],
      width: width,
      height: height,
      privacy: privacy,
      uploadedBy: uploadedBy,
      createdAt: now,
      updatedAt: now,
    );
  }

  // Factory for photo
  factory Media.photo({
    required String treeId,
    required String fileName,
    required int fileSize,
    required String storageKey,
    required String url,
    required String uploadedBy,
    String? personId,
    String? thumbnailUrl,
    String? title,
    String? description,
    DateTime? dateTaken,
    Place? location,
    List<String>? tags,
    required int width,
    required int height,
  }) {
    return Media.create(
      treeId: treeId,
      type: MediaType.photo,
      fileName: fileName,
      fileSize: fileSize,
      mimeType: _getMimeTypeFromFileName(fileName, MediaType.photo),
      storageKey: storageKey,
      url: url,
      uploadedBy: uploadedBy,
      personId: personId,
      thumbnailUrl: thumbnailUrl,
      title: title,
      description: description,
      dateTaken: dateTaken,
      location: location,
      tags: tags,
      width: width,
      height: height,
    );
  }

  // Factory for video
  factory Media.video({
    required String treeId,
    required String fileName,
    required int fileSize,
    required String storageKey,
    required String url,
    required String uploadedBy,
    String? personId,
    String? thumbnailUrl,
    String? title,
    String? description,
    DateTime? dateTaken,
    Place? location,
    List<String>? tags,
    int? width,
    int? height,
  }) {
    return Media.create(
      treeId: treeId,
      type: MediaType.video,
      fileName: fileName,
      fileSize: fileSize,
      mimeType: _getMimeTypeFromFileName(fileName, MediaType.video),
      storageKey: storageKey,
      url: url,
      uploadedBy: uploadedBy,
      personId: personId,
      thumbnailUrl: thumbnailUrl,
      title: title,
      description: description,
      dateTaken: dateTaken,
      location: location,
      tags: tags,
      width: width,
      height: height,
    );
  }

  // Factory for audio
  factory Media.audio({
    required String treeId,
    required String fileName,
    required int fileSize,
    required String storageKey,
    required String url,
    required String uploadedBy,
    String? personId,
    String? title,
    String? description,
    DateTime? dateTaken,
    List<String>? tags,
  }) {
    return Media.create(
      treeId: treeId,
      type: MediaType.audio,
      fileName: fileName,
      fileSize: fileSize,
      mimeType: _getMimeTypeFromFileName(fileName, MediaType.audio),
      storageKey: storageKey,
      url: url,
      uploadedBy: uploadedBy,
      personId: personId,
      title: title,
      description: description,
      dateTaken: dateTaken,
      tags: tags,
    );
  }

  static String _getMimeTypeFromFileName(String fileName, MediaType type) {
    final extension = fileName.split('.').last.toLowerCase();
    switch (type) {
      case MediaType.photo:
        switch (extension) {
          case 'jpg':
          case 'jpeg':
            return 'image/jpeg';
          case 'png':
            return 'image/png';
          case 'gif':
            return 'image/gif';
          case 'webp':
            return 'image/webp';
          case 'heic':
            return 'image/heic';
          default:
            return 'image/jpeg';
        }
      case MediaType.video:
        switch (extension) {
          case 'mp4':
            return 'video/mp4';
          case 'mov':
            return 'video/quicktime';
          case 'avi':
            return 'video/avi';
          case 'webm':
            return 'video/webm';
          default:
            return 'video/mp4';
        }
      case MediaType.audio:
        switch (extension) {
          case 'mp3':
            return 'audio/mpeg';
          case 'm4a':
            return 'audio/mp4';
          case 'wav':
            return 'audio/wav';
          case 'ogg':
            return 'audio/ogg';
          default:
            return 'audio/mpeg';
        }
      case MediaType.document:
        switch (extension) {
          case 'pdf':
            return 'application/pdf';
          case 'doc':
            return 'application/msword';
          case 'docx':
            return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
          default:
            return 'application/octet-stream';
        }
    }
  }
}

@freezed
class DetectedFace with _$DetectedFace {
  const factory DetectedFace({
    String? personId, // References Person.id
    required BoundingBox boundingBox,
    required double confidence,
  }) = _DetectedFace;

  factory DetectedFace.fromJson(Map<String, dynamic> json) => _$DetectedFaceFromJson(json);
}

@freezed
class BoundingBox with _$BoundingBox {
  const factory BoundingBox({
    required double x,
    required double y,
    required double width,
    required double height,
  }) = _BoundingBox;

  factory BoundingBox.fromJson(Map<String, dynamic> json) => _$BoundingBoxFromJson(json);
}

enum MediaType {
  @JsonValue('photo')
  photo,
  @JsonValue('video')
  video,
  @JsonValue('document')
  document,
  @JsonValue('audio')
  audio,
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
extension MediaTypeX on MediaType {
  String get displayName {
    switch (this) {
      case MediaType.photo:
        return 'Photo';
      case MediaType.video:
        return 'Video';
      case MediaType.audio:
        return 'Audio';
      case MediaType.document:
        return 'Document';
    }
  }

  String get icon {
    switch (this) {
      case MediaType.photo:
        return '📷';
      case MediaType.video:
        return '🎥';
      case MediaType.audio:
        return '🎵';
      case MediaType.document:
        return '📄';
    }
  }

  String get pluralName {
    switch (this) {
      case MediaType.photo:
        return 'Photos';
      case MediaType.video:
        return 'Videos';
      case MediaType.audio:
        return 'Audio Files';
      case MediaType.document:
        return 'Documents';
    }
  }

  bool get supportsPreview {
    switch (this) {
      case MediaType.photo:
      case MediaType.video:
        return true;
      case MediaType.audio:
      case MediaType.document:
        return false;
    }
  }

  bool get supportsThumbnail {
    switch (this) {
      case MediaType.photo:
      case MediaType.video:
        return true;
      case MediaType.audio:
      case MediaType.document:
        return false;
    }
  }
}

// Helper extension for media operations
extension MediaX on Media {
  /// Copy media with updated timestamp
  Media copyWithUpdate({
    String? title,
    String? description,
    DateTime? dateTaken,
    Place? location,
    List<String>? tags,
    PrivacyLevel? privacy,
    List<DetectedFace>? detectedFaces,
  }) {
    return copyWith(
      title: title ?? this.title,
      description: description ?? this.description,
      dateTaken: dateTaken ?? this.dateTaken,
      location: location ?? this.location,
      tags: tags ?? this.tags,
      privacy: privacy ?? this.privacy,
      detectedFaces: detectedFaces ?? this.detectedFaces,
      updatedAt: DateTime.now(),
    );
  }

  bool get isDeleted => deletedAt != null;

  /// Get file size in human-readable format
  String get formattedFileSize {
    if (fileSize < 1024) return '$fileSize B';
    if (fileSize < 1024 * 1024) return '${(fileSize / 1024).toStringAsFixed(1)} KB';
    if (fileSize < 1024 * 1024 * 1024) return '${(fileSize / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(fileSize / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  /// Get file extension
  String get fileExtension {
    return fileName.split('.').last.toLowerCase();
  }

  /// Get file name without extension
  String get fileNameWithoutExtension {
    final parts = fileName.split('.');
    if (parts.length > 1) {
      return parts.sublist(0, parts.length - 1).join('.');
    }
    return fileName;
  }

  /// Check if media has dimensions
  bool get hasDimensions => width != null && height != null;

  /// Get aspect ratio
  double? get aspectRatio {
    if (!hasDimensions) return null;
    return width! / height!;
  }

  /// Check if media is landscape orientation
  bool get isLandscape {
    if (!hasDimensions) return false;
    return width! > height!;
  }

  /// Check if media is portrait orientation
  bool get isPortrait {
    if (!hasDimensions) return false;
    return height! > width!;
  }

  /// Check if media is square
  bool get isSquare {
    if (!hasDimensions) return false;
    return width! == height!;
  }

  /// Get display URL (thumbnail if available, otherwise original)
  String get displayUrl => thumbnailUrl ?? url;

  /// Check if media has tags
  bool get hasTags => tags.isNotEmpty;

  /// Check if media has location
  bool get hasLocation => location != null;

  /// Check if media has detected faces
  bool get hasDetectedFaces => detectedFaces.isNotEmpty;

  /// Check if media has identified faces (faces with person IDs)
  bool get hasIdentifiedFaces {
    return detectedFaces.any((face) => face.personId != null);
  }

  /// Get count of unidentified faces
  int get unidentifiedFacesCount {
    return detectedFaces.where((face) => face.personId == null).length;
  }

  /// Get count of identified faces
  int get identifiedFacesCount {
    return detectedFaces.where((face) => face.personId != null).length;
  }

  /// Check if face detection has been performed
  bool get hasFaceDetection => detectedFaces.isNotEmpty;

  /// Get age of media
  Duration get age {
    return DateTime.now().difference(createdAt);
  }

  /// Check if media was recently uploaded
  bool get isRecentlyUploaded {
    return age.inDays < 7;
  }

  /// Get media taken age (if dateTaken is available)
  Duration? get mediaAge {
    if (dateTaken == null) return null;
    return DateTime.now().difference(dateTaken!);
  }

  /// Check if media is vintage (taken more than 50 years ago)
  bool get isVintage {
    final age = mediaAge;
    if (age == null) return false;
    return age.inDays > (50 * 365);
  }

  /// Check if media involves a specific person (by person ID or face detection)
  bool involvesPersonId(String personId) {
    if (this.personId == personId) return true;
    return detectedFaces.any((face) => face.personId == personId);
  }

  /// Get all person IDs involved in this media
  List<String> get allPersonIds {
    final ids = <String>[];
    if (personId != null) ids.add(personId!);
    for (final face in detectedFaces) {
      if (face.personId != null && !ids.contains(face.personId)) {
        ids.add(face.personId!);
      }
    }
    return ids;
  }

  /// Check if media has a specific tag
  bool hasTag(String tag) {
    return tags.any((t) => t.toLowerCase() == tag.toLowerCase());
  }

  /// Add a tag if it doesn't exist
  Media addTag(String tag) {
    if (hasTag(tag)) return this;
    return copyWith(tags: [...tags, tag]);
  }

  /// Remove a tag
  Media removeTag(String tag) {
    return copyWith(tags: tags.where((t) => t.toLowerCase() != tag.toLowerCase()).toList());
  }

  /// Get formatted date taken
  String get formattedDateTaken {
    if (dateTaken == null) return 'Date unknown';
    return '${dateTaken!.day}/${dateTaken!.month}/${dateTaken!.year}';
  }

  /// Get display title (title or filename)
  String get displayTitle => title ?? fileName;

  /// Check if media can be previewed inline
  bool get canPreview => type.supportsPreview;

  /// Check if media has thumbnail
  bool get hasThumbnail => thumbnailUrl != null;
}

extension DetectedFaceX on DetectedFace {
  bool get isIdentified => personId != null;
  bool get isUnidentified => personId == null;

  /// Get face center point
  (double, double) get center {
    return (
      boundingBox.x + boundingBox.width / 2,
      boundingBox.y + boundingBox.height / 2,
    );
  }

  /// Get confidence percentage
  double get confidencePercentage => confidence * 100;

  /// Get confidence as display string
  String get confidenceDisplay => '${confidencePercentage.toStringAsFixed(0)}%';
}

extension BoundingBoxX on BoundingBox {
  /// Check if point is inside bounding box
  bool contains(double pointX, double pointY) {
    return pointX >= x &&
           pointX <= x + width &&
           pointY >= y &&
           pointY <= y + height;
  }

  /// Get area of bounding box
  double get area => width * height;

  /// Get bounding box as rectangle (for UI frameworks)
  Map<String, double> get rect => {
    'left': x,
    'top': y,
    'width': width,
    'height': height,
  };
}