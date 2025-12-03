import 'dart:math' as math;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';
part 'place.g.dart';

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

  // Factory for creating from address components
  factory Place.fromComponents({
    String? city,
    String? state,
    String? country,
    double? latitude,
    double? longitude,
  }) {
    final parts = <String>[];
    if (city != null) parts.add(city);
    if (state != null) parts.add(state);
    if (country != null) parts.add(country);

    final name = parts.join(', ');

    return Place(
      name: name,
      city: city,
      state: state,
      country: country,
      latitude: latitude,
      longitude: longitude,
    );
  }

  // Factory for creating from coordinates
  factory Place.fromCoordinates({
    required double latitude,
    required double longitude,
    String? name,
    String? city,
    String? state,
    String? country,
  }) {
    return Place(
      name: name ?? 'Location (${latitude.toStringAsFixed(4)}, ${longitude.toStringAsFixed(4)})',
      city: city,
      state: state,
      country: country,
      latitude: latitude,
      longitude: longitude,
    );
  }
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

// Extensions for better UX
extension PlaceX on Place {
  /// Get formatted display name
  String get displayName => name;

  /// Get short location (city, state)
  String get shortLocation {
    final parts = <String>[];
    if (city != null) parts.add(city!);
    if (state != null) parts.add(state!);
    return parts.join(', ');
  }

  /// Get full location string
  String get fullLocation {
    final parts = <String>[];
    if (city != null) parts.add(city!);
    if (state != null) parts.add(state!);
    if (country != null) parts.add(country!);
    return parts.join(', ');
  }

  /// Check if place has coordinates
  bool get hasCoordinates => latitude != null && longitude != null;

  /// Get coordinates as a pair
  (double, double)? get coordinates {
    if (hasCoordinates) {
      return (latitude!, longitude!);
    }
    return null;
  }

  /// Convert to Address
  Address toAddress() {
    return Address(
      city: city,
      state: state,
      country: country,
    );
  }

  /// Calculate distance to another place (in kilometers)
  double? distanceTo(Place other) {
    if (!hasCoordinates || !other.hasCoordinates) return null;

    // Haversine formula for great-circle distance
    const double earthRadius = 6371; // Earth's radius in kilometers

    final lat1Rad = latitude! * (3.14159 / 180);
    final lat2Rad = other.latitude! * (3.14159 / 180);
    final deltaLatRad = (other.latitude! - latitude!) * (3.14159 / 180);
    final deltaLonRad = (other.longitude! - longitude!) * (3.14159 / 180);

    final a = math.sin(deltaLatRad / 2) * math.sin(deltaLatRad / 2) +
              math.cos(lat1Rad) * math.cos(lat2Rad) *
              math.sin(deltaLonRad / 2) * math.sin(deltaLonRad / 2);

    final c = 2 * math.asin(math.sqrt(a));

    return earthRadius * c;
  }
}

extension AddressX on Address {
  /// Get formatted address string
  String get formattedAddress {
    final parts = <String>[];
    if (street != null) parts.add(street!);
    if (city != null) parts.add(city!);
    if (state != null) parts.add(state!);
    if (postalCode != null) parts.add(postalCode!);
    if (country != null) parts.add(country!);
    return parts.join(', ');
  }

  /// Get short address (without street)
  String get shortAddress {
    final parts = <String>[];
    if (city != null) parts.add(city!);
    if (state != null) parts.add(state!);
    if (country != null) parts.add(country!);
    return parts.join(', ');
  }

  /// Convert to Place
  Place toPlace() {
    return Place.fromComponents(
      city: city,
      state: state,
      country: country,
    );
  }

  /// Check if address is empty
  bool get isEmpty {
    return street == null &&
           city == null &&
           state == null &&
           postalCode == null &&
           country == null;
  }

  /// Check if address has minimum required fields
  bool get isValid {
    return city != null || state != null;
  }
}