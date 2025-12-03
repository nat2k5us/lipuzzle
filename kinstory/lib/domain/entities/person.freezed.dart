// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Person _$PersonFromJson(Map<String, dynamic> json) {
  return _Person.fromJson(json);
}

/// @nodoc
mixin _$Person {
  String get id => throw _privateConstructorUsedError;
  String get treeId => throw _privateConstructorUsedError; // Basic Information
  String get firstName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get maidenName => throw _privateConstructorUsedError;
  List<String> get nicknames => throw _privateConstructorUsedError;
  String? get suffix =>
      throw _privateConstructorUsedError; // Jr., Sr., III, etc.
  String? get prefix => throw _privateConstructorUsedError; // Dr., Rev., etc.
// Demographics
  Gender? get gender => throw _privateConstructorUsedError;
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  Place? get placeOfBirth => throw _privateConstructorUsedError;
  DateTime? get dateOfDeath => throw _privateConstructorUsedError;
  Place? get placeOfDeath => throw _privateConstructorUsedError;
  bool get isLiving =>
      throw _privateConstructorUsedError; // Additional Information
  String? get biography => throw _privateConstructorUsedError;
  List<String> get occupation => throw _privateConstructorUsedError;
  List<String> get education => throw _privateConstructorUsedError;
  String? get religion => throw _privateConstructorUsedError;
  List<String> get ethnicity =>
      throw _privateConstructorUsedError; // Contact (for living relatives)
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  Address? get address => throw _privateConstructorUsedError; // Metadata
  PrivacyLevel get privacy => throw _privateConstructorUsedError;
  String? get profilePictureId =>
      throw _privateConstructorUsedError; // References Media.id
  Map<String, dynamic> get customFields =>
      throw _privateConstructorUsedError; // Audit
  String get createdBy => throw _privateConstructorUsedError;
  String get updatedBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this Person to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonCopyWith<Person> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonCopyWith<$Res> {
  factory $PersonCopyWith(Person value, $Res Function(Person) then) =
      _$PersonCopyWithImpl<$Res, Person>;
  @useResult
  $Res call(
      {String id,
      String treeId,
      String firstName,
      String? middleName,
      String? lastName,
      String? maidenName,
      List<String> nicknames,
      String? suffix,
      String? prefix,
      Gender? gender,
      DateTime? dateOfBirth,
      Place? placeOfBirth,
      DateTime? dateOfDeath,
      Place? placeOfDeath,
      bool isLiving,
      String? biography,
      List<String> occupation,
      List<String> education,
      String? religion,
      List<String> ethnicity,
      String? email,
      String? phoneNumber,
      Address? address,
      PrivacyLevel privacy,
      String? profilePictureId,
      Map<String, dynamic> customFields,
      String createdBy,
      String updatedBy,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  $PlaceCopyWith<$Res>? get placeOfBirth;
  $PlaceCopyWith<$Res>? get placeOfDeath;
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$PersonCopyWithImpl<$Res, $Val extends Person>
    implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? treeId = null,
    Object? firstName = null,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? maidenName = freezed,
    Object? nicknames = null,
    Object? suffix = freezed,
    Object? prefix = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? placeOfBirth = freezed,
    Object? dateOfDeath = freezed,
    Object? placeOfDeath = freezed,
    Object? isLiving = null,
    Object? biography = freezed,
    Object? occupation = null,
    Object? education = null,
    Object? religion = freezed,
    Object? ethnicity = null,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? address = freezed,
    Object? privacy = null,
    Object? profilePictureId = freezed,
    Object? customFields = null,
    Object? createdBy = null,
    Object? updatedBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
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
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      maidenName: freezed == maidenName
          ? _value.maidenName
          : maidenName // ignore: cast_nullable_to_non_nullable
              as String?,
      nicknames: null == nicknames
          ? _value.nicknames
          : nicknames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      suffix: freezed == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String?,
      prefix: freezed == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      placeOfBirth: freezed == placeOfBirth
          ? _value.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as Place?,
      dateOfDeath: freezed == dateOfDeath
          ? _value.dateOfDeath
          : dateOfDeath // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      placeOfDeath: freezed == placeOfDeath
          ? _value.placeOfDeath
          : placeOfDeath // ignore: cast_nullable_to_non_nullable
              as Place?,
      isLiving: null == isLiving
          ? _value.isLiving
          : isLiving // ignore: cast_nullable_to_non_nullable
              as bool,
      biography: freezed == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String?,
      occupation: null == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as List<String>,
      education: null == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as List<String>,
      religion: freezed == religion
          ? _value.religion
          : religion // ignore: cast_nullable_to_non_nullable
              as String?,
      ethnicity: null == ethnicity
          ? _value.ethnicity
          : ethnicity // ignore: cast_nullable_to_non_nullable
              as List<String>,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      privacy: null == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as PrivacyLevel,
      profilePictureId: freezed == profilePictureId
          ? _value.profilePictureId
          : profilePictureId // ignore: cast_nullable_to_non_nullable
              as String?,
      customFields: null == customFields
          ? _value.customFields
          : customFields // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
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

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceCopyWith<$Res>? get placeOfBirth {
    if (_value.placeOfBirth == null) {
      return null;
    }

    return $PlaceCopyWith<$Res>(_value.placeOfBirth!, (value) {
      return _then(_value.copyWith(placeOfBirth: value) as $Val);
    });
  }

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceCopyWith<$Res>? get placeOfDeath {
    if (_value.placeOfDeath == null) {
      return null;
    }

    return $PlaceCopyWith<$Res>(_value.placeOfDeath!, (value) {
      return _then(_value.copyWith(placeOfDeath: value) as $Val);
    });
  }

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PersonImplCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$$PersonImplCopyWith(
          _$PersonImpl value, $Res Function(_$PersonImpl) then) =
      __$$PersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String treeId,
      String firstName,
      String? middleName,
      String? lastName,
      String? maidenName,
      List<String> nicknames,
      String? suffix,
      String? prefix,
      Gender? gender,
      DateTime? dateOfBirth,
      Place? placeOfBirth,
      DateTime? dateOfDeath,
      Place? placeOfDeath,
      bool isLiving,
      String? biography,
      List<String> occupation,
      List<String> education,
      String? religion,
      List<String> ethnicity,
      String? email,
      String? phoneNumber,
      Address? address,
      PrivacyLevel privacy,
      String? profilePictureId,
      Map<String, dynamic> customFields,
      String createdBy,
      String updatedBy,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  @override
  $PlaceCopyWith<$Res>? get placeOfBirth;
  @override
  $PlaceCopyWith<$Res>? get placeOfDeath;
  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$PersonImplCopyWithImpl<$Res>
    extends _$PersonCopyWithImpl<$Res, _$PersonImpl>
    implements _$$PersonImplCopyWith<$Res> {
  __$$PersonImplCopyWithImpl(
      _$PersonImpl _value, $Res Function(_$PersonImpl) _then)
      : super(_value, _then);

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? treeId = null,
    Object? firstName = null,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? maidenName = freezed,
    Object? nicknames = null,
    Object? suffix = freezed,
    Object? prefix = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? placeOfBirth = freezed,
    Object? dateOfDeath = freezed,
    Object? placeOfDeath = freezed,
    Object? isLiving = null,
    Object? biography = freezed,
    Object? occupation = null,
    Object? education = null,
    Object? religion = freezed,
    Object? ethnicity = null,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? address = freezed,
    Object? privacy = null,
    Object? profilePictureId = freezed,
    Object? customFields = null,
    Object? createdBy = null,
    Object? updatedBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$PersonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      treeId: null == treeId
          ? _value.treeId
          : treeId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      maidenName: freezed == maidenName
          ? _value.maidenName
          : maidenName // ignore: cast_nullable_to_non_nullable
              as String?,
      nicknames: null == nicknames
          ? _value._nicknames
          : nicknames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      suffix: freezed == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String?,
      prefix: freezed == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      placeOfBirth: freezed == placeOfBirth
          ? _value.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as Place?,
      dateOfDeath: freezed == dateOfDeath
          ? _value.dateOfDeath
          : dateOfDeath // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      placeOfDeath: freezed == placeOfDeath
          ? _value.placeOfDeath
          : placeOfDeath // ignore: cast_nullable_to_non_nullable
              as Place?,
      isLiving: null == isLiving
          ? _value.isLiving
          : isLiving // ignore: cast_nullable_to_non_nullable
              as bool,
      biography: freezed == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String?,
      occupation: null == occupation
          ? _value._occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as List<String>,
      education: null == education
          ? _value._education
          : education // ignore: cast_nullable_to_non_nullable
              as List<String>,
      religion: freezed == religion
          ? _value.religion
          : religion // ignore: cast_nullable_to_non_nullable
              as String?,
      ethnicity: null == ethnicity
          ? _value._ethnicity
          : ethnicity // ignore: cast_nullable_to_non_nullable
              as List<String>,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      privacy: null == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as PrivacyLevel,
      profilePictureId: freezed == profilePictureId
          ? _value.profilePictureId
          : profilePictureId // ignore: cast_nullable_to_non_nullable
              as String?,
      customFields: null == customFields
          ? _value._customFields
          : customFields // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$PersonImpl implements _Person {
  const _$PersonImpl(
      {required this.id,
      required this.treeId,
      required this.firstName,
      this.middleName,
      this.lastName,
      this.maidenName,
      final List<String> nicknames = const [],
      this.suffix,
      this.prefix,
      this.gender,
      this.dateOfBirth,
      this.placeOfBirth,
      this.dateOfDeath,
      this.placeOfDeath,
      this.isLiving = true,
      this.biography,
      final List<String> occupation = const [],
      final List<String> education = const [],
      this.religion,
      final List<String> ethnicity = const [],
      this.email,
      this.phoneNumber,
      this.address,
      this.privacy = PrivacyLevel.family,
      this.profilePictureId,
      final Map<String, dynamic> customFields = const {},
      required this.createdBy,
      required this.updatedBy,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt})
      : _nicknames = nicknames,
        _occupation = occupation,
        _education = education,
        _ethnicity = ethnicity,
        _customFields = customFields;

  factory _$PersonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonImplFromJson(json);

  @override
  final String id;
  @override
  final String treeId;
// Basic Information
  @override
  final String firstName;
  @override
  final String? middleName;
  @override
  final String? lastName;
  @override
  final String? maidenName;
  final List<String> _nicknames;
  @override
  @JsonKey()
  List<String> get nicknames {
    if (_nicknames is EqualUnmodifiableListView) return _nicknames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nicknames);
  }

  @override
  final String? suffix;
// Jr., Sr., III, etc.
  @override
  final String? prefix;
// Dr., Rev., etc.
// Demographics
  @override
  final Gender? gender;
  @override
  final DateTime? dateOfBirth;
  @override
  final Place? placeOfBirth;
  @override
  final DateTime? dateOfDeath;
  @override
  final Place? placeOfDeath;
  @override
  @JsonKey()
  final bool isLiving;
// Additional Information
  @override
  final String? biography;
  final List<String> _occupation;
  @override
  @JsonKey()
  List<String> get occupation {
    if (_occupation is EqualUnmodifiableListView) return _occupation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_occupation);
  }

  final List<String> _education;
  @override
  @JsonKey()
  List<String> get education {
    if (_education is EqualUnmodifiableListView) return _education;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_education);
  }

  @override
  final String? religion;
  final List<String> _ethnicity;
  @override
  @JsonKey()
  List<String> get ethnicity {
    if (_ethnicity is EqualUnmodifiableListView) return _ethnicity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ethnicity);
  }

// Contact (for living relatives)
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final Address? address;
// Metadata
  @override
  @JsonKey()
  final PrivacyLevel privacy;
  @override
  final String? profilePictureId;
// References Media.id
  final Map<String, dynamic> _customFields;
// References Media.id
  @override
  @JsonKey()
  Map<String, dynamic> get customFields {
    if (_customFields is EqualUnmodifiableMapView) return _customFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_customFields);
  }

