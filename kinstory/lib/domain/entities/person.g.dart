// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonImpl _$$PersonImplFromJson(Map<String, dynamic> json) => _$PersonImpl(
      id: json['id'] as String,
      treeId: json['treeId'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      maidenName: json['maidenName'] as String?,
      nicknames: (json['nicknames'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      suffix: json['suffix'] as String?,
      prefix: json['prefix'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      placeOfBirth: json['placeOfBirth'] == null
          ? null
          : Place.fromJson(json['placeOfBirth'] as Map<String, dynamic>),
      dateOfDeath: json['dateOfDeath'] == null
          ? null
          : DateTime.parse(json['dateOfDeath'] as String),
      placeOfDeath: json['placeOfDeath'] == null
          ? null
          : Place.fromJson(json['placeOfDeath'] as Map<String, dynamic>),
      isLiving: json['isLiving'] as bool? ?? true,
      biography: json['biography'] as String?,
      occupation: (json['occupation'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      education: (json['education'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      religion: json['religion'] as String?,
      ethnicity: (json['ethnicity'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      privacy: $enumDecodeNullable(_$PrivacyLevelEnumMap, json['privacy']) ??
          PrivacyLevel.family,
      profilePictureId: json['profilePictureId'] as String?,
      customFields: json['customFields'] as Map<String, dynamic>? ?? const {},
      createdBy: json['createdBy'] as String,
      updatedBy: json['updatedBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$PersonImplToJson(_$PersonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'treeId': instance.treeId,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'maidenName': instance.maidenName,
      'nicknames': instance.nicknames,
      'suffix': instance.suffix,
      'prefix': instance.prefix,
      'gender': _$GenderEnumMap[instance.gender],
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'placeOfBirth': instance.placeOfBirth,
      'dateOfDeath': instance.dateOfDeath?.toIso8601String(),
      'placeOfDeath': instance.placeOfDeath,
      'isLiving': instance.isLiving,
      'biography': instance.biography,
      'occupation': instance.occupation,
      'education': instance.education,
      'religion': instance.religion,
      'ethnicity': instance.ethnicity,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'privacy': _$PrivacyLevelEnumMap[instance.privacy]!,
      'profilePictureId': instance.profilePictureId,
      'customFields': instance.customFields,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
  Gender.unknown: 'unknown',
};

const _$PrivacyLevelEnumMap = {
  PrivacyLevel.private: 'private',
  PrivacyLevel.family: 'family',
  PrivacyLevel.public: 'public',
};

_$PlaceImpl _$$PlaceImplFromJson(Map<String, dynamic> json) => _$PlaceImpl(
      name: json['name'] as String,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PlaceImplToJson(_$PlaceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      street: json['street'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postalCode'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'country': instance.country,
    };