// Audit
  @override
  final String createdBy;
  @override
  final String updatedBy;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'Person(id: $id, treeId: $treeId, firstName: $firstName, middleName: $middleName, lastName: $lastName, maidenName: $maidenName, nicknames: $nicknames, suffix: $suffix, prefix: $prefix, gender: $gender, dateOfBirth: $dateOfBirth, placeOfBirth: $placeOfBirth, dateOfDeath: $dateOfDeath, placeOfDeath: $placeOfDeath, isLiving: $isLiving, biography: $biography, occupation: $occupation, education: $education, religion: $religion, ethnicity: $ethnicity, email: $email, phoneNumber: $phoneNumber, address: $address, privacy: $privacy, profilePictureId: $profilePictureId, customFields: $customFields, createdBy: $createdBy, updatedBy: $updatedBy, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.treeId, treeId) || other.treeId == treeId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.maidenName, maidenName) ||
                other.maidenName == maidenName) &&
            const DeepCollectionEquality()
                .equals(other._nicknames, _nicknames) &&
            (identical(other.suffix, suffix) || other.suffix == suffix) &&
            (identical(other.prefix, prefix) || other.prefix == prefix) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.placeOfBirth, placeOfBirth) ||
                other.placeOfBirth == placeOfBirth) &&
            (identical(other.dateOfDeath, dateOfDeath) ||
                other.dateOfDeath == dateOfDeath) &&
            (identical(other.placeOfDeath, placeOfDeath) ||
                other.placeOfDeath == placeOfDeath) &&
            (identical(other.isLiving, isLiving) ||
                other.isLiving == isLiving) &&
            (identical(other.biography, biography) ||
                other.biography == biography) &&
            const DeepCollectionEquality()
                .equals(other._occupation, _occupation) &&
            const DeepCollectionEquality()
                .equals(other._education, _education) &&
            (identical(other.religion, religion) ||
                other.religion == religion) &&
            const DeepCollectionEquality()
                .equals(other._ethnicity, _ethnicity) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.privacy, privacy) || other.privacy == privacy) &&
            (identical(other.profilePictureId, profilePictureId) ||
                other.profilePictureId == profilePictureId) &&
            const DeepCollectionEquality()
                .equals(other._customFields, _customFields) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        treeId,
        firstName,
        middleName,
        lastName,
        maidenName,
        const DeepCollectionEquality().hash(_nicknames),
        suffix,
        prefix,
        gender,
        dateOfBirth,
        placeOfBirth,
        dateOfDeath,
        placeOfDeath,
        isLiving,
        biography,
        const DeepCollectionEquality().hash(_occupation),
        const DeepCollectionEquality().hash(_education),
        religion,
        const DeepCollectionEquality().hash(_ethnicity),
        email,
        phoneNumber,
        address,
        privacy,
        profilePictureId,
        const DeepCollectionEquality().hash(_customFields),
        createdBy,
        updatedBy,
        createdAt,
        updatedAt,
        deletedAt
      ]);

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      __$$PersonImplCopyWithImpl<_$PersonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonImplToJson(
      this,
    );
  }
}

abstract class _Person implements Person {
  const factory _Person(
      {required final String id,
      required final String treeId,
      required final String firstName,
      final String? middleName,
      final String? lastName,
      final String? maidenName,
      final List<String> nicknames,
      final String? suffix,
      final String? prefix,
      final Gender? gender,
      final DateTime? dateOfBirth,
      final Place? placeOfBirth,
      final DateTime? dateOfDeath,
      final Place? placeOfDeath,
      final bool isLiving,
      final String? biography,
      final List<String> occupation,
      final List<String> education,
      final String? religion,
      final List<String> ethnicity,
      final String? email,
      final String? phoneNumber,
      final Address? address,
      final PrivacyLevel privacy,
      final String? profilePictureId,
      final Map<String, dynamic> customFields,
      required final String createdBy,
      required final String updatedBy,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final DateTime? deletedAt}) = _$PersonImpl;

  factory _Person.fromJson(Map<String, dynamic> json) = _$PersonImpl.fromJson;

  @override
  String get id;
  @override
  String get treeId; // Basic Information
  @override
  String get firstName;
  @override
  String? get middleName;
  @override
  String? get lastName;
  @override
  String? get maidenName;
  @override
  List<String> get nicknames;
  @override
  String? get suffix; // Jr., Sr., III, etc.
  @override
  String? get prefix; // Dr., Rev., etc.
// Demographics
  @override
  Gender? get gender;
  @override
  DateTime? get dateOfBirth;
  @override
  Place? get placeOfBirth;
  @override
  DateTime? get dateOfDeath;
  @override
  Place? get placeOfDeath;
  @override
  bool get isLiving; // Additional Information
  @override
  String? get biography;
  @override
  List<String> get occupation;
  @override
  List<String> get education;
  @override
  String? get religion;
  @override
  List<String> get ethnicity; // Contact (for living relatives)
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  Address? get address; // Metadata
  @override
  PrivacyLevel get privacy;
  @override
  String? get profilePictureId; // References Media.id
  @override
  Map<String, dynamic> get customFields; // Audit
  @override
  String get createdBy;
  @override
  String get updatedBy;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return _Place.fromJson(json);
}

/// @nodoc
mixin _$Place {
  String get name => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

  /// Serializes this Place to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceCopyWith<Place> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceCopyWith<$Res> {
  factory $PlaceCopyWith(Place value, $Res Function(Place) then) =
      _$PlaceCopyWithImpl<$Res, Place>;
  @useResult
  $Res call(
      {String name,
      String? city,
      String? state,
      String? country,
      double? latitude,
      double? longitude});
}

/// @nodoc
class _$PlaceCopyWithImpl<$Res, $Val extends Place>
    implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceImplCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$$PlaceImplCopyWith(
          _$PlaceImpl value, $Res Function(_$PlaceImpl) then) =
      __$$PlaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? city,
      String? state,
      String? country,
      double? latitude,
      double? longitude});
}

/// @nodoc
class __$$PlaceImplCopyWithImpl<$Res>
    extends _$PlaceCopyWithImpl<$Res, _$PlaceImpl>
    implements _$$PlaceImplCopyWith<$Res> {
  __$$PlaceImplCopyWithImpl(
      _$PlaceImpl _value, $Res Function(_$PlaceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$PlaceImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceImpl implements _Place {
  const _$PlaceImpl(
      {required this.name,
      this.city,
      this.state,
      this.country,
      this.latitude,
      this.longitude});

  factory _$PlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceImplFromJson(json);

  @override
  final String name;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? country;
  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString() {
    return 'Place(name: $name, city: $city, state: $state, country: $country, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, city, state, country, latitude, longitude);

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      __$$PlaceImplCopyWithImpl<_$PlaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceImplToJson(
      this,
    );
  }
}

abstract class _Place implements Place {
  const factory _Place(
      {required final String name,
      final String? city,
      final String? state,
      final String? country,
      final double? latitude,
      final double? longitude}) = _$PlaceImpl;

  factory _Place.fromJson(Map<String, dynamic> json) = _$PlaceImpl.fromJson;

  @override
  String get name;
  @override
  String? get city;
  @override
  String? get state;
  @override
  String? get country;
  @override
  double? get latitude;
  @override
  double? get longitude;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  String? get street => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get postalCode => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {String? street,
      String? city,
      String? state,
      String? postalCode,
      String? country});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
          _$AddressImpl value, $Res Function(_$AddressImpl) then) =
      __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? street,
      String? city,
      String? state,
      String? postalCode,
      String? country});
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
      _$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
  }) {
    return _then(_$AddressImpl(
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl implements _Address {
  const _$AddressImpl(
      {this.street, this.city, this.state, this.postalCode, this.country});

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  final String? street;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? postalCode;
  @override
  final String? country;

  @override
  String toString() {
    return 'Address(street: $street, city: $city, state: $state, postalCode: $postalCode, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, street, city, state, postalCode, country);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  const factory _Address(
      {final String? street,
      final String? city,
      final String? state,
      final String? postalCode,
      final String? country}) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  String? get street;
  @override
  String? get city;
  @override
  String? get state;
  @override
  String? get postalCode;
  @override
  String? get country;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
