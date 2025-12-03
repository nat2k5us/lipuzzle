// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTableTable extends UsersTable
    with TableInfo<$UsersTableTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _profilePictureUrlMeta =
      const VerificationMeta('profilePictureUrl');
  @override
  late final GeneratedColumn<String> profilePictureUrl =
      GeneratedColumn<String>('profile_picture_url', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
      'date_of_birth', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      preferences = GeneratedColumn<String>('preferences', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('{}'))
          .withConverter<Map<String, dynamic>>(
              $UsersTableTable.$converterpreferences);
  static const VerificationMeta _emailVerifiedMeta =
      const VerificationMeta('emailVerified');
  @override
  late final GeneratedColumn<bool> emailVerified = GeneratedColumn<bool>(
      'email_verified', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("email_verified" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _mfaEnabledMeta =
      const VerificationMeta('mfaEnabled');
  @override
  late final GeneratedColumn<bool> mfaEnabled = GeneratedColumn<bool>(
      'mfa_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("mfa_enabled" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _mfaSecretMeta =
      const VerificationMeta('mfaSecret');
  @override
  late final GeneratedColumn<String> mfaSecret = GeneratedColumn<String>(
      'mfa_secret', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastLoginAtMeta =
      const VerificationMeta('lastLoginAt');
  @override
  late final GeneratedColumn<DateTime> lastLoginAt = GeneratedColumn<DateTime>(
      'last_login_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        email,
        firstName,
        lastName,
        profilePictureUrl,
        phoneNumber,
        dateOfBirth,
        preferences,
        emailVerified,
        mfaEnabled,
        mfaSecret,
        lastLoginAt,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('profile_picture_url')) {
      context.handle(
          _profilePictureUrlMeta,
          profilePictureUrl.isAcceptableOrUnknown(
              data['profile_picture_url']!, _profilePictureUrlMeta));
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
          _dateOfBirthMeta,
          dateOfBirth.isAcceptableOrUnknown(
              data['date_of_birth']!, _dateOfBirthMeta));
    }
    if (data.containsKey('email_verified')) {
      context.handle(
          _emailVerifiedMeta,
          emailVerified.isAcceptableOrUnknown(
              data['email_verified']!, _emailVerifiedMeta));
    }
    if (data.containsKey('mfa_enabled')) {
      context.handle(
          _mfaEnabledMeta,
          mfaEnabled.isAcceptableOrUnknown(
              data['mfa_enabled']!, _mfaEnabledMeta));
    }
    if (data.containsKey('mfa_secret')) {
      context.handle(_mfaSecretMeta,
          mfaSecret.isAcceptableOrUnknown(data['mfa_secret']!, _mfaSecretMeta));
    }
    if (data.containsKey('last_login_at')) {
      context.handle(
          _lastLoginAtMeta,
          lastLoginAt.isAcceptableOrUnknown(
              data['last_login_at']!, _lastLoginAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      profilePictureUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}profile_picture_url']),
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number']),
      dateOfBirth: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_of_birth']),
      preferences: $UsersTableTable.$converterpreferences.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}preferences'])!),
      emailVerified: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}email_verified'])!,
      mfaEnabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}mfa_enabled'])!,
      mfaSecret: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mfa_secret']),
      lastLoginAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_login_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $UsersTableTable createAlias(String alias) {
    return $UsersTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $converterpreferences =
      const CustomJsonTypeConverter();
}

class UserData extends DataClass implements Insertable<UserData> {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String? profilePictureUrl;
  final String? phoneNumber;
  final DateTime? dateOfBirth;
  final Map<String, dynamic> preferences;
  final bool emailVerified;
  final bool mfaEnabled;
  final String? mfaSecret;
  final DateTime? lastLoginAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const UserData(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      this.profilePictureUrl,
      this.phoneNumber,
      this.dateOfBirth,
      required this.preferences,
      required this.emailVerified,
      required this.mfaEnabled,
      this.mfaSecret,
      this.lastLoginAt,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['email'] = Variable<String>(email);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    if (!nullToAbsent || profilePictureUrl != null) {
      map['profile_picture_url'] = Variable<String>(profilePictureUrl);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || dateOfBirth != null) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    }
    {
      map['preferences'] = Variable<String>(
          $UsersTableTable.$converterpreferences.toSql(preferences));
    }
    map['email_verified'] = Variable<bool>(emailVerified);
    map['mfa_enabled'] = Variable<bool>(mfaEnabled);
    if (!nullToAbsent || mfaSecret != null) {
      map['mfa_secret'] = Variable<String>(mfaSecret);
    }
    if (!nullToAbsent || lastLoginAt != null) {
      map['last_login_at'] = Variable<DateTime>(lastLoginAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  UsersTableCompanion toCompanion(bool nullToAbsent) {
    return UsersTableCompanion(
      id: Value(id),
      email: Value(email),
      firstName: Value(firstName),
      lastName: Value(lastName),
      profilePictureUrl: profilePictureUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePictureUrl),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
      preferences: Value(preferences),
      emailVerified: Value(emailVerified),
      mfaEnabled: Value(mfaEnabled),
      mfaSecret: mfaSecret == null && nullToAbsent
          ? const Value.absent()
          : Value(mfaSecret),
      lastLoginAt: lastLoginAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastLoginAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<String>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      profilePictureUrl:
          serializer.fromJson<String?>(json['profilePictureUrl']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      dateOfBirth: serializer.fromJson<DateTime?>(json['dateOfBirth']),
      preferences:
          serializer.fromJson<Map<String, dynamic>>(json['preferences']),
      emailVerified: serializer.fromJson<bool>(json['emailVerified']),
      mfaEnabled: serializer.fromJson<bool>(json['mfaEnabled']),
      mfaSecret: serializer.fromJson<String?>(json['mfaSecret']),
      lastLoginAt: serializer.fromJson<DateTime?>(json['lastLoginAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'email': serializer.toJson<String>(email),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'profilePictureUrl': serializer.toJson<String?>(profilePictureUrl),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'dateOfBirth': serializer.toJson<DateTime?>(dateOfBirth),
      'preferences': serializer.toJson<Map<String, dynamic>>(preferences),
      'emailVerified': serializer.toJson<bool>(emailVerified),
      'mfaEnabled': serializer.toJson<bool>(mfaEnabled),
      'mfaSecret': serializer.toJson<String?>(mfaSecret),
      'lastLoginAt': serializer.toJson<DateTime?>(lastLoginAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  UserData copyWith(
          {String? id,
          String? email,
          String? firstName,
          String? lastName,
          Value<String?> profilePictureUrl = const Value.absent(),
          Value<String?> phoneNumber = const Value.absent(),
          Value<DateTime?> dateOfBirth = const Value.absent(),
          Map<String, dynamic>? preferences,
          bool? emailVerified,
          bool? mfaEnabled,
          Value<String?> mfaSecret = const Value.absent(),
          Value<DateTime?> lastLoginAt = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      UserData(
        id: id ?? this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        profilePictureUrl: profilePictureUrl.present
            ? profilePictureUrl.value
            : this.profilePictureUrl,
        phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
        dateOfBirth: dateOfBirth.present ? dateOfBirth.value : this.dateOfBirth,
        preferences: preferences ?? this.preferences,
        emailVerified: emailVerified ?? this.emailVerified,
        mfaEnabled: mfaEnabled ?? this.mfaEnabled,
        mfaSecret: mfaSecret.present ? mfaSecret.value : this.mfaSecret,
        lastLoginAt: lastLoginAt.present ? lastLoginAt.value : this.lastLoginAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  UserData copyWithCompanion(UsersTableCompanion data) {
    return UserData(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      profilePictureUrl: data.profilePictureUrl.present
          ? data.profilePictureUrl.value
          : this.profilePictureUrl,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      dateOfBirth:
          data.dateOfBirth.present ? data.dateOfBirth.value : this.dateOfBirth,
      preferences:
          data.preferences.present ? data.preferences.value : this.preferences,
      emailVerified: data.emailVerified.present
          ? data.emailVerified.value
          : this.emailVerified,
      mfaEnabled:
          data.mfaEnabled.present ? data.mfaEnabled.value : this.mfaEnabled,
      mfaSecret: data.mfaSecret.present ? data.mfaSecret.value : this.mfaSecret,
      lastLoginAt:
          data.lastLoginAt.present ? data.lastLoginAt.value : this.lastLoginAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('profilePictureUrl: $profilePictureUrl, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('preferences: $preferences, ')
          ..write('emailVerified: $emailVerified, ')
          ..write('mfaEnabled: $mfaEnabled, ')
          ..write('mfaSecret: $mfaSecret, ')
          ..write('lastLoginAt: $lastLoginAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      email,
      firstName,
      lastName,
      profilePictureUrl,
      phoneNumber,
      dateOfBirth,
      preferences,
      emailVerified,
      mfaEnabled,
      mfaSecret,
      lastLoginAt,
      createdAt,
      updatedAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.email == this.email &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.profilePictureUrl == this.profilePictureUrl &&
          other.phoneNumber == this.phoneNumber &&
          other.dateOfBirth == this.dateOfBirth &&
          other.preferences == this.preferences &&
          other.emailVerified == this.emailVerified &&
          other.mfaEnabled == this.mfaEnabled &&
          other.mfaSecret == this.mfaSecret &&
          other.lastLoginAt == this.lastLoginAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class UsersTableCompanion extends UpdateCompanion<UserData> {
  final Value<String> id;
  final Value<String> email;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String?> profilePictureUrl;
  final Value<String?> phoneNumber;
  final Value<DateTime?> dateOfBirth;
  final Value<Map<String, dynamic>> preferences;
  final Value<bool> emailVerified;
  final Value<bool> mfaEnabled;
  final Value<String?> mfaSecret;
  final Value<DateTime?> lastLoginAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const UsersTableCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.profilePictureUrl = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.preferences = const Value.absent(),
    this.emailVerified = const Value.absent(),
    this.mfaEnabled = const Value.absent(),
    this.mfaSecret = const Value.absent(),
    this.lastLoginAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersTableCompanion.insert({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    this.profilePictureUrl = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.preferences = const Value.absent(),
    this.emailVerified = const Value.absent(),
    this.mfaEnabled = const Value.absent(),
    this.mfaSecret = const Value.absent(),
    this.lastLoginAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        email = Value(email),
        firstName = Value(firstName),
        lastName = Value(lastName),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<UserData> custom({
    Expression<String>? id,
    Expression<String>? email,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? profilePictureUrl,
    Expression<String>? phoneNumber,
    Expression<DateTime>? dateOfBirth,
    Expression<String>? preferences,
    Expression<bool>? emailVerified,
    Expression<bool>? mfaEnabled,
    Expression<String>? mfaSecret,
    Expression<DateTime>? lastLoginAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (profilePictureUrl != null) 'profile_picture_url': profilePictureUrl,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (preferences != null) 'preferences': preferences,
      if (emailVerified != null) 'email_verified': emailVerified,
      if (mfaEnabled != null) 'mfa_enabled': mfaEnabled,
      if (mfaSecret != null) 'mfa_secret': mfaSecret,
      if (lastLoginAt != null) 'last_login_at': lastLoginAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? email,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String?>? profilePictureUrl,
      Value<String?>? phoneNumber,
      Value<DateTime?>? dateOfBirth,
      Value<Map<String, dynamic>>? preferences,
      Value<bool>? emailVerified,
      Value<bool>? mfaEnabled,
      Value<String?>? mfaSecret,
      Value<DateTime?>? lastLoginAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return UsersTableCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      preferences: preferences ?? this.preferences,
      emailVerified: emailVerified ?? this.emailVerified,
      mfaEnabled: mfaEnabled ?? this.mfaEnabled,
      mfaSecret: mfaSecret ?? this.mfaSecret,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (profilePictureUrl.present) {
      map['profile_picture_url'] = Variable<String>(profilePictureUrl.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (preferences.present) {
      map['preferences'] = Variable<String>(
          $UsersTableTable.$converterpreferences.toSql(preferences.value));
    }
    if (emailVerified.present) {
      map['email_verified'] = Variable<bool>(emailVerified.value);
    }
    if (mfaEnabled.present) {
      map['mfa_enabled'] = Variable<bool>(mfaEnabled.value);
    }
    if (mfaSecret.present) {
      map['mfa_secret'] = Variable<String>(mfaSecret.value);
    }
    if (lastLoginAt.present) {
      map['last_login_at'] = Variable<DateTime>(lastLoginAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('profilePictureUrl: $profilePictureUrl, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('preferences: $preferences, ')
          ..write('emailVerified: $emailVerified, ')
          ..write('mfaEnabled: $mfaEnabled, ')
          ..write('mfaSecret: $mfaSecret, ')
          ..write('lastLoginAt: $lastLoginAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TreesTableTable extends TreesTable
    with TableInfo<$TreesTableTable, TreeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TreesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ownerIdMeta =
      const VerificationMeta('ownerId');
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
      'owner_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users_table (id)'));
  static const VerificationMeta _visibilityMeta =
      const VerificationMeta('visibility');
  @override
  late final GeneratedColumn<String> visibility = GeneratedColumn<String>(
      'visibility', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('private'));
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      settings = GeneratedColumn<String>('settings', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('{}'))
          .withConverter<Map<String, dynamic>>(
              $TreesTableTable.$convertersettings);
  static const VerificationMeta _coverImageUrlMeta =
      const VerificationMeta('coverImageUrl');
  @override
  late final GeneratedColumn<String> coverImageUrl = GeneratedColumn<String>(
      'cover_image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        ownerId,
        visibility,
        settings,
        coverImageUrl,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trees_table';
  @override
  VerificationContext validateIntegrity(Insertable<TreeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('owner_id')) {
      context.handle(_ownerIdMeta,
          ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta));
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('visibility')) {
      context.handle(
          _visibilityMeta,
          visibility.isAcceptableOrUnknown(
              data['visibility']!, _visibilityMeta));
    }
    if (data.containsKey('cover_image_url')) {
      context.handle(
          _coverImageUrlMeta,
          coverImageUrl.isAcceptableOrUnknown(
              data['cover_image_url']!, _coverImageUrlMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TreeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TreeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      ownerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}owner_id'])!,
      visibility: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}visibility'])!,
      settings: $TreesTableTable.$convertersettings.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}settings'])!),
      coverImageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cover_image_url']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TreesTableTable createAlias(String alias) {
    return $TreesTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $convertersettings =
      const CustomJsonTypeConverter();
}

class TreeData extends DataClass implements Insertable<TreeData> {
  final String id;
  final String name;
  final String? description;
  final String ownerId;
  final String visibility;
  final Map<String, dynamic> settings;
  final String? coverImageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const TreeData(
      {required this.id,
      required this.name,
      this.description,
      required this.ownerId,
      required this.visibility,
      required this.settings,
      this.coverImageUrl,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['owner_id'] = Variable<String>(ownerId);
    map['visibility'] = Variable<String>(visibility);
    {
      map['settings'] =
          Variable<String>($TreesTableTable.$convertersettings.toSql(settings));
    }
    if (!nullToAbsent || coverImageUrl != null) {
      map['cover_image_url'] = Variable<String>(coverImageUrl);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  TreesTableCompanion toCompanion(bool nullToAbsent) {
    return TreesTableCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      ownerId: Value(ownerId),
      visibility: Value(visibility),
      settings: Value(settings),
      coverImageUrl: coverImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(coverImageUrl),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory TreeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TreeData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      visibility: serializer.fromJson<String>(json['visibility']),
      settings: serializer.fromJson<Map<String, dynamic>>(json['settings']),
      coverImageUrl: serializer.fromJson<String?>(json['coverImageUrl']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'ownerId': serializer.toJson<String>(ownerId),
      'visibility': serializer.toJson<String>(visibility),
      'settings': serializer.toJson<Map<String, dynamic>>(settings),
      'coverImageUrl': serializer.toJson<String?>(coverImageUrl),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  TreeData copyWith(
          {String? id,
          String? name,
          Value<String?> description = const Value.absent(),
          String? ownerId,
          String? visibility,
          Map<String, dynamic>? settings,
          Value<String?> coverImageUrl = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      TreeData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        ownerId: ownerId ?? this.ownerId,
        visibility: visibility ?? this.visibility,
        settings: settings ?? this.settings,
        coverImageUrl:
            coverImageUrl.present ? coverImageUrl.value : this.coverImageUrl,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  TreeData copyWithCompanion(TreesTableCompanion data) {
    return TreeData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      visibility:
          data.visibility.present ? data.visibility.value : this.visibility,
      settings: data.settings.present ? data.settings.value : this.settings,
      coverImageUrl: data.coverImageUrl.present
          ? data.coverImageUrl.value
          : this.coverImageUrl,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TreeData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('ownerId: $ownerId, ')
          ..write('visibility: $visibility, ')
          ..write('settings: $settings, ')
          ..write('coverImageUrl: $coverImageUrl, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, ownerId, visibility,
      settings, coverImageUrl, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TreeData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.ownerId == this.ownerId &&
          other.visibility == this.visibility &&
          other.settings == this.settings &&
          other.coverImageUrl == this.coverImageUrl &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class TreesTableCompanion extends UpdateCompanion<TreeData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> ownerId;
  final Value<String> visibility;
  final Value<Map<String, dynamic>> settings;
  final Value<String?> coverImageUrl;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const TreesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.visibility = const Value.absent(),
    this.settings = const Value.absent(),
    this.coverImageUrl = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TreesTableCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    required String ownerId,
    this.visibility = const Value.absent(),
    this.settings = const Value.absent(),
    this.coverImageUrl = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        ownerId = Value(ownerId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TreeData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? ownerId,
    Expression<String>? visibility,
    Expression<String>? settings,
    Expression<String>? coverImageUrl,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (ownerId != null) 'owner_id': ownerId,
      if (visibility != null) 'visibility': visibility,
      if (settings != null) 'settings': settings,
      if (coverImageUrl != null) 'cover_image_url': coverImageUrl,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TreesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String>? ownerId,
      Value<String>? visibility,
      Value<Map<String, dynamic>>? settings,
      Value<String?>? coverImageUrl,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return TreesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      ownerId: ownerId ?? this.ownerId,
      visibility: visibility ?? this.visibility,
      settings: settings ?? this.settings,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (visibility.present) {
      map['visibility'] = Variable<String>(visibility.value);
    }
    if (settings.present) {
      map['settings'] = Variable<String>(
          $TreesTableTable.$convertersettings.toSql(settings.value));
    }
    if (coverImageUrl.present) {
      map['cover_image_url'] = Variable<String>(coverImageUrl.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TreesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('ownerId: $ownerId, ')
          ..write('visibility: $visibility, ')
          ..write('settings: $settings, ')
          ..write('coverImageUrl: $coverImageUrl, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TreeMembersTableTable extends TreeMembersTable
    with TableInfo<$TreeMembersTableTable, TreeMemberData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TreeMembersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _treeIdMeta = const VerificationMeta('treeId');
  @override
  late final GeneratedColumn<String> treeId = GeneratedColumn<String>(
      'tree_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES trees_table (id)'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users_table (id)'));
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _invitedByMeta =
      const VerificationMeta('invitedBy');
  @override
  late final GeneratedColumn<String> invitedBy = GeneratedColumn<String>(
      'invited_by', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users_table (id)'));
  static const VerificationMeta _invitedAtMeta =
      const VerificationMeta('invitedAt');
  @override
  late final GeneratedColumn<DateTime> invitedAt = GeneratedColumn<DateTime>(
      'invited_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _acceptedAtMeta =
      const VerificationMeta('acceptedAt');
  @override
  late final GeneratedColumn<DateTime> acceptedAt = GeneratedColumn<DateTime>(
      'accepted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      permissions = GeneratedColumn<String>('permissions', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('{}'))
          .withConverter<Map<String, dynamic>>(
              $TreeMembersTableTable.$converterpermissions);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        treeId,
        userId,
        role,
        invitedBy,
        invitedAt,
        acceptedAt,
        permissions,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tree_members_table';
  @override
  VerificationContext validateIntegrity(Insertable<TreeMemberData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('tree_id')) {
      context.handle(_treeIdMeta,
          treeId.isAcceptableOrUnknown(data['tree_id']!, _treeIdMeta));
    } else if (isInserting) {
      context.missing(_treeIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('invited_by')) {
      context.handle(_invitedByMeta,
          invitedBy.isAcceptableOrUnknown(data['invited_by']!, _invitedByMeta));
    } else if (isInserting) {
      context.missing(_invitedByMeta);
    }
    if (data.containsKey('invited_at')) {
      context.handle(_invitedAtMeta,
          invitedAt.isAcceptableOrUnknown(data['invited_at']!, _invitedAtMeta));
    } else if (isInserting) {
      context.missing(_invitedAtMeta);
    }
    if (data.containsKey('accepted_at')) {
      context.handle(
          _acceptedAtMeta,
          acceptedAt.isAcceptableOrUnknown(
              data['accepted_at']!, _acceptedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TreeMemberData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TreeMemberData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      treeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tree_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
      invitedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invited_by'])!,
      invitedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}invited_at'])!,
      acceptedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}accepted_at']),
      permissions: $TreeMembersTableTable.$converterpermissions.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}permissions'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $TreeMembersTableTable createAlias(String alias) {
    return $TreeMembersTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $converterpermissions =
      const CustomJsonTypeConverter();
}

class TreeMemberData extends DataClass implements Insertable<TreeMemberData> {
  final String id;
  final String treeId;
  final String userId;
  final String role;
  final String invitedBy;
  final DateTime invitedAt;
  final DateTime? acceptedAt;
  final Map<String, dynamic> permissions;
  final DateTime createdAt;
  final DateTime updatedAt;
  const TreeMemberData(
      {required this.id,
      required this.treeId,
      required this.userId,
      required this.role,
      required this.invitedBy,
      required this.invitedAt,
      this.acceptedAt,
      required this.permissions,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['tree_id'] = Variable<String>(treeId);
    map['user_id'] = Variable<String>(userId);
    map['role'] = Variable<String>(role);
    map['invited_by'] = Variable<String>(invitedBy);
    map['invited_at'] = Variable<DateTime>(invitedAt);
    if (!nullToAbsent || acceptedAt != null) {
      map['accepted_at'] = Variable<DateTime>(acceptedAt);
    }
    {
      map['permissions'] = Variable<String>(
          $TreeMembersTableTable.$converterpermissions.toSql(permissions));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TreeMembersTableCompanion toCompanion(bool nullToAbsent) {
    return TreeMembersTableCompanion(
      id: Value(id),
      treeId: Value(treeId),
      userId: Value(userId),
      role: Value(role),
      invitedBy: Value(invitedBy),
      invitedAt: Value(invitedAt),
      acceptedAt: acceptedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(acceptedAt),
      permissions: Value(permissions),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TreeMemberData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TreeMemberData(
      id: serializer.fromJson<String>(json['id']),
      treeId: serializer.fromJson<String>(json['treeId']),
      userId: serializer.fromJson<String>(json['userId']),
      role: serializer.fromJson<String>(json['role']),
      invitedBy: serializer.fromJson<String>(json['invitedBy']),
      invitedAt: serializer.fromJson<DateTime>(json['invitedAt']),
      acceptedAt: serializer.fromJson<DateTime?>(json['acceptedAt']),
      permissions:
          serializer.fromJson<Map<String, dynamic>>(json['permissions']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'treeId': serializer.toJson<String>(treeId),
      'userId': serializer.toJson<String>(userId),
      'role': serializer.toJson<String>(role),
      'invitedBy': serializer.toJson<String>(invitedBy),
      'invitedAt': serializer.toJson<DateTime>(invitedAt),
      'acceptedAt': serializer.toJson<DateTime?>(acceptedAt),
      'permissions': serializer.toJson<Map<String, dynamic>>(permissions),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TreeMemberData copyWith(
          {String? id,
          String? treeId,
          String? userId,
          String? role,
          String? invitedBy,
          DateTime? invitedAt,
          Value<DateTime?> acceptedAt = const Value.absent(),
          Map<String, dynamic>? permissions,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      TreeMemberData(
        id: id ?? this.id,
        treeId: treeId ?? this.treeId,
        userId: userId ?? this.userId,
        role: role ?? this.role,
        invitedBy: invitedBy ?? this.invitedBy,
        invitedAt: invitedAt ?? this.invitedAt,
        acceptedAt: acceptedAt.present ? acceptedAt.value : this.acceptedAt,
        permissions: permissions ?? this.permissions,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  TreeMemberData copyWithCompanion(TreeMembersTableCompanion data) {
    return TreeMemberData(
      id: data.id.present ? data.id.value : this.id,
      treeId: data.treeId.present ? data.treeId.value : this.treeId,
      userId: data.userId.present ? data.userId.value : this.userId,
      role: data.role.present ? data.role.value : this.role,
      invitedBy: data.invitedBy.present ? data.invitedBy.value : this.invitedBy,
      invitedAt: data.invitedAt.present ? data.invitedAt.value : this.invitedAt,
      acceptedAt:
          data.acceptedAt.present ? data.acceptedAt.value : this.acceptedAt,
      permissions:
          data.permissions.present ? data.permissions.value : this.permissions,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TreeMemberData(')
          ..write('id: $id, ')
          ..write('treeId: $treeId, ')
          ..write('userId: $userId, ')
          ..write('role: $role, ')
          ..write('invitedBy: $invitedBy, ')
          ..write('invitedAt: $invitedAt, ')
          ..write('acceptedAt: $acceptedAt, ')
          ..write('permissions: $permissions, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, treeId, userId, role, invitedBy,
      invitedAt, acceptedAt, permissions, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TreeMemberData &&
          other.id == this.id &&
          other.treeId == this.treeId &&
          other.userId == this.userId &&
          other.role == this.role &&
          other.invitedBy == this.invitedBy &&
          other.invitedAt == this.invitedAt &&
          other.acceptedAt == this.acceptedAt &&
          other.permissions == this.permissions &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TreeMembersTableCompanion extends UpdateCompanion<TreeMemberData> {
  final Value<String> id;
  final Value<String> treeId;
  final Value<String> userId;
  final Value<String> role;
  final Value<String> invitedBy;
  final Value<DateTime> invitedAt;
  final Value<DateTime?> acceptedAt;
  final Value<Map<String, dynamic>> permissions;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const TreeMembersTableCompanion({
    this.id = const Value.absent(),
    this.treeId = const Value.absent(),
    this.userId = const Value.absent(),
    this.role = const Value.absent(),
    this.invitedBy = const Value.absent(),
    this.invitedAt = const Value.absent(),
    this.acceptedAt = const Value.absent(),
    this.permissions = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TreeMembersTableCompanion.insert({
    required String id,
    required String treeId,
    required String userId,
    required String role,
    required String invitedBy,
    required DateTime invitedAt,
    this.acceptedAt = const Value.absent(),
    this.permissions = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        treeId = Value(treeId),
        userId = Value(userId),
        role = Value(role),
        invitedBy = Value(invitedBy),
        invitedAt = Value(invitedAt),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TreeMemberData> custom({
    Expression<String>? id,
    Expression<String>? treeId,
    Expression<String>? userId,
    Expression<String>? role,
    Expression<String>? invitedBy,
    Expression<DateTime>? invitedAt,
    Expression<DateTime>? acceptedAt,
    Expression<String>? permissions,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (treeId != null) 'tree_id': treeId,
      if (userId != null) 'user_id': userId,
      if (role != null) 'role': role,
      if (invitedBy != null) 'invited_by': invitedBy,
      if (invitedAt != null) 'invited_at': invitedAt,
      if (acceptedAt != null) 'accepted_at': acceptedAt,
      if (permissions != null) 'permissions': permissions,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TreeMembersTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? treeId,
      Value<String>? userId,
      Value<String>? role,
      Value<String>? invitedBy,
      Value<DateTime>? invitedAt,
      Value<DateTime?>? acceptedAt,
      Value<Map<String, dynamic>>? permissions,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return TreeMembersTableCompanion(
      id: id ?? this.id,
      treeId: treeId ?? this.treeId,
      userId: userId ?? this.userId,
      role: role ?? this.role,
      invitedBy: invitedBy ?? this.invitedBy,
      invitedAt: invitedAt ?? this.invitedAt,
      acceptedAt: acceptedAt ?? this.acceptedAt,
      permissions: permissions ?? this.permissions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (treeId.present) {
      map['tree_id'] = Variable<String>(treeId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (invitedBy.present) {
      map['invited_by'] = Variable<String>(invitedBy.value);
    }
    if (invitedAt.present) {
      map['invited_at'] = Variable<DateTime>(invitedAt.value);
    }
    if (acceptedAt.present) {
      map['accepted_at'] = Variable<DateTime>(acceptedAt.value);
    }
    if (permissions.present) {
      map['permissions'] = Variable<String>($TreeMembersTableTable
          .$converterpermissions
          .toSql(permissions.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TreeMembersTableCompanion(')
          ..write('id: $id, ')
          ..write('treeId: $treeId, ')
          ..write('userId: $userId, ')
          ..write('role: $role, ')
          ..write('invitedBy: $invitedBy, ')
          ..write('invitedAt: $invitedAt, ')
          ..write('acceptedAt: $acceptedAt, ')
          ..write('permissions: $permissions, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PersonsTableTable extends PersonsTable
    with TableInfo<$PersonsTableTable, PersonData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _treeIdMeta = const VerificationMeta('treeId');
  @override
  late final GeneratedColumn<String> treeId = GeneratedColumn<String>(
      'tree_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES trees_table (id)'));
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _middleNameMeta =
      const VerificationMeta('middleName');
  @override
  late final GeneratedColumn<String> middleName = GeneratedColumn<String>(
      'middle_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _maidenNameMeta =
      const VerificationMeta('maidenName');
  @override
  late final GeneratedColumn<String> maidenName = GeneratedColumn<String>(
      'maiden_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> nicknames =
      GeneratedColumn<String>('nicknames', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant(''))
          .withConverter<List<String>>($PersonsTableTable.$converternicknames);
  static const VerificationMeta _suffixMeta = const VerificationMeta('suffix');
  @override
  late final GeneratedColumn<String> suffix = GeneratedColumn<String>(
      'suffix', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _prefixMeta = const VerificationMeta('prefix');
  @override
  late final GeneratedColumn<String> prefix = GeneratedColumn<String>(
      'prefix', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
      'date_of_birth', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      placeOfBirth = GeneratedColumn<String>(
              'place_of_birth', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Map<String, dynamic>?>(
              $PersonsTableTable.$converterplaceOfBirthn);
  static const VerificationMeta _dateOfDeathMeta =
      const VerificationMeta('dateOfDeath');
  @override
  late final GeneratedColumn<DateTime> dateOfDeath = GeneratedColumn<DateTime>(
      'date_of_death', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      placeOfDeath = GeneratedColumn<String>(
              'place_of_death', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Map<String, dynamic>?>(
              $PersonsTableTable.$converterplaceOfDeathn);
  static const VerificationMeta _isLivingMeta =
      const VerificationMeta('isLiving');
  @override
  late final GeneratedColumn<bool> isLiving = GeneratedColumn<bool>(
      'is_living', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_living" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _biographyMeta =
      const VerificationMeta('biography');
  @override
  late final GeneratedColumn<String> biography = GeneratedColumn<String>(
      'biography', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> occupation =
      GeneratedColumn<String>('occupation', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant(''))
          .withConverter<List<String>>($PersonsTableTable.$converteroccupation);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> education =
      GeneratedColumn<String>('education', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant(''))
          .withConverter<List<String>>($PersonsTableTable.$convertereducation);
  static const VerificationMeta _religionMeta =
      const VerificationMeta('religion');
  @override
  late final GeneratedColumn<String> religion = GeneratedColumn<String>(
      'religion', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> ethnicity =
      GeneratedColumn<String>('ethnicity', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant(''))
          .withConverter<List<String>>($PersonsTableTable.$converterethnicity);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      address = GeneratedColumn<String>('address', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Map<String, dynamic>?>(
              $PersonsTableTable.$converteraddressn);
  static const VerificationMeta _privacyMeta =
      const VerificationMeta('privacy');
  @override
  late final GeneratedColumn<String> privacy = GeneratedColumn<String>(
      'privacy', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('family'));
  static const VerificationMeta _profilePictureIdMeta =
      const VerificationMeta('profilePictureId');
  @override
  late final GeneratedColumn<String> profilePictureId = GeneratedColumn<String>(
      'profile_picture_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      customFields = GeneratedColumn<String>(
              'custom_fields', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('{}'))
          .withConverter<Map<String, dynamic>>(
              $PersonsTableTable.$convertercustomFields);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
      'created_by', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users_table (id)'));
  static const VerificationMeta _updatedByMeta =
      const VerificationMeta('updatedBy');
  @override
  late final GeneratedColumn<String> updatedBy = GeneratedColumn<String>(
      'updated_by', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users_table (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncPendingMeta =
      const VerificationMeta('syncPending');
  @override
  late final GeneratedColumn<bool> syncPending = GeneratedColumn<bool>(
      'sync_pending', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("sync_pending" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        treeId,
        firstName,
        middleName,
        lastName,
        maidenName,
        nicknames,
        suffix,
        prefix,
        gender,
        dateOfBirth,
        placeOfBirth,
        dateOfDeath,
        placeOfDeath,
        isLiving,
        biography,
        occupation,
        education,
        religion,
        ethnicity,
        email,
        phoneNumber,
        address,
        privacy,
        profilePictureId,
        customFields,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt,
        deletedAt,
        syncPending
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'persons_table';
  @override
  VerificationContext validateIntegrity(Insertable<PersonData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('tree_id')) {
      context.handle(_treeIdMeta,
          treeId.isAcceptableOrUnknown(data['tree_id']!, _treeIdMeta));
    } else if (isInserting) {
      context.missing(_treeIdMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('middle_name')) {
      context.handle(
          _middleNameMeta,
          middleName.isAcceptableOrUnknown(
              data['middle_name']!, _middleNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('maiden_name')) {
      context.handle(
          _maidenNameMeta,
          maidenName.isAcceptableOrUnknown(
              data['maiden_name']!, _maidenNameMeta));
    }
    if (data.containsKey('suffix')) {
      context.handle(_suffixMeta,
          suffix.isAcceptableOrUnknown(data['suffix']!, _suffixMeta));
    }
    if (data.containsKey('prefix')) {
      context.handle(_prefixMeta,
          prefix.isAcceptableOrUnknown(data['prefix']!, _prefixMeta));
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
          _dateOfBirthMeta,
          dateOfBirth.isAcceptableOrUnknown(
              data['date_of_birth']!, _dateOfBirthMeta));
    }
    if (data.containsKey('date_of_death')) {
      context.handle(
          _dateOfDeathMeta,
          dateOfDeath.isAcceptableOrUnknown(
              data['date_of_death']!, _dateOfDeathMeta));
    }
    if (data.containsKey('is_living')) {
      context.handle(_isLivingMeta,
          isLiving.isAcceptableOrUnknown(data['is_living']!, _isLivingMeta));
    }
    if (data.containsKey('biography')) {
      context.handle(_biographyMeta,
          biography.isAcceptableOrUnknown(data['biography']!, _biographyMeta));
    }
    if (data.containsKey('religion')) {
      context.handle(_religionMeta,
          religion.isAcceptableOrUnknown(data['religion']!, _religionMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    }
    if (data.containsKey('privacy')) {
      context.handle(_privacyMeta,
          privacy.isAcceptableOrUnknown(data['privacy']!, _privacyMeta));
    }
    if (data.containsKey('profile_picture_id')) {
      context.handle(
          _profilePictureIdMeta,
          profilePictureId.isAcceptableOrUnknown(
              data['profile_picture_id']!, _profilePictureIdMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    } else if (isInserting) {
      context.missing(_createdByMeta);
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by']!, _updatedByMeta));
    } else if (isInserting) {
      context.missing(_updatedByMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_pending')) {
      context.handle(
          _syncPendingMeta,
          syncPending.isAcceptableOrUnknown(
              data['sync_pending']!, _syncPendingMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      treeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tree_id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      middleName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}middle_name']),
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name']),
      maidenName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}maiden_name']),
      nicknames: $PersonsTableTable.$converternicknames.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nicknames'])!),
      suffix: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}suffix']),
      prefix: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}prefix']),
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender']),
      dateOfBirth: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_of_birth']),
      placeOfBirth: $PersonsTableTable.$converterplaceOfBirthn.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}place_of_birth'])),
      dateOfDeath: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_of_death']),
      placeOfDeath: $PersonsTableTable.$converterplaceOfDeathn.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}place_of_death'])),
      isLiving: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_living'])!,
      biography: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}biography']),
      occupation: $PersonsTableTable.$converteroccupation.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}occupation'])!),
      education: $PersonsTableTable.$convertereducation.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}education'])!),
      religion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}religion']),
      ethnicity: $PersonsTableTable.$converterethnicity.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ethnicity'])!),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number']),
      address: $PersonsTableTable.$converteraddressn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])),
      privacy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}privacy'])!,
      profilePictureId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}profile_picture_id']),
      customFields: $PersonsTableTable.$convertercustomFields.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}custom_fields'])!),
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by'])!,
      updatedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_by'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncPending: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sync_pending'])!,
    );
  }

  @override
  $PersonsTableTable createAlias(String alias) {
    return $PersonsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converternicknames =
      const StringListConverter();
  static TypeConverter<Map<String, dynamic>, String> $converterplaceOfBirth =
      const CustomJsonTypeConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $converterplaceOfBirthn =
      NullAwareTypeConverter.wrap($converterplaceOfBirth);
  static TypeConverter<Map<String, dynamic>, String> $converterplaceOfDeath =
      const CustomJsonTypeConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $converterplaceOfDeathn =
      NullAwareTypeConverter.wrap($converterplaceOfDeath);
  static TypeConverter<List<String>, String> $converteroccupation =
      const StringListConverter();
  static TypeConverter<List<String>, String> $convertereducation =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converterethnicity =
      const StringListConverter();
  static TypeConverter<Map<String, dynamic>, String> $converteraddress =
      const CustomJsonTypeConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $converteraddressn =
      NullAwareTypeConverter.wrap($converteraddress);
  static TypeConverter<Map<String, dynamic>, String> $convertercustomFields =
      const CustomJsonTypeConverter();
}

class PersonData extends DataClass implements Insertable<PersonData> {
  final String id;
  final String treeId;
  final String firstName;
  final String? middleName;
  final String? lastName;
  final String? maidenName;
  final List<String> nicknames;
  final String? suffix;
  final String? prefix;
  final String? gender;
  final DateTime? dateOfBirth;
  final Map<String, dynamic>? placeOfBirth;
  final DateTime? dateOfDeath;
  final Map<String, dynamic>? placeOfDeath;
  final bool isLiving;
  final String? biography;
  final List<String> occupation;
  final List<String> education;
  final String? religion;
  final List<String> ethnicity;
  final String? email;
  final String? phoneNumber;
  final Map<String, dynamic>? address;
  final String privacy;
  final String? profilePictureId;
  final Map<String, dynamic> customFields;
  final String createdBy;
  final String updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final bool syncPending;
  const PersonData(
      {required this.id,
      required this.treeId,
      required this.firstName,
      this.middleName,
      this.lastName,
      this.maidenName,
      required this.nicknames,
      this.suffix,
      this.prefix,
      this.gender,
      this.dateOfBirth,
      this.placeOfBirth,
      this.dateOfDeath,
      this.placeOfDeath,
      required this.isLiving,
      this.biography,
      required this.occupation,
      required this.education,
      this.religion,
      required this.ethnicity,
      this.email,
      this.phoneNumber,
      this.address,
      required this.privacy,
      this.profilePictureId,
      required this.customFields,
      required this.createdBy,
      required this.updatedBy,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      required this.syncPending});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['tree_id'] = Variable<String>(treeId);
    map['first_name'] = Variable<String>(firstName);
    if (!nullToAbsent || middleName != null) {
      map['middle_name'] = Variable<String>(middleName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || maidenName != null) {
      map['maiden_name'] = Variable<String>(maidenName);
    }
    {
      map['nicknames'] = Variable<String>(
          $PersonsTableTable.$converternicknames.toSql(nicknames));
    }
    if (!nullToAbsent || suffix != null) {
      map['suffix'] = Variable<String>(suffix);
    }
    if (!nullToAbsent || prefix != null) {
      map['prefix'] = Variable<String>(prefix);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || dateOfBirth != null) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    }
    if (!nullToAbsent || placeOfBirth != null) {
      map['place_of_birth'] = Variable<String>(
          $PersonsTableTable.$converterplaceOfBirthn.toSql(placeOfBirth));
    }
    if (!nullToAbsent || dateOfDeath != null) {
      map['date_of_death'] = Variable<DateTime>(dateOfDeath);
    }
    if (!nullToAbsent || placeOfDeath != null) {
      map['place_of_death'] = Variable<String>(
          $PersonsTableTable.$converterplaceOfDeathn.toSql(placeOfDeath));
    }
    map['is_living'] = Variable<bool>(isLiving);
    if (!nullToAbsent || biography != null) {
      map['biography'] = Variable<String>(biography);
    }
    {
      map['occupation'] = Variable<String>(
          $PersonsTableTable.$converteroccupation.toSql(occupation));
    }
    {
      map['education'] = Variable<String>(
          $PersonsTableTable.$convertereducation.toSql(education));
    }
    if (!nullToAbsent || religion != null) {
      map['religion'] = Variable<String>(religion);
    }
    {
      map['ethnicity'] = Variable<String>(
          $PersonsTableTable.$converterethnicity.toSql(ethnicity));
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(
          $PersonsTableTable.$converteraddressn.toSql(address));
    }
    map['privacy'] = Variable<String>(privacy);
    if (!nullToAbsent || profilePictureId != null) {
      map['profile_picture_id'] = Variable<String>(profilePictureId);
    }
    {
      map['custom_fields'] = Variable<String>(
          $PersonsTableTable.$convertercustomFields.toSql(customFields));
    }
    map['created_by'] = Variable<String>(createdBy);
    map['updated_by'] = Variable<String>(updatedBy);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_pending'] = Variable<bool>(syncPending);
    return map;
  }

  PersonsTableCompanion toCompanion(bool nullToAbsent) {
    return PersonsTableCompanion(
      id: Value(id),
      treeId: Value(treeId),
      firstName: Value(firstName),
      middleName: middleName == null && nullToAbsent
          ? const Value.absent()
          : Value(middleName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      maidenName: maidenName == null && nullToAbsent
          ? const Value.absent()
          : Value(maidenName),
      nicknames: Value(nicknames),
      suffix:
          suffix == null && nullToAbsent ? const Value.absent() : Value(suffix),
      prefix:
          prefix == null && nullToAbsent ? const Value.absent() : Value(prefix),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
      placeOfBirth: placeOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(placeOfBirth),
      dateOfDeath: dateOfDeath == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfDeath),
      placeOfDeath: placeOfDeath == null && nullToAbsent
          ? const Value.absent()
          : Value(placeOfDeath),
      isLiving: Value(isLiving),
      biography: biography == null && nullToAbsent
          ? const Value.absent()
          : Value(biography),
      occupation: Value(occupation),
      education: Value(education),
      religion: religion == null && nullToAbsent
          ? const Value.absent()
          : Value(religion),
      ethnicity: Value(ethnicity),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      privacy: Value(privacy),
      profilePictureId: profilePictureId == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePictureId),
      customFields: Value(customFields),
      createdBy: Value(createdBy),
      updatedBy: Value(updatedBy),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncPending: Value(syncPending),
    );
  }

  factory PersonData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonData(
      id: serializer.fromJson<String>(json['id']),
      treeId: serializer.fromJson<String>(json['treeId']),
      firstName: serializer.fromJson<String>(json['firstName']),
      middleName: serializer.fromJson<String?>(json['middleName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      maidenName: serializer.fromJson<String?>(json['maidenName']),
      nicknames: serializer.fromJson<List<String>>(json['nicknames']),
      suffix: serializer.fromJson<String?>(json['suffix']),
      prefix: serializer.fromJson<String?>(json['prefix']),
      gender: serializer.fromJson<String?>(json['gender']),
      dateOfBirth: serializer.fromJson<DateTime?>(json['dateOfBirth']),
      placeOfBirth:
          serializer.fromJson<Map<String, dynamic>?>(json['placeOfBirth']),
      dateOfDeath: serializer.fromJson<DateTime?>(json['dateOfDeath']),
      placeOfDeath:
          serializer.fromJson<Map<String, dynamic>?>(json['placeOfDeath']),
      isLiving: serializer.fromJson<bool>(json['isLiving']),
      biography: serializer.fromJson<String?>(json['biography']),
      occupation: serializer.fromJson<List<String>>(json['occupation']),
      education: serializer.fromJson<List<String>>(json['education']),
      religion: serializer.fromJson<String?>(json['religion']),
      ethnicity: serializer.fromJson<List<String>>(json['ethnicity']),
      email: serializer.fromJson<String?>(json['email']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      address: serializer.fromJson<Map<String, dynamic>?>(json['address']),
      privacy: serializer.fromJson<String>(json['privacy']),
      profilePictureId: serializer.fromJson<String?>(json['profilePictureId']),
      customFields:
          serializer.fromJson<Map<String, dynamic>>(json['customFields']),
      createdBy: serializer.fromJson<String>(json['createdBy']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncPending: serializer.fromJson<bool>(json['syncPending']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'treeId': serializer.toJson<String>(treeId),
      'firstName': serializer.toJson<String>(firstName),
      'middleName': serializer.toJson<String?>(middleName),
      'lastName': serializer.toJson<String?>(lastName),
      'maidenName': serializer.toJson<String?>(maidenName),
      'nicknames': serializer.toJson<List<String>>(nicknames),
      'suffix': serializer.toJson<String?>(suffix),
      'prefix': serializer.toJson<String?>(prefix),
      'gender': serializer.toJson<String?>(gender),
      'dateOfBirth': serializer.toJson<DateTime?>(dateOfBirth),
      'placeOfBirth': serializer.toJson<Map<String, dynamic>?>(placeOfBirth),
      'dateOfDeath': serializer.toJson<DateTime?>(dateOfDeath),
      'placeOfDeath': serializer.toJson<Map<String, dynamic>?>(placeOfDeath),
      'isLiving': serializer.toJson<bool>(isLiving),
      'biography': serializer.toJson<String?>(biography),
      'occupation': serializer.toJson<List<String>>(occupation),
      'education': serializer.toJson<List<String>>(education),
      'religion': serializer.toJson<String?>(religion),
      'ethnicity': serializer.toJson<List<String>>(ethnicity),
      'email': serializer.toJson<String?>(email),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'address': serializer.toJson<Map<String, dynamic>?>(address),
      'privacy': serializer.toJson<String>(privacy),
      'profilePictureId': serializer.toJson<String?>(profilePictureId),
      'customFields': serializer.toJson<Map<String, dynamic>>(customFields),
      'createdBy': serializer.toJson<String>(createdBy),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncPending': serializer.toJson<bool>(syncPending),
    };
  }

  PersonData copyWith(
          {String? id,
          String? treeId,
          String? firstName,
          Value<String?> middleName = const Value.absent(),
          Value<String?> lastName = const Value.absent(),
          Value<String?> maidenName = const Value.absent(),
          List<String>? nicknames,
          Value<String?> suffix = const Value.absent(),
          Value<String?> prefix = const Value.absent(),
          Value<String?> gender = const Value.absent(),
          Value<DateTime?> dateOfBirth = const Value.absent(),
          Value<Map<String, dynamic>?> placeOfBirth = const Value.absent(),
          Value<DateTime?> dateOfDeath = const Value.absent(),
          Value<Map<String, dynamic>?> placeOfDeath = const Value.absent(),
          bool? isLiving,
          Value<String?> biography = const Value.absent(),
          List<String>? occupation,
          List<String>? education,
          Value<String?> religion = const Value.absent(),
          List<String>? ethnicity,
          Value<String?> email = const Value.absent(),
          Value<String?> phoneNumber = const Value.absent(),
          Value<Map<String, dynamic>?> address = const Value.absent(),
          String? privacy,
          Value<String?> profilePictureId = const Value.absent(),
          Map<String, dynamic>? customFields,
          String? createdBy,
          String? updatedBy,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent(),
          bool? syncPending}) =>
      PersonData(
        id: id ?? this.id,
        treeId: treeId ?? this.treeId,
        firstName: firstName ?? this.firstName,
        middleName: middleName.present ? middleName.value : this.middleName,
        lastName: lastName.present ? lastName.value : this.lastName,
        maidenName: maidenName.present ? maidenName.value : this.maidenName,
        nicknames: nicknames ?? this.nicknames,
        suffix: suffix.present ? suffix.value : this.suffix,
        prefix: prefix.present ? prefix.value : this.prefix,
        gender: gender.present ? gender.value : this.gender,
        dateOfBirth: dateOfBirth.present ? dateOfBirth.value : this.dateOfBirth,
        placeOfBirth:
            placeOfBirth.present ? placeOfBirth.value : this.placeOfBirth,
        dateOfDeath: dateOfDeath.present ? dateOfDeath.value : this.dateOfDeath,
        placeOfDeath:
            placeOfDeath.present ? placeOfDeath.value : this.placeOfDeath,
        isLiving: isLiving ?? this.isLiving,
        biography: biography.present ? biography.value : this.biography,
        occupation: occupation ?? this.occupation,
        education: education ?? this.education,
        religion: religion.present ? religion.value : this.religion,
        ethnicity: ethnicity ?? this.ethnicity,
        email: email.present ? email.value : this.email,
        phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
        address: address.present ? address.value : this.address,
        privacy: privacy ?? this.privacy,
        profilePictureId: profilePictureId.present
            ? profilePictureId.value
            : this.profilePictureId,
        customFields: customFields ?? this.customFields,
        createdBy: createdBy ?? this.createdBy,
        updatedBy: updatedBy ?? this.updatedBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncPending: syncPending ?? this.syncPending,
      );
  PersonData copyWithCompanion(PersonsTableCompanion data) {
    return PersonData(
      id: data.id.present ? data.id.value : this.id,
      treeId: data.treeId.present ? data.treeId.value : this.treeId,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      middleName:
          data.middleName.present ? data.middleName.value : this.middleName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      maidenName:
          data.maidenName.present ? data.maidenName.value : this.maidenName,
      nicknames: data.nicknames.present ? data.nicknames.value : this.nicknames,
      suffix: data.suffix.present ? data.suffix.value : this.suffix,
      prefix: data.prefix.present ? data.prefix.value : this.prefix,
      gender: data.gender.present ? data.gender.value : this.gender,
      dateOfBirth:
          data.dateOfBirth.present ? data.dateOfBirth.value : this.dateOfBirth,
      placeOfBirth: data.placeOfBirth.present
          ? data.placeOfBirth.value
          : this.placeOfBirth,
      dateOfDeath:
          data.dateOfDeath.present ? data.dateOfDeath.value : this.dateOfDeath,
      placeOfDeath: data.placeOfDeath.present
          ? data.placeOfDeath.value
          : this.placeOfDeath,
      isLiving: data.isLiving.present ? data.isLiving.value : this.isLiving,
      biography: data.biography.present ? data.biography.value : this.biography,
      occupation:
          data.occupation.present ? data.occupation.value : this.occupation,
      education: data.education.present ? data.education.value : this.education,
      religion: data.religion.present ? data.religion.value : this.religion,
      ethnicity: data.ethnicity.present ? data.ethnicity.value : this.ethnicity,
      email: data.email.present ? data.email.value : this.email,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      address: data.address.present ? data.address.value : this.address,
      privacy: data.privacy.present ? data.privacy.value : this.privacy,
      profilePictureId: data.profilePictureId.present
          ? data.profilePictureId.value
          : this.profilePictureId,
      customFields: data.customFields.present
          ? data.customFields.value
          : this.customFields,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      updatedBy: data.updatedBy.present ? data.updatedBy.value : this.updatedBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncPending:
          data.syncPending.present ? data.syncPending.value : this.syncPending,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonData(')
          ..write('id: $id, ')
          ..write('treeId: $treeId, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('lastName: $lastName, ')
          ..write('maidenName: $maidenName, ')
          ..write('nicknames: $nicknames, ')
          ..write('suffix: $suffix, ')
          ..write('prefix: $prefix, ')
          ..write('gender: $gender, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('placeOfBirth: $placeOfBirth, ')
          ..write('dateOfDeath: $dateOfDeath, ')
          ..write('placeOfDeath: $placeOfDeath, ')
          ..write('isLiving: $isLiving, ')
          ..write('biography: $biography, ')
          ..write('occupation: $occupation, ')
          ..write('education: $education, ')
          ..write('religion: $religion, ')
          ..write('ethnicity: $ethnicity, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('address: $address, ')
          ..write('privacy: $privacy, ')
          ..write('profilePictureId: $profilePictureId, ')
          ..write('customFields: $customFields, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncPending: $syncPending')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        treeId,
        firstName,
        middleName,
        lastName,
        maidenName,
        nicknames,
        suffix,
        prefix,
        gender,
        dateOfBirth,
        placeOfBirth,
        dateOfDeath,
        placeOfDeath,
        isLiving,
        biography,
        occupation,
        education,
        religion,
        ethnicity,
        email,
        phoneNumber,
        address,
        privacy,
        profilePictureId,
        customFields,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt,
        deletedAt,
        syncPending
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonData &&
          other.id == this.id &&
          other.treeId == this.treeId &&
          other.firstName == this.firstName &&
          other.middleName == this.middleName &&
          other.lastName == this.lastName &&
          other.maidenName == this.maidenName &&
          other.nicknames == this.nicknames &&
          other.suffix == this.suffix &&
          other.prefix == this.prefix &&
          other.gender == this.gender &&
          other.dateOfBirth == this.dateOfBirth &&
          other.placeOfBirth == this.placeOfBirth &&
          other.dateOfDeath == this.dateOfDeath &&
          other.placeOfDeath == this.placeOfDeath &&
          other.isLiving == this.isLiving &&
          other.biography == this.biography &&
          other.occupation == this.occupation &&
          other.education == this.education &&
          other.religion == this.religion &&
          other.ethnicity == this.ethnicity &&
          other.email == this.email &&
          other.phoneNumber == this.phoneNumber &&
          other.address == this.address &&
          other.privacy == this.privacy &&
          other.profilePictureId == this.profilePictureId &&
          other.customFields == this.customFields &&
          other.createdBy == this.createdBy &&
          other.updatedBy == this.updatedBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncPending == this.syncPending);
}

class PersonsTableCompanion extends UpdateCompanion<PersonData> {
  final Value<String> id;
  final Value<String> treeId;
  final Value<String> firstName;
  final Value<String?> middleName;
  final Value<String?> lastName;
  final Value<String?> maidenName;
  final Value<List<String>> nicknames;
  final Value<String?> suffix;
  final Value<String?> prefix;
  final Value<String?> gender;
  final Value<DateTime?> dateOfBirth;
  final Value<Map<String, dynamic>?> placeOfBirth;
  final Value<DateTime?> dateOfDeath;
  final Value<Map<String, dynamic>?> placeOfDeath;
  final Value<bool> isLiving;
  final Value<String?> biography;
  final Value<List<String>> occupation;
  final Value<List<String>> education;
  final Value<String?> religion;
  final Value<List<String>> ethnicity;
  final Value<String?> email;
  final Value<String?> phoneNumber;
  final Value<Map<String, dynamic>?> address;
  final Value<String> privacy;
  final Value<String?> profilePictureId;
  final Value<Map<String, dynamic>> customFields;
  final Value<String> createdBy;
  final Value<String> updatedBy;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<bool> syncPending;
  final Value<int> rowid;
  const PersonsTableCompanion({
    this.id = const Value.absent(),
    this.treeId = const Value.absent(),
    this.firstName = const Value.absent(),
    this.middleName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.maidenName = const Value.absent(),
    this.nicknames = const Value.absent(),
    this.suffix = const Value.absent(),
    this.prefix = const Value.absent(),
    this.gender = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.placeOfBirth = const Value.absent(),
    this.dateOfDeath = const Value.absent(),
    this.placeOfDeath = const Value.absent(),
    this.isLiving = const Value.absent(),
    this.biography = const Value.absent(),
    this.occupation = const Value.absent(),
    this.education = const Value.absent(),
    this.religion = const Value.absent(),
    this.ethnicity = const Value.absent(),
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.address = const Value.absent(),
    this.privacy = const Value.absent(),
    this.profilePictureId = const Value.absent(),
    this.customFields = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncPending = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PersonsTableCompanion.insert({
    required String id,
    required String treeId,
    required String firstName,
    this.middleName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.maidenName = const Value.absent(),
    this.nicknames = const Value.absent(),
    this.suffix = const Value.absent(),
    this.prefix = const Value.absent(),
    this.gender = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.placeOfBirth = const Value.absent(),
    this.dateOfDeath = const Value.absent(),
    this.placeOfDeath = const Value.absent(),
    this.isLiving = const Value.absent(),
    this.biography = const Value.absent(),
    this.occupation = const Value.absent(),
    this.education = const Value.absent(),
    this.religion = const Value.absent(),
    this.ethnicity = const Value.absent(),
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.address = const Value.absent(),
    this.privacy = const Value.absent(),
    this.profilePictureId = const Value.absent(),
    this.customFields = const Value.absent(),
    required String createdBy,
    required String updatedBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncPending = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        treeId = Value(treeId),
        firstName = Value(firstName),
        createdBy = Value(createdBy),
        updatedBy = Value(updatedBy),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<PersonData> custom({
    Expression<String>? id,
    Expression<String>? treeId,
    Expression<String>? firstName,
    Expression<String>? middleName,
    Expression<String>? lastName,
    Expression<String>? maidenName,
    Expression<String>? nicknames,
    Expression<String>? suffix,
    Expression<String>? prefix,
    Expression<String>? gender,
    Expression<DateTime>? dateOfBirth,
    Expression<String>? placeOfBirth,
    Expression<DateTime>? dateOfDeath,
    Expression<String>? placeOfDeath,
    Expression<bool>? isLiving,
    Expression<String>? biography,
    Expression<String>? occupation,
    Expression<String>? education,
    Expression<String>? religion,
    Expression<String>? ethnicity,
    Expression<String>? email,
    Expression<String>? phoneNumber,
    Expression<String>? address,
    Expression<String>? privacy,
    Expression<String>? profilePictureId,
    Expression<String>? customFields,
    Expression<String>? createdBy,
    Expression<String>? updatedBy,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<bool>? syncPending,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (treeId != null) 'tree_id': treeId,
      if (firstName != null) 'first_name': firstName,
      if (middleName != null) 'middle_name': middleName,
      if (lastName != null) 'last_name': lastName,
      if (maidenName != null) 'maiden_name': maidenName,
      if (nicknames != null) 'nicknames': nicknames,
      if (suffix != null) 'suffix': suffix,
      if (prefix != null) 'prefix': prefix,
      if (gender != null) 'gender': gender,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (placeOfBirth != null) 'place_of_birth': placeOfBirth,
      if (dateOfDeath != null) 'date_of_death': dateOfDeath,
      if (placeOfDeath != null) 'place_of_death': placeOfDeath,
      if (isLiving != null) 'is_living': isLiving,
      if (biography != null) 'biography': biography,
      if (occupation != null) 'occupation': occupation,
      if (education != null) 'education': education,
      if (religion != null) 'religion': religion,
      if (ethnicity != null) 'ethnicity': ethnicity,
      if (email != null) 'email': email,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (address != null) 'address': address,
      if (privacy != null) 'privacy': privacy,
      if (profilePictureId != null) 'profile_picture_id': profilePictureId,
      if (customFields != null) 'custom_fields': customFields,
      if (createdBy != null) 'created_by': createdBy,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncPending != null) 'sync_pending': syncPending,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PersonsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? treeId,
      Value<String>? firstName,
      Value<String?>? middleName,
      Value<String?>? lastName,
      Value<String?>? maidenName,
      Value<List<String>>? nicknames,
      Value<String?>? suffix,
      Value<String?>? prefix,
      Value<String?>? gender,
      Value<DateTime?>? dateOfBirth,
      Value<Map<String, dynamic>?>? placeOfBirth,
      Value<DateTime?>? dateOfDeath,
      Value<Map<String, dynamic>?>? placeOfDeath,
      Value<bool>? isLiving,
      Value<String?>? biography,
      Value<List<String>>? occupation,
      Value<List<String>>? education,
      Value<String?>? religion,
      Value<List<String>>? ethnicity,
      Value<String?>? email,
      Value<String?>? phoneNumber,
      Value<Map<String, dynamic>?>? address,
      Value<String>? privacy,
      Value<String?>? profilePictureId,
      Value<Map<String, dynamic>>? customFields,
      Value<String>? createdBy,
      Value<String>? updatedBy,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<bool>? syncPending,
      Value<int>? rowid}) {
    return PersonsTableCompanion(
      id: id ?? this.id,
      treeId: treeId ?? this.treeId,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      maidenName: maidenName ?? this.maidenName,
      nicknames: nicknames ?? this.nicknames,
      suffix: suffix ?? this.suffix,
      prefix: prefix ?? this.prefix,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      dateOfDeath: dateOfDeath ?? this.dateOfDeath,
      placeOfDeath: placeOfDeath ?? this.placeOfDeath,
      isLiving: isLiving ?? this.isLiving,
      biography: biography ?? this.biography,
      occupation: occupation ?? this.occupation,
      education: education ?? this.education,
      religion: religion ?? this.religion,
      ethnicity: ethnicity ?? this.ethnicity,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      privacy: privacy ?? this.privacy,
      profilePictureId: profilePictureId ?? this.profilePictureId,
      customFields: customFields ?? this.customFields,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncPending: syncPending ?? this.syncPending,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (treeId.present) {
      map['tree_id'] = Variable<String>(treeId.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (middleName.present) {
      map['middle_name'] = Variable<String>(middleName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (maidenName.present) {
      map['maiden_name'] = Variable<String>(maidenName.value);
    }
    if (nicknames.present) {
      map['nicknames'] = Variable<String>(
          $PersonsTableTable.$converternicknames.toSql(nicknames.value));
    }
    if (suffix.present) {
      map['suffix'] = Variable<String>(suffix.value);
    }
    if (prefix.present) {
      map['prefix'] = Variable<String>(prefix.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (placeOfBirth.present) {
      map['place_of_birth'] = Variable<String>(
          $PersonsTableTable.$converterplaceOfBirthn.toSql(placeOfBirth.value));
    }
    if (dateOfDeath.present) {
      map['date_of_death'] = Variable<DateTime>(dateOfDeath.value);
    }
    if (placeOfDeath.present) {
      map['place_of_death'] = Variable<String>(
          $PersonsTableTable.$converterplaceOfDeathn.toSql(placeOfDeath.value));
    }
    if (isLiving.present) {
      map['is_living'] = Variable<bool>(isLiving.value);
    }
    if (biography.present) {
      map['biography'] = Variable<String>(biography.value);
    }
    if (occupation.present) {
      map['occupation'] = Variable<String>(
          $PersonsTableTable.$converteroccupation.toSql(occupation.value));
    }
    if (education.present) {
      map['education'] = Variable<String>(
          $PersonsTableTable.$convertereducation.toSql(education.value));
    }
    if (religion.present) {
      map['religion'] = Variable<String>(religion.value);
    }
    if (ethnicity.present) {
      map['ethnicity'] = Variable<String>(
          $PersonsTableTable.$converterethnicity.toSql(ethnicity.value));
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(
          $PersonsTableTable.$converteraddressn.toSql(address.value));
    }
    if (privacy.present) {
      map['privacy'] = Variable<String>(privacy.value);
    }
    if (profilePictureId.present) {
      map['profile_picture_id'] = Variable<String>(profilePictureId.value);
    }
    if (customFields.present) {
      map['custom_fields'] = Variable<String>(
          $PersonsTableTable.$convertercustomFields.toSql(customFields.value));
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncPending.present) {
      map['sync_pending'] = Variable<bool>(syncPending.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonsTableCompanion(')
          ..write('id: $id, ')
          ..write('treeId: $treeId, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('lastName: $lastName, ')
          ..write('maidenName: $maidenName, ')
          ..write('nicknames: $nicknames, ')
          ..write('suffix: $suffix, ')
          ..write('prefix: $prefix, ')
          ..write('gender: $gender, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('placeOfBirth: $placeOfBirth, ')
          ..write('dateOfDeath: $dateOfDeath, ')
          ..write('placeOfDeath: $placeOfDeath, ')
          ..write('isLiving: $isLiving, ')
          ..write('biography: $biography, ')
          ..write('occupation: $occupation, ')
          ..write('education: $education, ')
          ..write('religion: $religion, ')
          ..write('ethnicity: $ethnicity, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('address: $address, ')
          ..write('privacy: $privacy, ')
          ..write('profilePictureId: $profilePictureId, ')
          ..write('customFields: $customFields, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncPending: $syncPending, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RelationshipsTableTable extends RelationshipsTable
    with TableInfo<$RelationshipsTableTable, RelationshipData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelationshipsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _treeIdMeta = const VerificationMeta('treeId');
  @override
  late final GeneratedColumn<String> treeId = GeneratedColumn<String>(
      'tree_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES trees_table (id)'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _person1IdMeta =
      const VerificationMeta('person1Id');
  @override
  late final GeneratedColumn<String> person1Id = GeneratedColumn<String>(
      'person1_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES persons_table (id)'));
  static const VerificationMeta _person2IdMeta =
      const VerificationMeta('person2Id');
  @override
  late final GeneratedColumn<String> person2Id = GeneratedColumn<String>(
      'person2_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES persons_table (id)'));
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      place = GeneratedColumn<String>('place', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Map<String, dynamic>?>(
              $RelationshipsTableTable.$converterplacen);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      customFields = GeneratedColumn<String>(
              'custom_fields', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('{}'))
          .withConverter<Map<String, dynamic>>(
              $RelationshipsTableTable.$convertercustomFields);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
      'created_by', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users_table (id)'));
  static const VerificationMeta _updatedByMeta =
      const VerificationMeta('updatedBy');
  @override
  late final GeneratedColumn<String> updatedBy = GeneratedColumn<String>(
      'updated_by', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users_table (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncPendingMeta =
      const VerificationMeta('syncPending');
  @override
  late final GeneratedColumn<bool> syncPending = GeneratedColumn<bool>(
      'sync_pending', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("sync_pending" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        treeId,
        type,
        person1Id,
        person2Id,
        startDate,
        endDate,
        place,
        status,
        notes,
        customFields,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt,
        deletedAt,
        syncPending
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relationships_table';
  @override
  VerificationContext validateIntegrity(Insertable<RelationshipData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('tree_id')) {
      context.handle(_treeIdMeta,
          treeId.isAcceptableOrUnknown(data['tree_id']!, _treeIdMeta));
    } else if (isInserting) {
      context.missing(_treeIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('person1_id')) {
      context.handle(_person1IdMeta,
          person1Id.isAcceptableOrUnknown(data['person1_id']!, _person1IdMeta));
    } else if (isInserting) {
      context.missing(_person1IdMeta);
    }
    if (data.containsKey('person2_id')) {
      context.handle(_person2IdMeta,
          person2Id.isAcceptableOrUnknown(data['person2_id']!, _person2IdMeta));
    } else if (isInserting) {
      context.missing(_person2IdMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    } else if (isInserting) {
      context.missing(_createdByMeta);
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by']!, _updatedByMeta));
    } else if (isInserting) {
      context.missing(_updatedByMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_pending')) {
      context.handle(
          _syncPendingMeta,
          syncPending.isAcceptableOrUnknown(
              data['sync_pending']!, _syncPendingMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RelationshipData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RelationshipData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      treeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tree_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      person1Id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}person1_id'])!,
      person2Id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}person2_id'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date']),
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      place: $RelationshipsTableTable.$converterplacen.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}place'])),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      customFields: $RelationshipsTableTable.$convertercustomFields.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}custom_fields'])!),
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by'])!,
      updatedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_by'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncPending: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sync_pending'])!,
    );
  }

  @override
  $RelationshipsTableTable createAlias(String alias) {
    return $RelationshipsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $converterplace =
      const CustomJsonTypeConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $converterplacen =
      NullAwareTypeConverter.wrap($converterplace);
  static TypeConverter<Map<String, dynamic>, String> $convertercustomFields =
      const CustomJsonTypeConverter();
}

class RelationshipData extends DataClass
    implements Insertable<RelationshipData> {
  final String id;
  final String treeId;
  final String type;
  final String person1Id;
  final String person2Id;
  final DateTime? startDate;
  final DateTime? endDate;
  final Map<String, dynamic>? place;
  final String? status;
  final String? notes;
  final Map<String, dynamic> customFields;
  final String createdBy;
  final String updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final bool syncPending;
  const RelationshipData(
      {required this.id,
      required this.treeId,
      required this.type,
      required this.person1Id,
      required this.person2Id,
      this.startDate,
      this.endDate,
      this.place,
      this.status,
      this.notes,
      required this.customFields,
      required this.createdBy,
      required this.updatedBy,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      required this.syncPending});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['tree_id'] = Variable<String>(treeId);
    map['type'] = Variable<String>(type);
    map['person1_id'] = Variable<String>(person1Id);
    map['person2_id'] = Variable<String>(person2Id);
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || place != null) {
      map['place'] = Variable<String>(
          $RelationshipsTableTable.$converterplacen.toSql(place));
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    {
      map['custom_fields'] = Variable<String>(
          $RelationshipsTableTable.$convertercustomFields.toSql(customFields));
    }
    map['created_by'] = Variable<String>(createdBy);
    map['updated_by'] = Variable<String>(updatedBy);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_pending'] = Variable<bool>(syncPending);
    return map;
  }

  RelationshipsTableCompanion toCompanion(bool nullToAbsent) {
    return RelationshipsTableCompanion(
      id: Value(id),
      treeId: Value(treeId),
      type: Value(type),
      person1Id: Value(person1Id),
      person2Id: Value(person2Id),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      place:
          place == null && nullToAbsent ? const Value.absent() : Value(place),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      customFields: Value(customFields),
      createdBy: Value(createdBy),
      updatedBy: Value(updatedBy),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncPending: Value(syncPending),
    );
  }

  factory RelationshipData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RelationshipData(
      id: serializer.fromJson<String>(json['id']),
      treeId: serializer.fromJson<String>(json['treeId']),
      type: serializer.fromJson<String>(json['type']),
      person1Id: serializer.fromJson<String>(json['person1Id']),
      person2Id: serializer.fromJson<String>(json['person2Id']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      place: serializer.fromJson<Map<String, dynamic>?>(json['place']),
      status: serializer.fromJson<String?>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
      customFields:
          serializer.fromJson<Map<String, dynamic>>(json['customFields']),
      createdBy: serializer.fromJson<String>(json['createdBy']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncPending: serializer.fromJson<bool>(json['syncPending']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'treeId': serializer.toJson<String>(treeId),
      'type': serializer.toJson<String>(type),
      'person1Id': serializer.toJson<String>(person1Id),
      'person2Id': serializer.toJson<String>(person2Id),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'place': serializer.toJson<Map<String, dynamic>?>(place),
      'status': serializer.toJson<String?>(status),
      'notes': serializer.toJson<String?>(notes),
      'customFields': serializer.toJson<Map<String, dynamic>>(customFields),
      'createdBy': serializer.toJson<String>(createdBy),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncPending': serializer.toJson<bool>(syncPending),
    };
  }

  RelationshipData copyWith(
          {String? id,
          String? treeId,
          String? type,
          String? person1Id,
          String? person2Id,
          Value<DateTime?> startDate = const Value.absent(),
          Value<DateTime?> endDate = const Value.absent(),
          Value<Map<String, dynamic>?> place = const Value.absent(),
          Value<String?> status = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          Map<String, dynamic>? customFields,
          String? createdBy,
          String? updatedBy,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent(),
          bool? syncPending}) =>
      RelationshipData(
        id: id ?? this.id,
        treeId: treeId ?? this.treeId,
        type: type ?? this.type,
        person1Id: person1Id ?? this.person1Id,
        person2Id: person2Id ?? this.person2Id,
        startDate: startDate.present ? startDate.value : this.startDate,
        endDate: endDate.present ? endDate.value : this.endDate,
        place: place.present ? place.value : this.place,
        status: status.present ? status.value : this.status,
        notes: notes.present ? notes.value : this.notes,
        customFields: customFields ?? this.customFields,
        createdBy: createdBy ?? this.createdBy,
        updatedBy: updatedBy ?? this.updatedBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncPending: syncPending ?? this.syncPending,
      );
  RelationshipData copyWithCompanion(RelationshipsTableCompanion data) {
    return RelationshipData(
      id: data.id.present ? data.id.value : this.id,
      treeId: data.treeId.present ? data.treeId.value : this.treeId,
      type: data.type.present ? data.type.value : this.type,
      person1Id: data.person1Id.present ? data.person1Id.value : this.person1Id,
      person2Id: data.person2Id.present ? data.person2Id.value : this.person2Id,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      place: data.place.present ? data.place.value : this.place,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      customFields: data.customFields.present
          ? data.customFields.value
          : this.customFields,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      updatedBy: data.updatedBy.present ? data.updatedBy.value : this.updatedBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncPending:
          data.syncPending.present ? data.syncPending.value : this.syncPending,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RelationshipData(')
          ..write('id: $id, ')
          ..write('treeId: $treeId, ')
          ..write('type: $type, ')
          ..write('person1Id: $person1Id, ')
          ..write('person2Id: $person2Id, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('place: $place, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('customFields: $customFields, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncPending: $syncPending')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      treeId,
      type,
      person1Id,
      person2Id,
      startDate,
      endDate,
      place,
      status,
      notes,
      customFields,
      createdBy,
      updatedBy,
      createdAt,
      updatedAt,
      deletedAt,
      syncPending);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RelationshipData &&
          other.id == this.id &&
          other.treeId == this.treeId &&
          other.type == this.type &&
          other.person1Id == this.person1Id &&
          other.person2Id == this.person2Id &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.place == this.place &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.customFields == this.customFields &&
          other.createdBy == this.createdBy &&
          other.updatedBy == this.updatedBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncPending == this.syncPending);
}

class RelationshipsTableCompanion extends UpdateCompanion<RelationshipData> {
  final Value<String> id;
  final Value<String> treeId;
  final Value<String> type;
  final Value<String> person1Id;
  final Value<String> person2Id;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<Map<String, dynamic>?> place;
  final Value<String?> status;
  final Value<String?> notes;
  final Value<Map<String, dynamic>> customFields;
  final Value<String> createdBy;
  final Value<String> updatedBy;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<bool> syncPending;
  final Value<int> rowid;
  const RelationshipsTableCompanion({
    this.id = const Value.absent(),
    this.treeId = const Value.absent(),
    this.type = const Value.absent(),
    this.person1Id = const Value.absent(),
    this.person2Id = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.place = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.customFields = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncPending = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RelationshipsTableCompanion.insert({
    required String id,
    required String treeId,
    required String type,
    required String person1Id,
    required String person2Id,
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.place = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.customFields = const Value.absent(),
    required String createdBy,
    required String updatedBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncPending = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        treeId = Value(treeId),
        type = Value(type),
        person1Id = Value(person1Id),
        person2Id = Value(person2Id),
        createdBy = Value(createdBy),
        updatedBy = Value(updatedBy),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<RelationshipData> custom({
    Expression<String>? id,
    Expression<String>? treeId,
    Expression<String>? type,
    Expression<String>? person1Id,
    Expression<String>? person2Id,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? place,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<String>? customFields,
    Expression<String>? createdBy,
    Expression<String>? updatedBy,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<bool>? syncPending,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (treeId != null) 'tree_id': treeId,
      if (type != null) 'type': type,
      if (person1Id != null) 'person1_id': person1Id,
      if (person2Id != null) 'person2_id': person2Id,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (place != null) 'place': place,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (customFields != null) 'custom_fields': customFields,
      if (createdBy != null) 'created_by': createdBy,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncPending != null) 'sync_pending': syncPending,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RelationshipsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? treeId,
      Value<String>? type,
      Value<String>? person1Id,
      Value<String>? person2Id,
      Value<DateTime?>? startDate,
      Value<DateTime?>? endDate,
      Value<Map<String, dynamic>?>? place,
      Value<String?>? status,
      Value<String?>? notes,
      Value<Map<String, dynamic>>? customFields,
      Value<String>? createdBy,
      Value<String>? updatedBy,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<bool>? syncPending,
      Value<int>? rowid}) {
    return RelationshipsTableCompanion(
      id: id ?? this.id,
      treeId: treeId ?? this.treeId,
      type: type ?? this.type,
      person1Id: person1Id ?? this.person1Id,
      person2Id: person2Id ?? this.person2Id,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      place: place ?? this.place,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      customFields: customFields ?? this.customFields,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncPending: syncPending ?? this.syncPending,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (treeId.present) {
      map['tree_id'] = Variable<String>(treeId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (person1Id.present) {
      map['person1_id'] = Variable<String>(person1Id.value);
    }
    if (person2Id.present) {
      map['person2_id'] = Variable<String>(person2Id.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (place.present) {
      map['place'] = Variable<String>(
          $RelationshipsTableTable.$converterplacen.toSql(place.value));
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (customFields.present) {
      map['custom_fields'] = Variable<String>($RelationshipsTableTable
          .$convertercustomFields
          .toSql(customFields.value));
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncPending.present) {
      map['sync_pending'] = Variable<bool>(syncPending.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelationshipsTableCompanion(')
          ..write('id: $id, ')
          ..write('treeId: $treeId, ')
          ..write('type: $type, ')
          ..write('person1Id: $person1Id, ')
          ..write('person2Id: $person2Id, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('place: $place, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('customFields: $customFields, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncPending: $syncPending, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventsTableTable extends EventsTable
    with TableInfo<$EventsTableTable, EventData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _treeIdMeta = const VerificationMeta('treeId');
  @override
  late final GeneratedColumn<String> treeId = GeneratedColumn<String>(
      'tree_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES trees_table (id)'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _dateAccuracyMeta =
      const VerificationMeta('dateAccuracy');
  @override
  late final GeneratedColumn<String> dateAccuracy = GeneratedColumn<String>(
      'date_accuracy', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('exact'));
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      place = GeneratedColumn<String>('place', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Map<String, dynamic>?>(
              $EventsTableTable.$converterplacen);
  static const VerificationMeta _primaryPersonIdMeta =
      const VerificationMeta('primaryPersonId');
  @override
  late final GeneratedColumn<String> primaryPersonId = GeneratedColumn<String>(
      'primary_person_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES persons_table (id)'));
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      otherPersonIds = GeneratedColumn<String>(
              'other_person_ids', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant(''))
          .withConverter<List<String>>(
              $EventsTableTable.$converterotherPersonIds);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> mediaIds =
      GeneratedColumn<String>('media_ids', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant(''))
          .withConverter<List<String>>($EventsTableTable.$convertermediaIds);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      sources = GeneratedColumn<String>('sources', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<Map<String, dynamic>>(
              $EventsTableTable.$convertersources);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
      'created_by', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users_table (id)'));
  static const VerificationMeta _updatedByMeta =
      const VerificationMeta('updatedBy');
  @override
  late final GeneratedColumn<String> updatedBy = GeneratedColumn<String>(
      'updated_by', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users_table (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncPendingMeta =
      const VerificationMeta('syncPending');
  @override
  late final GeneratedColumn<bool> syncPending = GeneratedColumn<bool>(
      'sync_pending', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("sync_pending" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        treeId,
        type,
        title,
        description,
        date,
        dateAccuracy,
        endDate,
        place,
        primaryPersonId,
        otherPersonIds,
        mediaIds,
        sources,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt,
        deletedAt,
        syncPending
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events_table';
  @override
  VerificationContext validateIntegrity(Insertable<EventData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('tree_id')) {
      context.handle(_treeIdMeta,
          treeId.isAcceptableOrUnknown(data['tree_id']!, _treeIdMeta));
    } else if (isInserting) {
      context.missing(_treeIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('date_accuracy')) {
      context.handle(
          _dateAccuracyMeta,
          dateAccuracy.isAcceptableOrUnknown(
              data['date_accuracy']!, _dateAccuracyMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('primary_person_id')) {
      context.handle(
          _primaryPersonIdMeta,
          primaryPersonId.isAcceptableOrUnknown(
              data['primary_person_id']!, _primaryPersonIdMeta));
    } else if (isInserting) {
      context.missing(_primaryPersonIdMeta);
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    } else if (isInserting) {
      context.missing(_createdByMeta);
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by']!, _updatedByMeta));
    } else if (isInserting) {
      context.missing(_updatedByMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_pending')) {
      context.handle(
          _syncPendingMeta,
          syncPending.isAcceptableOrUnknown(
              data['sync_pending']!, _syncPendingMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EventData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      treeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tree_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date']),
      dateAccuracy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date_accuracy'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      place: $EventsTableTable.$converterplacen.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}place'])),
      primaryPersonId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}primary_person_id'])!,
      otherPersonIds: $EventsTableTable.$converterotherPersonIds.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}other_person_ids'])!),
      mediaIds: $EventsTableTable.$convertermediaIds.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}media_ids'])!),
      sources: $EventsTableTable.$convertersources.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sources'])!),
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by'])!,
      updatedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_by'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncPending: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sync_pending'])!,
    );
  }

  @override
  $EventsTableTable createAlias(String alias) {
    return $EventsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $converterplace =
      const CustomJsonTypeConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $converterplacen =
      NullAwareTypeConverter.wrap($converterplace);
  static TypeConverter<List<String>, String> $converterotherPersonIds =
      const StringListConverter();
  static TypeConverter<List<String>, String> $convertermediaIds =
      const StringListConverter();
  static TypeConverter<Map<String, dynamic>, String> $convertersources =
      const CustomJsonTypeConverter();
}

class EventData extends DataClass implements Insertable<EventData> {
  final String id;
  final String treeId;
  final String type;
  final String title;
  final String? description;
  final DateTime? date;
  final String dateAccuracy;
  final DateTime? endDate;
  final Map<String, dynamic>? place;
  final String primaryPersonId;
  final List<String> otherPersonIds;
  final List<String> mediaIds;
  final Map<String, dynamic> sources;
  final String createdBy;
  final String updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final bool syncPending;
  const EventData(
      {required this.id,
      required this.treeId,
      required this.type,
      required this.title,
      this.description,
      this.date,
      required this.dateAccuracy,
      this.endDate,
      this.place,
      required this.primaryPersonId,
      required this.otherPersonIds,
      required this.mediaIds,
      required this.sources,
      required this.createdBy,
      required this.updatedBy,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      required this.syncPending});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['tree_id'] = Variable<String>(treeId);
    map['type'] = Variable<String>(type);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    map['date_accuracy'] = Variable<String>(dateAccuracy);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || place != null) {
      map['place'] =
          Variable<String>($EventsTableTable.$converterplacen.toSql(place));
    }
    map['primary_person_id'] = Variable<String>(primaryPersonId);
    {
      map['other_person_ids'] = Variable<String>(
          $EventsTableTable.$converterotherPersonIds.toSql(otherPersonIds));
    }
    {
      map['media_ids'] = Variable<String>(
          $EventsTableTable.$convertermediaIds.toSql(mediaIds));
    }
    {
      map['sources'] =
          Variable<String>($EventsTableTable.$convertersources.toSql(sources));
    }
    map['created_by'] = Variable<String>(createdBy);
    map['updated_by'] = Variable<String>(updatedBy);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_pending'] = Variable<bool>(syncPending);
    return map;
  }

  EventsTableCompanion toCompanion(bool nullToAbsent) {
    return EventsTableCompanion(
      id: Value(id),
      treeId: Value(treeId),
      type: Value(type),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      dateAccuracy: Value(dateAccuracy),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      place:
          place == null && nullToAbsent ? const Value.absent() : Value(place),
      primaryPersonId: Value(primaryPersonId),
      otherPersonIds: Value(otherPersonIds),
      mediaIds: Value(mediaIds),
      sources: Value(sources),
      createdBy: Value(createdBy),
      updatedBy: Value(updatedBy),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncPending: Value(syncPending),
    );
  }

  factory EventData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventData(
      id: serializer.fromJson<String>(json['id']),
      treeId: serializer.fromJson<String>(json['treeId']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      date: serializer.fromJson<DateTime?>(json['date']),
      dateAccuracy: serializer.fromJson<String>(json['dateAccuracy']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      place: serializer.fromJson<Map<String, dynamic>?>(json['place']),
      primaryPersonId: serializer.fromJson<String>(json['primaryPersonId']),
      otherPersonIds: serializer.fromJson<List<String>>(json['otherPersonIds']),
      mediaIds: serializer.fromJson<List<String>>(json['mediaIds']),
      sources: serializer.fromJson<Map<String, dynamic>>(json['sources']),
      createdBy: serializer.fromJson<String>(json['createdBy']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncPending: serializer.fromJson<bool>(json['syncPending']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'treeId': serializer.toJson<String>(treeId),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'date': serializer.toJson<DateTime?>(date),
      'dateAccuracy': serializer.toJson<String>(dateAccuracy),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'place': serializer.toJson<Map<String, dynamic>?>(place),
      'primaryPersonId': serializer.toJson<String>(primaryPersonId),
      'otherPersonIds': serializer.toJson<List<String>>(otherPersonIds),
      'mediaIds': serializer.toJson<List<String>>(mediaIds),
      'sources': serializer.toJson<Map<String, dynamic>>(sources),
      'createdBy': serializer.toJson<String>(createdBy),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncPending': serializer.toJson<bool>(syncPending),
    };
  }

  EventData copyWith(
          {String? id,
          String? treeId,
          String? type,
          String? title,
          Value<String?> description = const Value.absent(),
          Value<DateTime?> date = const Value.absent(),
          String? dateAccuracy,
          Value<DateTime?> endDate = const Value.absent(),
          Value<Map<String, dynamic>?> place = const Value.absent(),
          String? primaryPersonId,
          List<String>? otherPersonIds,
          List<String>? mediaIds,
          Map<String, dynamic>? sources,
          String? createdBy,
          String? updatedBy,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent(),
          bool? syncPending}) =>
      EventData(
        id: id ?? this.id,
        treeId: treeId ?? this.treeId,
        type: type ?? this.type,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        date: date.present ? date.value : this.date,
        dateAccuracy: dateAccuracy ?? this.dateAccuracy,
        endDate: endDate.present ? endDate.value : this.endDate,
        place: place.present ? place.value : this.place,
        primaryPersonId: primaryPersonId ?? this.primaryPersonId,
        otherPersonIds: otherPersonIds ?? this.otherPersonIds,
        mediaIds: mediaIds ?? this.mediaIds,
        sources: sources ?? this.sources,
        createdBy: createdBy ?? this.createdBy,
        updatedBy: updatedBy ?? this.updatedBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncPending: syncPending ?? this.syncPending,
      );
  EventData copyWithCompanion(EventsTableCompanion data) {
    return EventData(
      id: data.id.present ? data.id.value : this.id,
      treeId: data.treeId.present ? data.treeId.value : this.treeId,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      date: data.date.present ? data.date.value : this.date,
      dateAccuracy: data.dateAccuracy.present
          ? data.dateAccuracy.value
          : this.dateAccuracy,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      place: data.place.present ? data.place.value : this.place,
      primaryPersonId: data.primaryPersonId.present
          ? data.primaryPersonId.value
          : this.primaryPersonId,
      otherPersonIds: data.otherPersonIds.present
          ? data.otherPersonIds.value
          : this.otherPersonIds,
      mediaIds: data.mediaIds.present ? data.mediaIds.value : this.mediaIds,
      sources: data.sources.present ? data.sources.value : this.sources,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      updatedBy: data.updatedBy.present ? data.updatedBy.value : this.updatedBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncPending:
          data.syncPending.present ? data.syncPending.value : this.syncPending,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventData(')
          ..write('id: $id, ')
          ..write('treeId: $treeId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('dateAccuracy: $dateAccuracy, ')
          ..write('endDate: $endDate, ')
          ..write('place: $place, ')
          ..write('primaryPersonId: $primaryPersonId, ')
          ..write('otherPersonIds: $otherPersonIds, ')
          ..write('mediaIds: $mediaIds, ')
          ..write('sources: $sources, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncPending: $syncPending')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      treeId,
      type,
      title,
      description,
      date,
      dateAccuracy,
      endDate,
      place,
      primaryPersonId,
      otherPersonIds,
      mediaIds,
      sources,
      createdBy,
      updatedBy,
      createdAt,
      updatedAt,
      deletedAt,
      syncPending);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventData &&
          other.id == this.id &&
          other.treeId == this.treeId &&
          other.type == this.type &&
          other.title == this.title &&
          other.description == this.description &&
          other.date == this.date &&
          other.dateAccuracy == this.dateAccuracy &&
          other.endDate == this.endDate &&
          other.place == this.place &&
          other.primaryPersonId == this.primaryPersonId &&
          other.otherPersonIds == this.otherPersonIds &&
          other.mediaIds == this.mediaIds &&
          other.sources == this.sources &&
          other.createdBy == this.createdBy &&
          other.updatedBy == this.updatedBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncPending == this.syncPending);
}

class EventsTableCompanion extends UpdateCompanion<EventData> {
  final Value<String> id;
  final Value<String> treeId;
  final Value<String> type;
  final Value<String> title;
  final Value<String?> description;
  final Value<DateTime?> date;
  final Value<String> dateAccuracy;
  final Value<DateTime?> endDate;
  final Value<Map<String, dynamic>?> place;
  final Value<String> primaryPersonId;
  final Value<List<String>> otherPersonIds;
  final Value<List<String>> mediaIds;
  final Value<Map<String, dynamic>> sources;
  final Value<String> createdBy;
  final Value<String> updatedBy;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<bool> syncPending;
  final Value<int> rowid;
  const EventsTableCompanion({
    this.id = const Value.absent(),
    this.treeId = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.date = const Value.absent(),
    this.dateAccuracy = const Value.absent(),
    this.endDate = const Value.absent(),
    this.place = const Value.absent(),
    this.primaryPersonId = const Value.absent(),
    this.otherPersonIds = const Value.absent(),
    this.mediaIds = const Value.absent(),
    this.sources = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncPending = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventsTableCompanion.insert({
    required String id,
    required String treeId,
    required String type,
    required String title,
    this.description = const Value.absent(),
    this.date = const Value.absent(),
    this.dateAccuracy = const Value.absent(),
    this.endDate = const Value.absent(),
    this.place = const Value.absent(),
    required String primaryPersonId,
    this.otherPersonIds = const Value.absent(),
    this.mediaIds = const Value.absent(),
    this.sources = const Value.absent(),
    required String createdBy,
    required String updatedBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncPending = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        treeId = Value(treeId),
        type = Value(type),
        title = Value(title),
        primaryPersonId = Value(primaryPersonId),
        createdBy = Value(createdBy),
        updatedBy = Value(updatedBy),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<EventData> custom({
    Expression<String>? id,
    Expression<String>? treeId,
    Expression<String>? type,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? date,
    Expression<String>? dateAccuracy,
    Expression<DateTime>? endDate,
    Expression<String>? place,
    Expression<String>? primaryPersonId,
    Expression<String>? otherPersonIds,
    Expression<String>? mediaIds,
    Expression<String>? sources,
    Expression<String>? createdBy,
    Expression<String>? updatedBy,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<bool>? syncPending,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (treeId != null) 'tree_id': treeId,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (date != null) 'date': date,
      if (dateAccuracy != null) 'date_accuracy': dateAccuracy,
      if (endDate != null) 'end_date': endDate,
      if (place != null) 'place': place,
      if (primaryPersonId != null) 'primary_person_id': primaryPersonId,
      if (otherPersonIds != null) 'other_person_ids': otherPersonIds,
      if (mediaIds != null) 'media_ids': mediaIds,
      if (sources != null) 'sources': sources,
      if (createdBy != null) 'created_by': createdBy,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncPending != null) 'sync_pending': syncPending,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? treeId,
      Value<String>? type,
      Value<String>? title,
      Value<String?>? description,
      Value<DateTime?>? date,
      Value<String>? dateAccuracy,
      Value<DateTime?>? endDate,
      Value<Map<String, dynamic>?>? place,
      Value<String>? primaryPersonId,
      Value<List<String>>? otherPersonIds,
      Value<List<String>>? mediaIds,
      Value<Map<String, dynamic>>? sources,
      Value<String>? createdBy,
      Value<String>? updatedBy,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<bool>? syncPending,
      Value<int>? rowid}) {
    return EventsTableCompanion(
      id: id ?? this.id,
      treeId: treeId ?? this.treeId,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      dateAccuracy: dateAccuracy ?? this.dateAccuracy,
      endDate: endDate ?? this.endDate,
      place: place ?? this.place,
      primaryPersonId: primaryPersonId ?? this.primaryPersonId,
      otherPersonIds: otherPersonIds ?? this.otherPersonIds,
      mediaIds: mediaIds ?? this.mediaIds,
      sources: sources ?? this.sources,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncPending: syncPending ?? this.syncPending,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (treeId.present) {
      map['tree_id'] = Variable<String>(treeId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (dateAccuracy.present) {
      map['date_accuracy'] = Variable<String>(dateAccuracy.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (place.present) {
      map['place'] = Variable<String>(
          $EventsTableTable.$converterplacen.toSql(place.value));
    }
    if (primaryPersonId.present) {
      map['primary_person_id'] = Variable<String>(primaryPersonId.value);
    }
    if (otherPersonIds.present) {
      map['other_person_ids'] = Variable<String>($EventsTableTable
          .$converterotherPersonIds
          .toSql(otherPersonIds.value));
    }
    if (mediaIds.present) {
      map['media_ids'] = Variable<String>(
          $EventsTableTable.$convertermediaIds.toSql(mediaIds.value));
    }
    if (sources.present) {
      map['sources'] = Variable<String>(
          $EventsTableTable.$convertersources.toSql(sources.value));
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncPending.present) {
      map['sync_pending'] = Variable<bool>(syncPending.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsTableCompanion(')
          ..write('id: $id, ')
          ..write('treeId: $treeId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('dateAccuracy: $dateAccuracy, ')
          ..write('endDate: $endDate, ')
          ..write('place: $place, ')
          ..write('primaryPersonId: $primaryPersonId, ')
          ..write('otherPersonIds: $otherPersonIds, ')
          ..write('mediaIds: $mediaIds, ')
          ..write('sources: $sources, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncPending: $syncPending, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StoriesTableTable extends StoriesTable
    with TableInfo<$StoriesTableTable, StoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _treeIdMeta = const VerificationMeta('treeId');
  @override
  late final GeneratedColumn<String> treeId = GeneratedColumn<String>(
      'tree_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES trees_table (id)'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorIdMeta =
      const VerificationMeta('authorId');
  @override
  late final GeneratedColumn<String> authorId = GeneratedColumn<String>(
      'author_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users_table (id)'));
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      relatedPersonIds = GeneratedColumn<String>(
              'related_person_ids', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant(''))
          .withConverter<List<String>>(
              $StoriesTableTable.$converterrelatedPersonIds);
  static const VerificationMeta _coverImageIdMeta =
      const VerificationMeta('coverImageId');
  @override
  late final GeneratedColumn<String> coverImageId = GeneratedColumn<String>(
      'cover_image_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> mediaIds =
      GeneratedColumn<String>('media_ids', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant(''))
          .withConverter<List<String>>($StoriesTableTable.$convertermediaIds);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('draft'));
  static const VerificationMeta _publishedAtMeta =
      const VerificationMeta('publishedAt');
  @override
  late final GeneratedColumn<DateTime> publishedAt = GeneratedColumn<DateTime>(
      'published_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _privacyMeta =
      const VerificationMeta('privacy');
  @override
  late final GeneratedColumn<String> privacy = GeneratedColumn<String>(
      'privacy', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('family'));
  static const VerificationMeta _viewCountMeta =
      const VerificationMeta('viewCount');
  @override
  late final GeneratedColumn<int> viewCount = GeneratedColumn<int>(
      'view_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _likeCountMeta =
      const VerificationMeta('likeCount');
  @override
  late final GeneratedColumn<int> likeCount = GeneratedColumn<int>(
      'like_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      metadata = GeneratedColumn<String>('metadata', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Map<String, dynamic>?>(
              $StoriesTableTable.$convertermetadatan);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncPendingMeta =
      const VerificationMeta('syncPending');
  @override
  late final GeneratedColumn<bool> syncPending = GeneratedColumn<bool>(
      'sync_pending', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("sync_pending" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        treeId,
        title,
        content,
        authorId,
        relatedPersonIds,
        coverImageId,
        mediaIds,
        status,
        publishedAt,
        privacy,
        viewCount,
        likeCount,
        metadata,
        createdAt,
        updatedAt,
        deletedAt,
        syncPending
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stories_table';
  @override
  VerificationContext validateIntegrity(Insertable<StoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('tree_id')) {
      context.handle(_treeIdMeta,
          treeId.isAcceptableOrUnknown(data['tree_id']!, _treeIdMeta));
    } else if (isInserting) {
      context.missing(_treeIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('author_id')) {
      context.handle(_authorIdMeta,
          authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta));
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    if (data.containsKey('cover_image_id')) {
      context.handle(
          _coverImageIdMeta,
          coverImageId.isAcceptableOrUnknown(
              data['cover_image_id']!, _coverImageIdMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('published_at')) {
      context.handle(
          _publishedAtMeta,
          publishedAt.isAcceptableOrUnknown(
              data['published_at']!, _publishedAtMeta));
    }
    if (data.containsKey('privacy')) {
      context.handle(_privacyMeta,
          privacy.isAcceptableOrUnknown(data['privacy']!, _privacyMeta));
    }
    if (data.containsKey('view_count')) {
      context.handle(_viewCountMeta,
          viewCount.isAcceptableOrUnknown(data['view_count']!, _viewCountMeta));
    }
    if (data.containsKey('like_count')) {
      context.handle(_likeCountMeta,
          likeCount.isAcceptableOrUnknown(data['like_count']!, _likeCountMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_pending')) {
      context.handle(
          _syncPendingMeta,
          syncPending.isAcceptableOrUnknown(
              data['sync_pending']!, _syncPendingMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      treeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tree_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      authorId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author_id'])!,
      relatedPersonIds: $StoriesTableTable.$converterrelatedPersonIds.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}related_person_ids'])!),
      coverImageId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cover_image_id']),
      mediaIds: $StoriesTableTable.$convertermediaIds.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}media_ids'])!),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      publishedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}published_at']),
      privacy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}privacy'])!,
      viewCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}view_count'])!,
      likeCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}like_count'])!,
      metadata: $StoriesTableTable.$convertermetadatan.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}metadata'])),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncPending: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sync_pending'])!,
    );
  }

  @override
  $StoriesTableTable createAlias(String alias) {
    return $StoriesTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterrelatedPersonIds =
      const StringListConverter();
  static TypeConverter<List<String>, String> $convertermediaIds =
      const StringListConverter();
  static TypeConverter<Map<String, dynamic>, String> $convertermetadata =
      const CustomJsonTypeConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $convertermetadatan =
      NullAwareTypeConverter.wrap($convertermetadata);
}

class StoryData extends DataClass implements Insertable<StoryData> {
  final String id;
  final String treeId;
  final String title;
  final String content;
  final String authorId;
  final List<String> relatedPersonIds;
  final String? coverImageId;
  final List<String> mediaIds;
  final String status;
  final DateTime? publishedAt;
  final String privacy;
  final int viewCount;
  final int likeCount;
  final Map<String, dynamic>? metadata;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final bool syncPending;
  const StoryData(
      {required this.id,
      required this.treeId,
      required this.title,
      required this.content,
      required this.authorId,
      required this.relatedPersonIds,
      this.coverImageId,
      required this.mediaIds,
      required this.status,
      this.publishedAt,
      required this.privacy,
      required this.viewCount,
      required this.likeCount,
      this.metadata,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      required this.syncPending});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['tree_id'] = Variable<String>(treeId);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['author_id'] = Variable<String>(authorId);
    {
      map['related_person_ids'] = Variable<String>($StoriesTableTable
          .$converterrelatedPersonIds
          .toSql(relatedPersonIds));
    }
    if (!nullToAbsent || coverImageId != null) {
      map['cover_image_id'] = Variable<String>(coverImageId);
    }
    {
      map['media_ids'] = Variable<String>(
          $StoriesTableTable.$convertermediaIds.toSql(mediaIds));
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || publishedAt != null) {
      map['published_at'] = Variable<DateTime>(publishedAt);
    }
    map['privacy'] = Variable<String>(privacy);
    map['view_count'] = Variable<int>(viewCount);
    map['like_count'] = Variable<int>(likeCount);
    if (!nullToAbsent || metadata != null) {
      map['metadata'] = Variable<String>(
          $StoriesTableTable.$convertermetadatan.toSql(metadata));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_pending'] = Variable<bool>(syncPending);
    return map;
  }

  StoriesTableCompanion toCompanion(bool nullToAbsent) {
    return StoriesTableCompanion(
      id: Value(id),
      treeId: Value(treeId),
      title: Value(title),
      content: Value(content),
      authorId: Value(authorId),
      relatedPersonIds: Value(relatedPersonIds),
      coverImageId: coverImageId == null && nullToAbsent
          ? const Value.absent()
          : Value(coverImageId),
      mediaIds: Value(mediaIds),
      status: Value(status),
      publishedAt: publishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedAt),
      privacy: Value(privacy),
      viewCount: Value(viewCount),
      likeCount: Value(likeCount),
      metadata: metadata == null && nullToAbsent
          ? const Value.absent()
          : Value(metadata),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncPending: Value(syncPending),
    );
  }

  factory StoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoryData(
      id: serializer.fromJson<String>(json['id']),
      treeId: serializer.fromJson<String>(json['treeId']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      authorId: serializer.fromJson<String>(json['authorId']),
      relatedPersonIds:
          serializer.fromJson<List<String>>(json['relatedPersonIds']),
      coverImageId: serializer.fromJson<String?>(json['coverImageId']),
      mediaIds: serializer.fromJson<List<String>>(json['mediaIds']),
      status: serializer.fromJson<String>(json['status']),
      publishedAt: serializer.fromJson<DateTime?>(json['publishedAt']),
      privacy: serializer.fromJson<String>(json['privacy']),
      viewCount: serializer.fromJson<int>(json['viewCount']),
      likeCount: serializer.fromJson<int>(json['likeCount']),
      metadata: serializer.fromJson<Map<String, dynamic>?>(json['metadata']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncPending: serializer.fromJson<bool>(json['syncPending']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'treeId': serializer.toJson<String>(treeId),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'authorId': serializer.toJson<String>(authorId),
      'relatedPersonIds': serializer.toJson<List<String>>(relatedPersonIds),
      'coverImageId': serializer.toJson<String?>(coverImageId),
      'mediaIds': serializer.toJson<List<String>>(mediaIds),
      'status': serializer.toJson<String>(status),
      'publishedAt': serializer.toJson<DateTime?>(publishedAt),
      'privacy': serializer.toJson<String>(privacy),
      'viewCount': serializer.toJson<int>(viewCount),
      'likeCount': serializer.toJson<int>(likeCount),
      'metadata': serializer.toJson<Map<String, dynamic>?>(metadata),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncPending': serializer.toJson<bool>(syncPending),
    };
  }

  StoryData copyWith(
          {String? id,
          String? treeId,
          String? title,
          String? content,
          String? authorId,
          List<String>? relatedPersonIds,
          Value<String?> coverImageId = const Value.absent(),
          List<String>? mediaIds,
          String? status,
          Value<DateTime?> publishedAt = const Value.absent(),
          String? privacy,
          int? viewCount,
          int? likeCount,
          Value<Map<String, dynamic>?> metadata = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent(),
          bool? syncPending}) =>
      StoryData(
        id: id ?? this.id,
        treeId: treeId ?? this.treeId,
        title: title ?? this.title,
        content: content ?? this.content,
        authorId: authorId ?? this.authorId,
        relatedPersonIds: relatedPersonIds ?? this.relatedPersonIds,
        coverImageId:
            coverImageId.present ? coverImageId.value : this.coverImageId,
        mediaIds: mediaIds ?? this.mediaIds,
        status: status ?? this.status,
        publishedAt: publishedAt.present ? publishedAt.value : this.publishedAt,
        privacy: privacy ?? this.privacy,
        viewCount: viewCount ?? this.viewCount,
        likeCount: likeCount ?? this.likeCount,
        metadata: metadata.present ? metadata.value : this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncPending: syncPending ?? this.syncPending,
      );
  StoryData copyWithCompanion(StoriesTableCompanion data) {
    return StoryData(
      id: data.id.present ? data.id.value : this.id,
      treeId: data.treeId.present ? data.treeId.value : this.treeId,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      authorId: data.authorId.present ? data.authorId.value : this.authorId,
      relatedPersonIds: data.relatedPersonIds.present
          ? data.relatedPersonIds.value
          : this.relatedPersonIds,
      coverImageId: data.coverImageId.present
          ? data.coverImageId.value
          : this.coverImageId,
      mediaIds: data.mediaIds.present ? data.mediaIds.value : this.mediaIds,
      status: data.status.present ? data.status.value : this.status,
      publishedAt:
          data.publishedAt.present ? data.publishedAt.value : this.publishedAt,
      privacy: data.privacy.present ? data.privacy.value : this.privacy,
      viewCount: data.viewCount.present ? data.viewCount.value : this.viewCount,
      likeCount: data.likeCount.present ? data.likeCount.value : this.likeCount,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncPending:
          data.syncPending.present ? data.syncPending.value : this.syncPending,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StoryData(')
          ..write('id: $id, ')
          ..write('treeId: $treeId, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('authorId: $authorId, ')
          ..write('relatedPersonIds: $relatedPersonIds, ')
          ..write('coverImageId: $coverImageId, ')
          ..write('mediaIds: $mediaIds, ')
          ..write('status: $status, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('privacy: $privacy, ')
          ..write('viewCount: $viewCount, ')
          ..write('likeCount: $likeCount, ')
          ..write('metadata: $metadata, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncPending: $syncPending')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      treeId,
      title,
      content,
      authorId,
      relatedPersonIds,
      coverImageId,
      mediaIds,
      status,
      publishedAt,
      privacy,
      viewCount,
      likeCount,
      metadata,
      createdAt,
      updatedAt,
      deletedAt,
      syncPending);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoryData &&
          other.id == this.id &&
          other.treeId == this.treeId &&
          other.title == this.title &&
          other.content == this.content &&
          other.authorId == this.authorId &&
          other.relatedPersonIds == this.relatedPersonIds &&
          other.coverImageId == this.coverImageId &&
          other.mediaIds == this.mediaIds &&
          other.status == this.status &&
          other.publishedAt == this.publishedAt &&
          other.privacy == this.privacy &&
          other.viewCount == this.viewCount &&
          other.likeCount == this.likeCount &&
          other.metadata == this.metadata &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncPending == this.syncPending);
}

class StoriesTableCompanion extends UpdateCompanion<StoryData> {
  final Value<String> id;
  final Value<String> treeId;
  final Value<String> title;
  final Value<String> content;
  final Value<String> authorId;
  final Value<List<String>> relatedPersonIds;
  final Value<String?> coverImageId;
  final Value<List<String>> mediaIds;
  final Value<String> status;
  final Value<DateTime?> publishedAt;
  final Value<String> privacy;
  final Value<int> viewCount;
  final Value<int> likeCount;
  final Value<Map<String, dynamic>?> metadata;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<bool> syncPending;
  final Value<int> rowid;
  const StoriesTableCompanion({
    this.id = const Value.absent(),
    this.treeId = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.authorId = const Value.absent(),
    this.relatedPersonIds = const Value.absent(),
    this.coverImageId = const Value.absent(),
    this.mediaIds = const Value.absent(),
    this.status = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.privacy = const Value.absent(),
    this.viewCount = const Value.absent(),
    this.likeCount = const Value.absent(),
    this.metadata = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncPending = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StoriesTableCompanion.insert({
    required String id,
    required String treeId,
    required String title,
    required String content,
    required String authorId,
    this.relatedPersonIds = const Value.absent(),
    this.coverImageId = const Value.absent(),
    this.mediaIds = const Value.absent(),
    this.status = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.privacy = const Value.absent(),
    this.viewCount = const Value.absent(),
    this.likeCount = const Value.absent(),
    this.metadata = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncPending = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        treeId = Value(treeId),
        title = Value(title),
        content = Value(content),
        authorId = Value(authorId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<StoryData> custom({
    Expression<String>? id,
    Expression<String>? treeId,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? authorId,
    Expression<String>? relatedPersonIds,
    Expression<String>? coverImageId,
    Expression<String>? mediaIds,
    Expression<String>? status,
    Expression<DateTime>? publishedAt,
    Expression<String>? privacy,
    Expression<int>? viewCount,
    Expression<int>? likeCount,
    Expression<String>? metadata,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<bool>? syncPending,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (treeId != null) 'tree_id': treeId,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (authorId != null) 'author_id': authorId,
      if (relatedPersonIds != null) 'related_person_ids': relatedPersonIds,
      if (coverImageId != null) 'cover_image_id': coverImageId,
      if (mediaIds != null) 'media_ids': mediaIds,
      if (status != null) 'status': status,
      if (publishedAt != null) 'published_at': publishedAt,
      if (privacy != null) 'privacy': privacy,
      if (viewCount != null) 'view_count': viewCount,
      if (likeCount != null) 'like_count': likeCount,
      if (metadata != null) 'metadata': metadata,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncPending != null) 'sync_pending': syncPending,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StoriesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? treeId,
      Value<String>? title,
      Value<String>? content,
      Value<String>? authorId,
      Value<List<String>>? relatedPersonIds,
      Value<String?>? coverImageId,
      Value<List<String>>? mediaIds,
      Value<String>? status,
      Value<DateTime?>? publishedAt,
      Value<String>? privacy,
      Value<int>? viewCount,
      Value<int>? likeCount,
      Value<Map<String, dynamic>?>? metadata,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<bool>? syncPending,
      Value<int>? rowid}) {
    return StoriesTableCompanion(
      id: id ?? this.id,
      treeId: treeId ?? this.treeId,
      title: title ?? this.title,
      content: content ?? this.content,
      authorId: authorId ?? this.authorId,
      relatedPersonIds: relatedPersonIds ?? this.relatedPersonIds,
      coverImageId: coverImageId ?? this.coverImageId,
      mediaIds: mediaIds ?? this.mediaIds,
      status: status ?? this.status,
      publishedAt: publishedAt ?? this.publishedAt,
      privacy: privacy ?? this.privacy,
      viewCount: viewCount ?? this.viewCount,
      likeCount: likeCount ?? this.likeCount,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncPending: syncPending ?? this.syncPending,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (treeId.present) {
      map['tree_id'] = Variable<String>(treeId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<String>(authorId.value);
    }
    if (relatedPersonIds.present) {
      map['related_person_ids'] = Variable<String>($StoriesTableTable
          .$converterrelatedPersonIds
          .toSql(relatedPersonIds.value));
    }
    if (coverImageId.present) {
      map['cover_image_id'] = Variable<String>(coverImageId.value);
    }
    if (mediaIds.present) {
      map['media_ids'] = Variable<String>(
          $StoriesTableTable.$convertermediaIds.toSql(mediaIds.value));
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<DateTime>(publishedAt.value);
    }
    if (privacy.present) {
      map['privacy'] = Variable<String>(privacy.value);
    }
    if (viewCount.present) {
      map['view_count'] = Variable<int>(viewCount.value);
    }
    if (likeCount.present) {
      map['like_count'] = Variable<int>(likeCount.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(
          $StoriesTableTable.$convertermetadatan.toSql(metadata.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncPending.present) {
      map['sync_pending'] = Variable<bool>(syncPending.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoriesTableCompanion(')
          ..write('id: $id, ')
          ..write('treeId: $treeId, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('authorId: $authorId, ')
          ..write('relatedPersonIds: $relatedPersonIds, ')
          ..write('coverImageId: $coverImageId, ')
          ..write('mediaIds: $mediaIds, ')
          ..write('status: $status, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('privacy: $privacy, ')
          ..write('viewCount: $viewCount, ')
          ..write('likeCount: $likeCount, ')
          ..write('metadata: $metadata, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncPending: $syncPending, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MediaTableTable extends MediaTable
    with TableInfo<$MediaTableTable, MediaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _treeIdMeta = const VerificationMeta('treeId');
  @override
  late final GeneratedColumn<String> treeId = GeneratedColumn<String>(
      'tree_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES trees_table (id)'));
  static const VerificationMeta _personIdMeta =
      const VerificationMeta('personId');
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
      'person_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES persons_table (id)'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fileNameMeta =
      const VerificationMeta('fileName');
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
      'file_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fileSizeMeta =
      const VerificationMeta('fileSize');
  @override
  late final GeneratedColumn<int> fileSize = GeneratedColumn<int>(
      'file_size', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _mimeTypeMeta =
      const VerificationMeta('mimeType');
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
      'mime_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _storageKeyMeta =
      const VerificationMeta('storageKey');
  @override
  late final GeneratedColumn<String> storageKey = GeneratedColumn<String>(
      'storage_key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _thumbnailUrlMeta =
      const VerificationMeta('thumbnailUrl');
  @override
  late final GeneratedColumn<String> thumbnailUrl = GeneratedColumn<String>(
      'thumbnail_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateTakenMeta =
      const VerificationMeta('dateTaken');
  @override
  late final GeneratedColumn<DateTime> dateTaken = GeneratedColumn<DateTime>(
      'date_taken', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      location = GeneratedColumn<String>('location', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Map<String, dynamic>?>(
              $MediaTableTable.$converterlocationn);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> tags =
      GeneratedColumn<String>('tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant(''))
          .withConverter<List<String>>($MediaTableTable.$convertertags);
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
      'width', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
      'height', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _privacyMeta =
      const VerificationMeta('privacy');
  @override
  late final GeneratedColumn<String> privacy = GeneratedColumn<String>(
      'privacy', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('family'));
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      detectedFaces = GeneratedColumn<String>(
              'detected_faces', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<Map<String, dynamic>>(
              $MediaTableTable.$converterdetectedFaces);
  static const VerificationMeta _uploadedByMeta =
      const VerificationMeta('uploadedBy');
  @override
  late final GeneratedColumn<String> uploadedBy = GeneratedColumn<String>(
      'uploaded_by', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users_table (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncPendingMeta =
      const VerificationMeta('syncPending');
  @override
  late final GeneratedColumn<bool> syncPending = GeneratedColumn<bool>(
      'sync_pending', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("sync_pending" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        treeId,
        personId,
        type,
        fileName,
        fileSize,
        mimeType,
        storageKey,
        url,
        thumbnailUrl,
        title,
        description,
        dateTaken,
        location,
        tags,
        width,
        height,
        privacy,
        detectedFaces,
        uploadedBy,
        createdAt,
        updatedAt,
        deletedAt,
        syncPending
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_table';
  @override
  VerificationContext validateIntegrity(Insertable<MediaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('tree_id')) {
      context.handle(_treeIdMeta,
          treeId.isAcceptableOrUnknown(data['tree_id']!, _treeIdMeta));
    } else if (isInserting) {
      context.missing(_treeIdMeta);
    }
    if (data.containsKey('person_id')) {
      context.handle(_personIdMeta,
          personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('file_name')) {
      context.handle(_fileNameMeta,
          fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta));
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('file_size')) {
      context.handle(_fileSizeMeta,
          fileSize.isAcceptableOrUnknown(data['file_size']!, _fileSizeMeta));
    } else if (isInserting) {
      context.missing(_fileSizeMeta);
    }
    if (data.containsKey('mime_type')) {
      context.handle(_mimeTypeMeta,
          mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta));
    } else if (isInserting) {
      context.missing(_mimeTypeMeta);
    }
    if (data.containsKey('storage_key')) {
      context.handle(
          _storageKeyMeta,
          storageKey.isAcceptableOrUnknown(
              data['storage_key']!, _storageKeyMeta));
    } else if (isInserting) {
      context.missing(_storageKeyMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('thumbnail_url')) {
      context.handle(
          _thumbnailUrlMeta,
          thumbnailUrl.isAcceptableOrUnknown(
              data['thumbnail_url']!, _thumbnailUrlMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('date_taken')) {
      context.handle(_dateTakenMeta,
          dateTaken.isAcceptableOrUnknown(data['date_taken']!, _dateTakenMeta));
    }
    if (data.containsKey('width')) {
      context.handle(
          _widthMeta, width.isAcceptableOrUnknown(data['width']!, _widthMeta));
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    }
    if (data.containsKey('privacy')) {
      context.handle(_privacyMeta,
          privacy.isAcceptableOrUnknown(data['privacy']!, _privacyMeta));
    }
    if (data.containsKey('uploaded_by')) {
      context.handle(
          _uploadedByMeta,
          uploadedBy.isAcceptableOrUnknown(
              data['uploaded_by']!, _uploadedByMeta));
    } else if (isInserting) {
      context.missing(_uploadedByMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_pending')) {
      context.handle(
          _syncPendingMeta,
          syncPending.isAcceptableOrUnknown(
              data['sync_pending']!, _syncPendingMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MediaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      treeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tree_id'])!,
      personId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}person_id']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      fileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_name'])!,
      fileSize: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}file_size'])!,
      mimeType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mime_type'])!,
      storageKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}storage_key'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      thumbnailUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail_url']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      dateTaken: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_taken']),
      location: $MediaTableTable.$converterlocationn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])),
      tags: $MediaTableTable.$convertertags.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!),
      width: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}width']),
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}height']),
      privacy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}privacy'])!,
      detectedFaces: $MediaTableTable.$converterdetectedFaces.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}detected_faces'])!),
      uploadedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uploaded_by'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncPending: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sync_pending'])!,
    );
  }

  @override
  $MediaTableTable createAlias(String alias) {
    return $MediaTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $converterlocation =
      const CustomJsonTypeConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $converterlocationn =
      NullAwareTypeConverter.wrap($converterlocation);
  static TypeConverter<List<String>, String> $convertertags =
      const StringListConverter();
  static TypeConverter<Map<String, dynamic>, String> $converterdetectedFaces =
      const CustomJsonTypeConverter();
}

class MediaData extends DataClass implements Insertable<MediaData> {
  final String id;
  final String treeId;
  final String? personId;
  final String type;
  final String fileName;
  final int fileSize;
  final String mimeType;
  final String storageKey;
  final String url;
  final String? thumbnailUrl;
  final String? title;
  final String? description;
  final DateTime? dateTaken;
  final Map<String, dynamic>? location;
  final List<String> tags;
  final int? width;
  final int? height;
  final String privacy;
  final Map<String, dynamic> detectedFaces;
  final String uploadedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final bool syncPending;
  const MediaData(
      {required this.id,
      required this.treeId,
      this.personId,
      required this.type,
      required this.fileName,
      required this.fileSize,
      required this.mimeType,
      required this.storageKey,
      required this.url,
      this.thumbnailUrl,
      this.title,
      this.description,
      this.dateTaken,
      this.location,
      required this.tags,
      this.width,
      this.height,
      required this.privacy,
      required this.detectedFaces,
      required this.uploadedBy,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      required this.syncPending});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['tree_id'] = Variable<String>(treeId);
    if (!nullToAbsent || personId != null) {
      map['person_id'] = Variable<String>(personId);
    }
    map['type'] = Variable<String>(type);
    map['file_name'] = Variable<String>(fileName);
    map['file_size'] = Variable<int>(fileSize);
    map['mime_type'] = Variable<String>(mimeType);
    map['storage_key'] = Variable<String>(storageKey);
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || thumbnailUrl != null) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || dateTaken != null) {
      map['date_taken'] = Variable<DateTime>(dateTaken);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(
          $MediaTableTable.$converterlocationn.toSql(location));
    }
    {
      map['tags'] =
          Variable<String>($MediaTableTable.$convertertags.toSql(tags));
    }
    if (!nullToAbsent || width != null) {
      map['width'] = Variable<int>(width);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<int>(height);
    }
    map['privacy'] = Variable<String>(privacy);
    {
      map['detected_faces'] = Variable<String>(
          $MediaTableTable.$converterdetectedFaces.toSql(detectedFaces));
    }
    map['uploaded_by'] = Variable<String>(uploadedBy);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_pending'] = Variable<bool>(syncPending);
    return map;
  }

  MediaTableCompanion toCompanion(bool nullToAbsent) {
    return MediaTableCompanion(
      id: Value(id),
      treeId: Value(treeId),
      personId: personId == null && nullToAbsent
          ? const Value.absent()
          : Value(personId),
      type: Value(type),
      fileName: Value(fileName),
      fileSize: Value(fileSize),
      mimeType: Value(mimeType),
      storageKey: Value(storageKey),
      url: Value(url),
      thumbnailUrl: thumbnailUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailUrl),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      dateTaken: dateTaken == null && nullToAbsent
          ? const Value.absent()
          : Value(dateTaken),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      tags: Value(tags),
      width:
          width == null && nullToAbsent ? const Value.absent() : Value(width),
      height:
          height == null && nullToAbsent ? const Value.absent() : Value(height),
      privacy: Value(privacy),
      detectedFaces: Value(detectedFaces),
      uploadedBy: Value(uploadedBy),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncPending: Value(syncPending),
    );
  }

  factory MediaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaData(
      id: serializer.fromJson<String>(json['id']),
      treeId: serializer.fromJson<String>(json['treeId']),
      personId: serializer.fromJson<String?>(json['personId']),
      type: serializer.fromJson<String>(json['type']),
      fileName: serializer.fromJson<String>(json['fileName']),
      fileSize: serializer.fromJson<int>(json['fileSize']),
      mimeType: serializer.fromJson<String>(json['mimeType']),
      storageKey: serializer.fromJson<String>(json['storageKey']),
      url: serializer.fromJson<String>(json['url']),
      thumbnailUrl: serializer.fromJson<String?>(json['thumbnailUrl']),
      title: serializer.fromJson<String?>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      dateTaken: serializer.fromJson<DateTime?>(json['dateTaken']),
      location: serializer.fromJson<Map<String, dynamic>?>(json['location']),
      tags: serializer.fromJson<List<String>>(json['tags']),
      width: serializer.fromJson<int?>(json['width']),
      height: serializer.fromJson<int?>(json['height']),
      privacy: serializer.fromJson<String>(json['privacy']),
      detectedFaces:
          serializer.fromJson<Map<String, dynamic>>(json['detectedFaces']),
      uploadedBy: serializer.fromJson<String>(json['uploadedBy']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncPending: serializer.fromJson<bool>(json['syncPending']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'treeId': serializer.toJson<String>(treeId),
      'personId': serializer.toJson<String?>(personId),
      'type': serializer.toJson<String>(type),
      'fileName': serializer.toJson<String>(fileName),
      'fileSize': serializer.toJson<int>(fileSize),
      'mimeType': serializer.toJson<String>(mimeType),
      'storageKey': serializer.toJson<String>(storageKey),
      'url': serializer.toJson<String>(url),
      'thumbnailUrl': serializer.toJson<String?>(thumbnailUrl),
      'title': serializer.toJson<String?>(title),
      'description': serializer.toJson<String?>(description),
      'dateTaken': serializer.toJson<DateTime?>(dateTaken),
      'location': serializer.toJson<Map<String, dynamic>?>(location),
      'tags': serializer.toJson<List<String>>(tags),
      'width': serializer.toJson<int?>(width),
      'height': serializer.toJson<int?>(height),
      'privacy': serializer.toJson<String>(privacy),
      'detectedFaces': serializer.toJson<Map<String, dynamic>>(detectedFaces),
      'uploadedBy': serializer.toJson<String>(uploadedBy),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncPending': serializer.toJson<bool>(syncPending),
    };
  }

  MediaData copyWith(
          {String? id,
          String? treeId,
          Value<String?> personId = const Value.absent(),
          String? type,
          String? fileName,
          int? fileSize,
          String? mimeType,
          String? storageKey,
          String? url,
          Value<String?> thumbnailUrl = const Value.absent(),
          Value<String?> title = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<DateTime?> dateTaken = const Value.absent(),
          Value<Map<String, dynamic>?> location = const Value.absent(),
          List<String>? tags,
          Value<int?> width = const Value.absent(),
          Value<int?> height = const Value.absent(),
          String? privacy,
          Map<String, dynamic>? detectedFaces,
          String? uploadedBy,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent(),
          bool? syncPending}) =>
      MediaData(
        id: id ?? this.id,
        treeId: treeId ?? this.treeId,
        personId: personId.present ? personId.value : this.personId,
        type: type ?? this.type,
        fileName: fileName ?? this.fileName,
        fileSize: fileSize ?? this.fileSize,
        mimeType: mimeType ?? this.mimeType,
        storageKey: storageKey ?? this.storageKey,
        url: url ?? this.url,
        thumbnailUrl:
            thumbnailUrl.present ? thumbnailUrl.value : this.thumbnailUrl,
        title: title.present ? title.value : this.title,
        description: description.present ? description.value : this.description,
        dateTaken: dateTaken.present ? dateTaken.value : this.dateTaken,
        location: location.present ? location.value : this.location,
        tags: tags ?? this.tags,
        width: width.present ? width.value : this.width,
        height: height.present ? height.value : this.height,
        privacy: privacy ?? this.privacy,
        detectedFaces: detectedFaces ?? this.detectedFaces,
        uploadedBy: uploadedBy ?? this.uploadedBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncPending: syncPending ?? this.syncPending,
      );
  MediaData copyWithCompanion(MediaTableCompanion data) {
    return MediaData(
      id: data.id.present ? data.id.value : this.id,
      treeId: data.treeId.present ? data.treeId.value : this.treeId,
      personId: data.personId.present ? data.personId.value : this.personId,
      type: data.type.present ? data.type.value : this.type,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      fileSize: data.fileSize.present ? data.fileSize.value : this.fileSize,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
      storageKey:
          data.storageKey.present ? data.storageKey.value : this.storageKey,
      url: data.url.present ? data.url.value : this.url,
      thumbnailUrl: data.thumbnailUrl.present
          ? data.thumbnailUrl.value
          : this.thumbnailUrl,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      dateTaken: data.dateTaken.present ? data.dateTaken.value : this.dateTaken,
      location: data.location.present ? data.location.value : this.location,
      tags: data.tags.present ? data.tags.value : this.tags,
      width: data.width.present ? data.width.value : this.width,
      height: data.height.present ? data.height.value : this.height,
      privacy: data.privacy.present ? data.privacy.value : this.privacy,
      detectedFaces: data.detectedFaces.present
          ? data.detectedFaces.value
          : this.detectedFaces,
      uploadedBy:
          data.uploadedBy.present ? data.uploadedBy.value : this.uploadedBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncPending:
          data.syncPending.present ? data.syncPending.value : this.syncPending,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaData(')
          ..write('id: $id, ')
          ..write('treeId: $treeId, ')
          ..write('personId: $personId, ')
          ..write('type: $type, ')
          ..write('fileName: $fileName, ')
          ..write('fileSize: $fileSize, ')
          ..write('mimeType: $mimeType, ')
          ..write('storageKey: $storageKey, ')
          ..write('url: $url, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('dateTaken: $dateTaken, ')
          ..write('location: $location, ')
          ..write('tags: $tags, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('privacy: $privacy, ')
          ..write('detectedFaces: $detectedFaces, ')
          ..write('uploadedBy: $uploadedBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncPending: $syncPending')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        treeId,
        personId,
        type,
        fileName,
        fileSize,
        mimeType,
        storageKey,
        url,
        thumbnailUrl,
        title,
        description,
        dateTaken,
        location,
        tags,
        width,
        height,
        privacy,
        detectedFaces,
        uploadedBy,
        createdAt,
        updatedAt,
        deletedAt,
        syncPending
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaData &&
          other.id == this.id &&
          other.treeId == this.treeId &&
          other.personId == this.personId &&
          other.type == this.type &&
          other.fileName == this.fileName &&
          other.fileSize == this.fileSize &&
          other.mimeType == this.mimeType &&
          other.storageKey == this.storageKey &&
          other.url == this.url &&
          other.thumbnailUrl == this.thumbnailUrl &&
          other.title == this.title &&
          other.description == this.description &&
          other.dateTaken == this.dateTaken &&
          other.location == this.location &&
          other.tags == this.tags &&
          other.width == this.width &&
          other.height == this.height &&
          other.privacy == this.privacy &&
          other.detectedFaces == this.detectedFaces &&
          other.uploadedBy == this.uploadedBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncPending == this.syncPending);
}

class MediaTableCompanion extends UpdateCompanion<MediaData> {
  final Value<String> id;
  final Value<String> treeId;
  final Value<String?> personId;
  final Value<String> type;
  final Value<String> fileName;
  final Value<int> fileSize;
  final Value<String> mimeType;
  final Value<String> storageKey;
  final Value<String> url;
  final Value<String?> thumbnailUrl;
  final Value<String?> title;
  final Value<String?> description;
  final Value<DateTime?> dateTaken;
  final Value<Map<String, dynamic>?> location;
  final Value<List<String>> tags;
  final Value<int?> width;
  final Value<int?> height;
  final Value<String> privacy;
  final Value<Map<String, dynamic>> detectedFaces;
  final Value<String> uploadedBy;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<bool> syncPending;
  final Value<int> rowid;
  const MediaTableCompanion({
    this.id = const Value.absent(),
    this.treeId = const Value.absent(),
    this.personId = const Value.absent(),
    this.type = const Value.absent(),
    this.fileName = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.storageKey = const Value.absent(),
    this.url = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.dateTaken = const Value.absent(),
    this.location = const Value.absent(),
    this.tags = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.privacy = const Value.absent(),
    this.detectedFaces = const Value.absent(),
    this.uploadedBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncPending = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaTableCompanion.insert({
    required String id,
    required String treeId,
    this.personId = const Value.absent(),
    required String type,
    required String fileName,
    required int fileSize,
    required String mimeType,
    required String storageKey,
    required String url,
    this.thumbnailUrl = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.dateTaken = const Value.absent(),
    this.location = const Value.absent(),
    this.tags = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.privacy = const Value.absent(),
    this.detectedFaces = const Value.absent(),
    required String uploadedBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncPending = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        treeId = Value(treeId),
        type = Value(type),
        fileName = Value(fileName),
        fileSize = Value(fileSize),
        mimeType = Value(mimeType),
        storageKey = Value(storageKey),
        url = Value(url),
        uploadedBy = Value(uploadedBy),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<MediaData> custom({
    Expression<String>? id,
    Expression<String>? treeId,
    Expression<String>? personId,
    Expression<String>? type,
    Expression<String>? fileName,
    Expression<int>? fileSize,
    Expression<String>? mimeType,
    Expression<String>? storageKey,
    Expression<String>? url,
    Expression<String>? thumbnailUrl,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? dateTaken,
    Expression<String>? location,
    Expression<String>? tags,
    Expression<int>? width,
    Expression<int>? height,
    Expression<String>? privacy,
    Expression<String>? detectedFaces,
    Expression<String>? uploadedBy,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<bool>? syncPending,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (treeId != null) 'tree_id': treeId,
      if (personId != null) 'person_id': personId,
      if (type != null) 'type': type,
      if (fileName != null) 'file_name': fileName,
      if (fileSize != null) 'file_size': fileSize,
      if (mimeType != null) 'mime_type': mimeType,
      if (storageKey != null) 'storage_key': storageKey,
      if (url != null) 'url': url,
      if (thumbnailUrl != null) 'thumbnail_url': thumbnailUrl,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (dateTaken != null) 'date_taken': dateTaken,
      if (location != null) 'location': location,
      if (tags != null) 'tags': tags,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (privacy != null) 'privacy': privacy,
      if (detectedFaces != null) 'detected_faces': detectedFaces,
      if (uploadedBy != null) 'uploaded_by': uploadedBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncPending != null) 'sync_pending': syncPending,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? treeId,
      Value<String?>? personId,
      Value<String>? type,
      Value<String>? fileName,
      Value<int>? fileSize,
      Value<String>? mimeType,
      Value<String>? storageKey,
      Value<String>? url,
      Value<String?>? thumbnailUrl,
      Value<String?>? title,
      Value<String?>? description,
      Value<DateTime?>? dateTaken,
      Value<Map<String, dynamic>?>? location,
      Value<List<String>>? tags,
      Value<int?>? width,
      Value<int?>? height,
      Value<String>? privacy,
      Value<Map<String, dynamic>>? detectedFaces,
      Value<String>? uploadedBy,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<bool>? syncPending,
      Value<int>? rowid}) {
    return MediaTableCompanion(
      id: id ?? this.id,
      treeId: treeId ?? this.treeId,
      personId: personId ?? this.personId,
      type: type ?? this.type,
      fileName: fileName ?? this.fileName,
      fileSize: fileSize ?? this.fileSize,
      mimeType: mimeType ?? this.mimeType,
      storageKey: storageKey ?? this.storageKey,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      title: title ?? this.title,
      description: description ?? this.description,
      dateTaken: dateTaken ?? this.dateTaken,
      location: location ?? this.location,
      tags: tags ?? this.tags,
      width: width ?? this.width,
      height: height ?? this.height,
      privacy: privacy ?? this.privacy,
      detectedFaces: detectedFaces ?? this.detectedFaces,
      uploadedBy: uploadedBy ?? this.uploadedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncPending: syncPending ?? this.syncPending,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (treeId.present) {
      map['tree_id'] = Variable<String>(treeId.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (fileSize.present) {
      map['file_size'] = Variable<int>(fileSize.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (storageKey.present) {
      map['storage_key'] = Variable<String>(storageKey.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (thumbnailUrl.present) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (dateTaken.present) {
      map['date_taken'] = Variable<DateTime>(dateTaken.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(
          $MediaTableTable.$converterlocationn.toSql(location.value));
    }
    if (tags.present) {
      map['tags'] =
          Variable<String>($MediaTableTable.$convertertags.toSql(tags.value));
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (privacy.present) {
      map['privacy'] = Variable<String>(privacy.value);
    }
    if (detectedFaces.present) {
      map['detected_faces'] = Variable<String>(
          $MediaTableTable.$converterdetectedFaces.toSql(detectedFaces.value));
    }
    if (uploadedBy.present) {
      map['uploaded_by'] = Variable<String>(uploadedBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncPending.present) {
      map['sync_pending'] = Variable<bool>(syncPending.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaTableCompanion(')
          ..write('id: $id, ')
          ..write('treeId: $treeId, ')
          ..write('personId: $personId, ')
          ..write('type: $type, ')
          ..write('fileName: $fileName, ')
          ..write('fileSize: $fileSize, ')
          ..write('mimeType: $mimeType, ')
          ..write('storageKey: $storageKey, ')
          ..write('url: $url, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('dateTaken: $dateTaken, ')
          ..write('location: $location, ')
          ..write('tags: $tags, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('privacy: $privacy, ')
          ..write('detectedFaces: $detectedFaces, ')
          ..write('uploadedBy: $uploadedBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncPending: $syncPending, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncOperationsTableTable extends SyncOperationsTable
    with TableInfo<$SyncOperationsTableTable, SyncOperationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncOperationsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _treeIdMeta = const VerificationMeta('treeId');
  @override
  late final GeneratedColumn<String> treeId = GeneratedColumn<String>(
      'tree_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES trees_table (id)'));
  static const VerificationMeta _operationTypeMeta =
      const VerificationMeta('operationType');
  @override
  late final GeneratedColumn<String> operationType = GeneratedColumn<String>(
      'operation_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entityIdMeta =
      const VerificationMeta('entityId');
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
      'entity_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      data = GeneratedColumn<String>('data', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              $SyncOperationsTableTable.$converterdata);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _syncedAtMeta =
      const VerificationMeta('syncedAt');
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
      'synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _retryCountMeta =
      const VerificationMeta('retryCount');
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
      'retry_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _errorMeta = const VerificationMeta('error');
  @override
  late final GeneratedColumn<String> error = GeneratedColumn<String>(
      'error', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users_table (id)'));
  static const VerificationMeta _userAgentMeta =
      const VerificationMeta('userAgent');
  @override
  late final GeneratedColumn<String> userAgent = GeneratedColumn<String>(
      'user_agent', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        treeId,
        operationType,
        entityType,
        entityId,
        data,
        createdAt,
        syncedAt,
        retryCount,
        error,
        userId,
        userAgent,
        deviceId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_operations_table';
  @override
  VerificationContext validateIntegrity(Insertable<SyncOperationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('tree_id')) {
      context.handle(_treeIdMeta,
          treeId.isAcceptableOrUnknown(data['tree_id']!, _treeIdMeta));
    }
    if (data.containsKey('operation_type')) {
      context.handle(
          _operationTypeMeta,
          operationType.isAcceptableOrUnknown(
              data['operation_type']!, _operationTypeMeta));
    } else if (isInserting) {
      context.missing(_operationTypeMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(_entityIdMeta,
          entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta));
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(_syncedAtMeta,
          syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta));
    }
    if (data.containsKey('retry_count')) {
      context.handle(
          _retryCountMeta,
          retryCount.isAcceptableOrUnknown(
              data['retry_count']!, _retryCountMeta));
    }
    if (data.containsKey('error')) {
      context.handle(
          _errorMeta, error.isAcceptableOrUnknown(data['error']!, _errorMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('user_agent')) {
      context.handle(_userAgentMeta,
          userAgent.isAcceptableOrUnknown(data['user_agent']!, _userAgentMeta));
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncOperationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncOperationData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      treeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tree_id']),
      operationType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}operation_type'])!,
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      entityId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_id'])!,
      data: $SyncOperationsTableTable.$converterdata.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      syncedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}synced_at']),
      retryCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}retry_count'])!,
      error: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}error']),
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      userAgent: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_agent']),
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_id']),
    );
  }

  @override
  $SyncOperationsTableTable createAlias(String alias) {
    return $SyncOperationsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $converterdata =
      const CustomJsonTypeConverter();
}

class SyncOperationData extends DataClass
    implements Insertable<SyncOperationData> {
  final String id;
  final String? treeId;
  final String operationType;
  final String entityType;
  final String entityId;
  final Map<String, dynamic> data;
  final DateTime createdAt;
  final DateTime? syncedAt;
  final int retryCount;
  final String? error;
  final String userId;
  final String? userAgent;
  final String? deviceId;
  const SyncOperationData(
      {required this.id,
      this.treeId,
      required this.operationType,
      required this.entityType,
      required this.entityId,
      required this.data,
      required this.createdAt,
      this.syncedAt,
      required this.retryCount,
      this.error,
      required this.userId,
      this.userAgent,
      this.deviceId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || treeId != null) {
      map['tree_id'] = Variable<String>(treeId);
    }
    map['operation_type'] = Variable<String>(operationType);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    {
      map['data'] = Variable<String>(
          $SyncOperationsTableTable.$converterdata.toSql(data));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || syncedAt != null) {
      map['synced_at'] = Variable<DateTime>(syncedAt);
    }
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || error != null) {
      map['error'] = Variable<String>(error);
    }
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || userAgent != null) {
      map['user_agent'] = Variable<String>(userAgent);
    }
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    return map;
  }

  SyncOperationsTableCompanion toCompanion(bool nullToAbsent) {
    return SyncOperationsTableCompanion(
      id: Value(id),
      treeId:
          treeId == null && nullToAbsent ? const Value.absent() : Value(treeId),
      operationType: Value(operationType),
      entityType: Value(entityType),
      entityId: Value(entityId),
      data: Value(data),
      createdAt: Value(createdAt),
      syncedAt: syncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(syncedAt),
      retryCount: Value(retryCount),
      error:
          error == null && nullToAbsent ? const Value.absent() : Value(error),
      userId: Value(userId),
      userAgent: userAgent == null && nullToAbsent
          ? const Value.absent()
          : Value(userAgent),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
    );
  }

  factory SyncOperationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncOperationData(
      id: serializer.fromJson<String>(json['id']),
      treeId: serializer.fromJson<String?>(json['treeId']),
      operationType: serializer.fromJson<String>(json['operationType']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      data: serializer.fromJson<Map<String, dynamic>>(json['data']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      syncedAt: serializer.fromJson<DateTime?>(json['syncedAt']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      error: serializer.fromJson<String?>(json['error']),
      userId: serializer.fromJson<String>(json['userId']),
      userAgent: serializer.fromJson<String?>(json['userAgent']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'treeId': serializer.toJson<String?>(treeId),
      'operationType': serializer.toJson<String>(operationType),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'data': serializer.toJson<Map<String, dynamic>>(data),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'syncedAt': serializer.toJson<DateTime?>(syncedAt),
      'retryCount': serializer.toJson<int>(retryCount),
      'error': serializer.toJson<String?>(error),
      'userId': serializer.toJson<String>(userId),
      'userAgent': serializer.toJson<String?>(userAgent),
      'deviceId': serializer.toJson<String?>(deviceId),
    };
  }

  SyncOperationData copyWith(
          {String? id,
          Value<String?> treeId = const Value.absent(),
          String? operationType,
          String? entityType,
          String? entityId,
          Map<String, dynamic>? data,
          DateTime? createdAt,
          Value<DateTime?> syncedAt = const Value.absent(),
          int? retryCount,
          Value<String?> error = const Value.absent(),
          String? userId,
          Value<String?> userAgent = const Value.absent(),
          Value<String?> deviceId = const Value.absent()}) =>
      SyncOperationData(
        id: id ?? this.id,
        treeId: treeId.present ? treeId.value : this.treeId,
        operationType: operationType ?? this.operationType,
        entityType: entityType ?? this.entityType,
        entityId: entityId ?? this.entityId,
        data: data ?? this.data,
        createdAt: createdAt ?? this.createdAt,
        syncedAt: syncedAt.present ? syncedAt.value : this.syncedAt,
        retryCount: retryCount ?? this.retryCount,
        error: error.present ? error.value : this.error,
        userId: userId ?? this.userId,
        userAgent: userAgent.present ? userAgent.value : this.userAgent,
        deviceId: deviceId.present ? deviceId.value : this.deviceId,
      );
  SyncOperationData copyWithCompanion(SyncOperationsTableCompanion data) {
    return SyncOperationData(
      id: data.id.present ? data.id.value : this.id,
      treeId: data.treeId.present ? data.treeId.value : this.treeId,
      operationType: data.operationType.present
          ? data.operationType.value
          : this.operationType,
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      data: data.data.present ? data.data.value : this.data,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
      retryCount:
          data.retryCount.present ? data.retryCount.value : this.retryCount,
      error: data.error.present ? data.error.value : this.error,
      userId: data.userId.present ? data.userId.value : this.userId,
      userAgent: data.userAgent.present ? data.userAgent.value : this.userAgent,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncOperationData(')
          ..write('id: $id, ')
          ..write('treeId: $treeId, ')
          ..write('operationType: $operationType, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('data: $data, ')
          ..write('createdAt: $createdAt, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('retryCount: $retryCount, ')
          ..write('error: $error, ')
          ..write('userId: $userId, ')
          ..write('userAgent: $userAgent, ')
          ..write('deviceId: $deviceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      treeId,
      operationType,
      entityType,
      entityId,
      data,
      createdAt,
      syncedAt,
      retryCount,
      error,
      userId,
      userAgent,
      deviceId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncOperationData &&
          other.id == this.id &&
          other.treeId == this.treeId &&
          other.operationType == this.operationType &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.data == this.data &&
          other.createdAt == this.createdAt &&
          other.syncedAt == this.syncedAt &&
          other.retryCount == this.retryCount &&
          other.error == this.error &&
          other.userId == this.userId &&
          other.userAgent == this.userAgent &&
          other.deviceId == this.deviceId);
}

class SyncOperationsTableCompanion extends UpdateCompanion<SyncOperationData> {
  final Value<String> id;
  final Value<String?> treeId;
  final Value<String> operationType;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<Map<String, dynamic>> data;
  final Value<DateTime> createdAt;
  final Value<DateTime?> syncedAt;
  final Value<int> retryCount;
  final Value<String?> error;
  final Value<String> userId;
  final Value<String?> userAgent;
  final Value<String?> deviceId;
  final Value<int> rowid;
  const SyncOperationsTableCompanion({
    this.id = const Value.absent(),
    this.treeId = const Value.absent(),
    this.operationType = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.data = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.error = const Value.absent(),
    this.userId = const Value.absent(),
    this.userAgent = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncOperationsTableCompanion.insert({
    required String id,
    this.treeId = const Value.absent(),
    required String operationType,
    required String entityType,
    required String entityId,
    required Map<String, dynamic> data,
    required DateTime createdAt,
    this.syncedAt = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.error = const Value.absent(),
    required String userId,
    this.userAgent = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        operationType = Value(operationType),
        entityType = Value(entityType),
        entityId = Value(entityId),
        data = Value(data),
        createdAt = Value(createdAt),
        userId = Value(userId);
  static Insertable<SyncOperationData> custom({
    Expression<String>? id,
    Expression<String>? treeId,
    Expression<String>? operationType,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? data,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? syncedAt,
    Expression<int>? retryCount,
    Expression<String>? error,
    Expression<String>? userId,
    Expression<String>? userAgent,
    Expression<String>? deviceId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (treeId != null) 'tree_id': treeId,
      if (operationType != null) 'operation_type': operationType,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (data != null) 'data': data,
      if (createdAt != null) 'created_at': createdAt,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (retryCount != null) 'retry_count': retryCount,
      if (error != null) 'error': error,
      if (userId != null) 'user_id': userId,
      if (userAgent != null) 'user_agent': userAgent,
      if (deviceId != null) 'device_id': deviceId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncOperationsTableCompanion copyWith(
      {Value<String>? id,
      Value<String?>? treeId,
      Value<String>? operationType,
      Value<String>? entityType,
      Value<String>? entityId,
      Value<Map<String, dynamic>>? data,
      Value<DateTime>? createdAt,
      Value<DateTime?>? syncedAt,
      Value<int>? retryCount,
      Value<String?>? error,
      Value<String>? userId,
      Value<String?>? userAgent,
      Value<String?>? deviceId,
      Value<int>? rowid}) {
    return SyncOperationsTableCompanion(
      id: id ?? this.id,
      treeId: treeId ?? this.treeId,
      operationType: operationType ?? this.operationType,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      data: data ?? this.data,
      createdAt: createdAt ?? this.createdAt,
      syncedAt: syncedAt ?? this.syncedAt,
      retryCount: retryCount ?? this.retryCount,
      error: error ?? this.error,
      userId: userId ?? this.userId,
      userAgent: userAgent ?? this.userAgent,
      deviceId: deviceId ?? this.deviceId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (treeId.present) {
      map['tree_id'] = Variable<String>(treeId.value);
    }
    if (operationType.present) {
      map['operation_type'] = Variable<String>(operationType.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(
          $SyncOperationsTableTable.$converterdata.toSql(data.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (error.present) {
      map['error'] = Variable<String>(error.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (userAgent.present) {
      map['user_agent'] = Variable<String>(userAgent.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncOperationsTableCompanion(')
          ..write('id: $id, ')
          ..write('treeId: $treeId, ')
          ..write('operationType: $operationType, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('data: $data, ')
          ..write('createdAt: $createdAt, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('retryCount: $retryCount, ')
          ..write('error: $error, ')
          ..write('userId: $userId, ')
          ..write('userAgent: $userAgent, ')
          ..write('deviceId: $deviceId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTableTable usersTable = $UsersTableTable(this);
  late final $TreesTableTable treesTable = $TreesTableTable(this);
  late final $TreeMembersTableTable treeMembersTable =
      $TreeMembersTableTable(this);
  late final $PersonsTableTable personsTable = $PersonsTableTable(this);
  late final $RelationshipsTableTable relationshipsTable =
      $RelationshipsTableTable(this);
  late final $EventsTableTable eventsTable = $EventsTableTable(this);
  late final $StoriesTableTable storiesTable = $StoriesTableTable(this);
  late final $MediaTableTable mediaTable = $MediaTableTable(this);
  late final $SyncOperationsTableTable syncOperationsTable =
      $SyncOperationsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        usersTable,
        treesTable,
        treeMembersTable,
        personsTable,
        relationshipsTable,
        eventsTable,
        storiesTable,
        mediaTable,
        syncOperationsTable
      ];
}

typedef $$UsersTableTableCreateCompanionBuilder = UsersTableCompanion Function({
  required String id,
  required String email,
  required String firstName,
  required String lastName,
  Value<String?> profilePictureUrl,
  Value<String?> phoneNumber,
  Value<DateTime?> dateOfBirth,
  Value<Map<String, dynamic>> preferences,
  Value<bool> emailVerified,
  Value<bool> mfaEnabled,
  Value<String?> mfaSecret,
  Value<DateTime?> lastLoginAt,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$UsersTableTableUpdateCompanionBuilder = UsersTableCompanion Function({
  Value<String> id,
  Value<String> email,
  Value<String> firstName,
  Value<String> lastName,
  Value<String?> profilePictureUrl,
  Value<String?> phoneNumber,
  Value<DateTime?> dateOfBirth,
  Value<Map<String, dynamic>> preferences,
  Value<bool> emailVerified,
  Value<bool> mfaEnabled,
  Value<String?> mfaSecret,
  Value<DateTime?> lastLoginAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

final class $$UsersTableTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTableTable, UserData> {
  $$UsersTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TreesTableTable, List<TreeData>>
      _treesTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.treesTable,
          aliasName:
              $_aliasNameGenerator(db.usersTable.id, db.treesTable.ownerId));

  $$TreesTableTableProcessedTableManager get treesTableRefs {
    final manager = $$TreesTableTableTableManager($_db, $_db.treesTable)
        .filter((f) => f.ownerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_treesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$StoriesTableTable, List<StoryData>>
      _storiesTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.storiesTable,
          aliasName:
              $_aliasNameGenerator(db.usersTable.id, db.storiesTable.authorId));

  $$StoriesTableTableProcessedTableManager get storiesTableRefs {
    final manager = $$StoriesTableTableTableManager($_db, $_db.storiesTable)
        .filter((f) => f.authorId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_storiesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MediaTableTable, List<MediaData>>
      _mediaTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.mediaTable,
          aliasName:
              $_aliasNameGenerator(db.usersTable.id, db.mediaTable.uploadedBy));

  $$MediaTableTableProcessedTableManager get mediaTableRefs {
    final manager = $$MediaTableTableTableManager($_db, $_db.mediaTable)
        .filter((f) => f.uploadedBy.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mediaTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$SyncOperationsTableTable, List<SyncOperationData>>
      _syncOperationsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.syncOperationsTable,
              aliasName: $_aliasNameGenerator(
                  db.usersTable.id, db.syncOperationsTable.userId));

  $$SyncOperationsTableTableProcessedTableManager get syncOperationsTableRefs {
    final manager =
        $$SyncOperationsTableTableTableManager($_db, $_db.syncOperationsTable)
            .filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_syncOperationsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UsersTableTableFilterComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profilePictureUrl => $composableBuilder(
      column: $table.profilePictureUrl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateOfBirth => $composableBuilder(
      column: $table.dateOfBirth, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get preferences => $composableBuilder(
          column: $table.preferences,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get emailVerified => $composableBuilder(
      column: $table.emailVerified, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get mfaEnabled => $composableBuilder(
      column: $table.mfaEnabled, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mfaSecret => $composableBuilder(
      column: $table.mfaSecret, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastLoginAt => $composableBuilder(
      column: $table.lastLoginAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> treesTableRefs(
      Expression<bool> Function($$TreesTableTableFilterComposer f) f) {
    final $$TreesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.ownerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableFilterComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> storiesTableRefs(
      Expression<bool> Function($$StoriesTableTableFilterComposer f) f) {
    final $$StoriesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.storiesTable,
        getReferencedColumn: (t) => t.authorId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StoriesTableTableFilterComposer(
              $db: $db,
              $table: $db.storiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> mediaTableRefs(
      Expression<bool> Function($$MediaTableTableFilterComposer f) f) {
    final $$MediaTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mediaTable,
        getReferencedColumn: (t) => t.uploadedBy,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MediaTableTableFilterComposer(
              $db: $db,
              $table: $db.mediaTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> syncOperationsTableRefs(
      Expression<bool> Function($$SyncOperationsTableTableFilterComposer f) f) {
    final $$SyncOperationsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.syncOperationsTable,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SyncOperationsTableTableFilterComposer(
              $db: $db,
              $table: $db.syncOperationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profilePictureUrl => $composableBuilder(
      column: $table.profilePictureUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateOfBirth => $composableBuilder(
      column: $table.dateOfBirth, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get preferences => $composableBuilder(
      column: $table.preferences, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get emailVerified => $composableBuilder(
      column: $table.emailVerified,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get mfaEnabled => $composableBuilder(
      column: $table.mfaEnabled, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mfaSecret => $composableBuilder(
      column: $table.mfaSecret, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastLoginAt => $composableBuilder(
      column: $table.lastLoginAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get profilePictureUrl => $composableBuilder(
      column: $table.profilePictureUrl, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfBirth => $composableBuilder(
      column: $table.dateOfBirth, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      get preferences => $composableBuilder(
          column: $table.preferences, builder: (column) => column);

  GeneratedColumn<bool> get emailVerified => $composableBuilder(
      column: $table.emailVerified, builder: (column) => column);

  GeneratedColumn<bool> get mfaEnabled => $composableBuilder(
      column: $table.mfaEnabled, builder: (column) => column);

  GeneratedColumn<String> get mfaSecret =>
      $composableBuilder(column: $table.mfaSecret, builder: (column) => column);

  GeneratedColumn<DateTime> get lastLoginAt => $composableBuilder(
      column: $table.lastLoginAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> treesTableRefs<T extends Object>(
      Expression<T> Function($$TreesTableTableAnnotationComposer a) f) {
    final $$TreesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.ownerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> storiesTableRefs<T extends Object>(
      Expression<T> Function($$StoriesTableTableAnnotationComposer a) f) {
    final $$StoriesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.storiesTable,
        getReferencedColumn: (t) => t.authorId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StoriesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.storiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> mediaTableRefs<T extends Object>(
      Expression<T> Function($$MediaTableTableAnnotationComposer a) f) {
    final $$MediaTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mediaTable,
        getReferencedColumn: (t) => t.uploadedBy,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MediaTableTableAnnotationComposer(
              $db: $db,
              $table: $db.mediaTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> syncOperationsTableRefs<T extends Object>(
      Expression<T> Function($$SyncOperationsTableTableAnnotationComposer a)
          f) {
    final $$SyncOperationsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.syncOperationsTable,
            getReferencedColumn: (t) => t.userId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$SyncOperationsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.syncOperationsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$UsersTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTableTable,
    UserData,
    $$UsersTableTableFilterComposer,
    $$UsersTableTableOrderingComposer,
    $$UsersTableTableAnnotationComposer,
    $$UsersTableTableCreateCompanionBuilder,
    $$UsersTableTableUpdateCompanionBuilder,
    (UserData, $$UsersTableTableReferences),
    UserData,
    PrefetchHooks Function(
        {bool treesTableRefs,
        bool storiesTableRefs,
        bool mediaTableRefs,
        bool syncOperationsTableRefs})> {
  $$UsersTableTableTableManager(_$AppDatabase db, $UsersTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String?> profilePictureUrl = const Value.absent(),
            Value<String?> phoneNumber = const Value.absent(),
            Value<DateTime?> dateOfBirth = const Value.absent(),
            Value<Map<String, dynamic>> preferences = const Value.absent(),
            Value<bool> emailVerified = const Value.absent(),
            Value<bool> mfaEnabled = const Value.absent(),
            Value<String?> mfaSecret = const Value.absent(),
            Value<DateTime?> lastLoginAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersTableCompanion(
            id: id,
            email: email,
            firstName: firstName,
            lastName: lastName,
            profilePictureUrl: profilePictureUrl,
            phoneNumber: phoneNumber,
            dateOfBirth: dateOfBirth,
            preferences: preferences,
            emailVerified: emailVerified,
            mfaEnabled: mfaEnabled,
            mfaSecret: mfaSecret,
            lastLoginAt: lastLoginAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String email,
            required String firstName,
            required String lastName,
            Value<String?> profilePictureUrl = const Value.absent(),
            Value<String?> phoneNumber = const Value.absent(),
            Value<DateTime?> dateOfBirth = const Value.absent(),
            Value<Map<String, dynamic>> preferences = const Value.absent(),
            Value<bool> emailVerified = const Value.absent(),
            Value<bool> mfaEnabled = const Value.absent(),
            Value<String?> mfaSecret = const Value.absent(),
            Value<DateTime?> lastLoginAt = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersTableCompanion.insert(
            id: id,
            email: email,
            firstName: firstName,
            lastName: lastName,
            profilePictureUrl: profilePictureUrl,
            phoneNumber: phoneNumber,
            dateOfBirth: dateOfBirth,
            preferences: preferences,
            emailVerified: emailVerified,
            mfaEnabled: mfaEnabled,
            mfaSecret: mfaSecret,
            lastLoginAt: lastLoginAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$UsersTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {treesTableRefs = false,
              storiesTableRefs = false,
              mediaTableRefs = false,
              syncOperationsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (treesTableRefs) db.treesTable,
                if (storiesTableRefs) db.storiesTable,
                if (mediaTableRefs) db.mediaTable,
                if (syncOperationsTableRefs) db.syncOperationsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (treesTableRefs)
                    await $_getPrefetchedData<UserData, $UsersTableTable,
                            TreeData>(
                        currentTable: table,
                        referencedTable: $$UsersTableTableReferences
                            ._treesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableTableReferences(db, table, p0)
                                .treesTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.ownerId == item.id),
                        typedResults: items),
                  if (storiesTableRefs)
                    await $_getPrefetchedData<UserData, $UsersTableTable,
                            StoryData>(
                        currentTable: table,
                        referencedTable: $$UsersTableTableReferences
                            ._storiesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableTableReferences(db, table, p0)
                                .storiesTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.authorId == item.id),
                        typedResults: items),
                  if (mediaTableRefs)
                    await $_getPrefetchedData<UserData, $UsersTableTable,
                            MediaData>(
                        currentTable: table,
                        referencedTable: $$UsersTableTableReferences
                            ._mediaTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableTableReferences(db, table, p0)
                                .mediaTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.uploadedBy == item.id),
                        typedResults: items),
                  if (syncOperationsTableRefs)
                    await $_getPrefetchedData<UserData, $UsersTableTable,
                            SyncOperationData>(
                        currentTable: table,
                        referencedTable: $$UsersTableTableReferences
                            ._syncOperationsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableTableReferences(db, table, p0)
                                .syncOperationsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UsersTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTableTable,
    UserData,
    $$UsersTableTableFilterComposer,
    $$UsersTableTableOrderingComposer,
    $$UsersTableTableAnnotationComposer,
    $$UsersTableTableCreateCompanionBuilder,
    $$UsersTableTableUpdateCompanionBuilder,
    (UserData, $$UsersTableTableReferences),
    UserData,
    PrefetchHooks Function(
        {bool treesTableRefs,
        bool storiesTableRefs,
        bool mediaTableRefs,
        bool syncOperationsTableRefs})>;
typedef $$TreesTableTableCreateCompanionBuilder = TreesTableCompanion Function({
  required String id,
  required String name,
  Value<String?> description,
  required String ownerId,
  Value<String> visibility,
  Value<Map<String, dynamic>> settings,
  Value<String?> coverImageUrl,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$TreesTableTableUpdateCompanionBuilder = TreesTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<String> ownerId,
  Value<String> visibility,
  Value<Map<String, dynamic>> settings,
  Value<String?> coverImageUrl,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

final class $$TreesTableTableReferences
    extends BaseReferences<_$AppDatabase, $TreesTableTable, TreeData> {
  $$TreesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTableTable _ownerIdTable(_$AppDatabase db) =>
      db.usersTable.createAlias(
          $_aliasNameGenerator(db.treesTable.ownerId, db.usersTable.id));

  $$UsersTableTableProcessedTableManager get ownerId {
    final $_column = $_itemColumn<String>('owner_id')!;

    final manager = $$UsersTableTableTableManager($_db, $_db.usersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TreeMembersTableTable, List<TreeMemberData>>
      _treeMembersTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.treeMembersTable,
              aliasName: $_aliasNameGenerator(
                  db.treesTable.id, db.treeMembersTable.treeId));

  $$TreeMembersTableTableProcessedTableManager get treeMembersTableRefs {
    final manager =
        $$TreeMembersTableTableTableManager($_db, $_db.treeMembersTable)
            .filter((f) => f.treeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_treeMembersTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PersonsTableTable, List<PersonData>>
      _personsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.personsTable,
          aliasName:
              $_aliasNameGenerator(db.treesTable.id, db.personsTable.treeId));

  $$PersonsTableTableProcessedTableManager get personsTableRefs {
    final manager = $$PersonsTableTableTableManager($_db, $_db.personsTable)
        .filter((f) => f.treeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_personsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RelationshipsTableTable, List<RelationshipData>>
      _relationshipsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.relationshipsTable,
              aliasName: $_aliasNameGenerator(
                  db.treesTable.id, db.relationshipsTable.treeId));

  $$RelationshipsTableTableProcessedTableManager get relationshipsTableRefs {
    final manager =
        $$RelationshipsTableTableTableManager($_db, $_db.relationshipsTable)
            .filter((f) => f.treeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_relationshipsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$EventsTableTable, List<EventData>>
      _eventsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.eventsTable,
          aliasName:
              $_aliasNameGenerator(db.treesTable.id, db.eventsTable.treeId));

  $$EventsTableTableProcessedTableManager get eventsTableRefs {
    final manager = $$EventsTableTableTableManager($_db, $_db.eventsTable)
        .filter((f) => f.treeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$StoriesTableTable, List<StoryData>>
      _storiesTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.storiesTable,
          aliasName:
              $_aliasNameGenerator(db.treesTable.id, db.storiesTable.treeId));

  $$StoriesTableTableProcessedTableManager get storiesTableRefs {
    final manager = $$StoriesTableTableTableManager($_db, $_db.storiesTable)
        .filter((f) => f.treeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_storiesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MediaTableTable, List<MediaData>>
      _mediaTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.mediaTable,
              aliasName:
                  $_aliasNameGenerator(db.treesTable.id, db.mediaTable.treeId));

  $$MediaTableTableProcessedTableManager get mediaTableRefs {
    final manager = $$MediaTableTableTableManager($_db, $_db.mediaTable)
        .filter((f) => f.treeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mediaTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$SyncOperationsTableTable, List<SyncOperationData>>
      _syncOperationsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.syncOperationsTable,
              aliasName: $_aliasNameGenerator(
                  db.treesTable.id, db.syncOperationsTable.treeId));

  $$SyncOperationsTableTableProcessedTableManager get syncOperationsTableRefs {
    final manager =
        $$SyncOperationsTableTableTableManager($_db, $_db.syncOperationsTable)
            .filter((f) => f.treeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_syncOperationsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TreesTableTableFilterComposer
    extends Composer<_$AppDatabase, $TreesTableTable> {
  $$TreesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get visibility => $composableBuilder(
      column: $table.visibility, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get settings => $composableBuilder(
          column: $table.settings,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get coverImageUrl => $composableBuilder(
      column: $table.coverImageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$UsersTableTableFilterComposer get ownerId {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ownerId,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableFilterComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> treeMembersTableRefs(
      Expression<bool> Function($$TreeMembersTableTableFilterComposer f) f) {
    final $$TreeMembersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.treeMembersTable,
        getReferencedColumn: (t) => t.treeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreeMembersTableTableFilterComposer(
              $db: $db,
              $table: $db.treeMembersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> personsTableRefs(
      Expression<bool> Function($$PersonsTableTableFilterComposer f) f) {
    final $$PersonsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.personsTable,
        getReferencedColumn: (t) => t.treeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableTableFilterComposer(
              $db: $db,
              $table: $db.personsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> relationshipsTableRefs(
      Expression<bool> Function($$RelationshipsTableTableFilterComposer f) f) {
    final $$RelationshipsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.relationshipsTable,
        getReferencedColumn: (t) => t.treeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RelationshipsTableTableFilterComposer(
              $db: $db,
              $table: $db.relationshipsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> eventsTableRefs(
      Expression<bool> Function($$EventsTableTableFilterComposer f) f) {
    final $$EventsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.eventsTable,
        getReferencedColumn: (t) => t.treeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EventsTableTableFilterComposer(
              $db: $db,
              $table: $db.eventsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> storiesTableRefs(
      Expression<bool> Function($$StoriesTableTableFilterComposer f) f) {
    final $$StoriesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.storiesTable,
        getReferencedColumn: (t) => t.treeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StoriesTableTableFilterComposer(
              $db: $db,
              $table: $db.storiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> mediaTableRefs(
      Expression<bool> Function($$MediaTableTableFilterComposer f) f) {
    final $$MediaTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mediaTable,
        getReferencedColumn: (t) => t.treeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MediaTableTableFilterComposer(
              $db: $db,
              $table: $db.mediaTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> syncOperationsTableRefs(
      Expression<bool> Function($$SyncOperationsTableTableFilterComposer f) f) {
    final $$SyncOperationsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.syncOperationsTable,
        getReferencedColumn: (t) => t.treeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SyncOperationsTableTableFilterComposer(
              $db: $db,
              $table: $db.syncOperationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TreesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TreesTableTable> {
  $$TreesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get visibility => $composableBuilder(
      column: $table.visibility, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get settings => $composableBuilder(
      column: $table.settings, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get coverImageUrl => $composableBuilder(
      column: $table.coverImageUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$UsersTableTableOrderingComposer get ownerId {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ownerId,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableOrderingComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TreesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TreesTableTable> {
  $$TreesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get visibility => $composableBuilder(
      column: $table.visibility, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String> get settings =>
      $composableBuilder(column: $table.settings, builder: (column) => column);

  GeneratedColumn<String> get coverImageUrl => $composableBuilder(
      column: $table.coverImageUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$UsersTableTableAnnotationComposer get ownerId {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ownerId,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> treeMembersTableRefs<T extends Object>(
      Expression<T> Function($$TreeMembersTableTableAnnotationComposer a) f) {
    final $$TreeMembersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.treeMembersTable,
        getReferencedColumn: (t) => t.treeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreeMembersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.treeMembersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> personsTableRefs<T extends Object>(
      Expression<T> Function($$PersonsTableTableAnnotationComposer a) f) {
    final $$PersonsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.personsTable,
        getReferencedColumn: (t) => t.treeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.personsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> relationshipsTableRefs<T extends Object>(
      Expression<T> Function($$RelationshipsTableTableAnnotationComposer a) f) {
    final $$RelationshipsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.relationshipsTable,
            getReferencedColumn: (t) => t.treeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RelationshipsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.relationshipsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> eventsTableRefs<T extends Object>(
      Expression<T> Function($$EventsTableTableAnnotationComposer a) f) {
    final $$EventsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.eventsTable,
        getReferencedColumn: (t) => t.treeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EventsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.eventsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> storiesTableRefs<T extends Object>(
      Expression<T> Function($$StoriesTableTableAnnotationComposer a) f) {
    final $$StoriesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.storiesTable,
        getReferencedColumn: (t) => t.treeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StoriesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.storiesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> mediaTableRefs<T extends Object>(
      Expression<T> Function($$MediaTableTableAnnotationComposer a) f) {
    final $$MediaTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mediaTable,
        getReferencedColumn: (t) => t.treeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MediaTableTableAnnotationComposer(
              $db: $db,
              $table: $db.mediaTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> syncOperationsTableRefs<T extends Object>(
      Expression<T> Function($$SyncOperationsTableTableAnnotationComposer a)
          f) {
    final $$SyncOperationsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.syncOperationsTable,
            getReferencedColumn: (t) => t.treeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$SyncOperationsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.syncOperationsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$TreesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TreesTableTable,
    TreeData,
    $$TreesTableTableFilterComposer,
    $$TreesTableTableOrderingComposer,
    $$TreesTableTableAnnotationComposer,
    $$TreesTableTableCreateCompanionBuilder,
    $$TreesTableTableUpdateCompanionBuilder,
    (TreeData, $$TreesTableTableReferences),
    TreeData,
    PrefetchHooks Function(
        {bool ownerId,
        bool treeMembersTableRefs,
        bool personsTableRefs,
        bool relationshipsTableRefs,
        bool eventsTableRefs,
        bool storiesTableRefs,
        bool mediaTableRefs,
        bool syncOperationsTableRefs})> {
  $$TreesTableTableTableManager(_$AppDatabase db, $TreesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TreesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TreesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TreesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> ownerId = const Value.absent(),
            Value<String> visibility = const Value.absent(),
            Value<Map<String, dynamic>> settings = const Value.absent(),
            Value<String?> coverImageUrl = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TreesTableCompanion(
            id: id,
            name: name,
            description: description,
            ownerId: ownerId,
            visibility: visibility,
            settings: settings,
            coverImageUrl: coverImageUrl,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> description = const Value.absent(),
            required String ownerId,
            Value<String> visibility = const Value.absent(),
            Value<Map<String, dynamic>> settings = const Value.absent(),
            Value<String?> coverImageUrl = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TreesTableCompanion.insert(
            id: id,
            name: name,
            description: description,
            ownerId: ownerId,
            visibility: visibility,
            settings: settings,
            coverImageUrl: coverImageUrl,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TreesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {ownerId = false,
              treeMembersTableRefs = false,
              personsTableRefs = false,
              relationshipsTableRefs = false,
              eventsTableRefs = false,
              storiesTableRefs = false,
              mediaTableRefs = false,
              syncOperationsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (treeMembersTableRefs) db.treeMembersTable,
                if (personsTableRefs) db.personsTable,
                if (relationshipsTableRefs) db.relationshipsTable,
                if (eventsTableRefs) db.eventsTable,
                if (storiesTableRefs) db.storiesTable,
                if (mediaTableRefs) db.mediaTable,
                if (syncOperationsTableRefs) db.syncOperationsTable
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (ownerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.ownerId,
                    referencedTable:
                        $$TreesTableTableReferences._ownerIdTable(db),
                    referencedColumn:
                        $$TreesTableTableReferences._ownerIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (treeMembersTableRefs)
                    await $_getPrefetchedData<TreeData, $TreesTableTable,
                            TreeMemberData>(
                        currentTable: table,
                        referencedTable: $$TreesTableTableReferences
                            ._treeMembersTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TreesTableTableReferences(db, table, p0)
                                .treeMembersTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.treeId == item.id),
                        typedResults: items),
                  if (personsTableRefs)
                    await $_getPrefetchedData<TreeData, $TreesTableTable,
                            PersonData>(
                        currentTable: table,
                        referencedTable: $$TreesTableTableReferences
                            ._personsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TreesTableTableReferences(db, table, p0)
                                .personsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.treeId == item.id),
                        typedResults: items),
                  if (relationshipsTableRefs)
                    await $_getPrefetchedData<TreeData, $TreesTableTable,
                            RelationshipData>(
                        currentTable: table,
                        referencedTable: $$TreesTableTableReferences
                            ._relationshipsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TreesTableTableReferences(db, table, p0)
                                .relationshipsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.treeId == item.id),
                        typedResults: items),
                  if (eventsTableRefs)
                    await $_getPrefetchedData<TreeData, $TreesTableTable,
                            EventData>(
                        currentTable: table,
                        referencedTable: $$TreesTableTableReferences
                            ._eventsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TreesTableTableReferences(db, table, p0)
                                .eventsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.treeId == item.id),
                        typedResults: items),
                  if (storiesTableRefs)
                    await $_getPrefetchedData<TreeData, $TreesTableTable,
                            StoryData>(
                        currentTable: table,
                        referencedTable: $$TreesTableTableReferences
                            ._storiesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TreesTableTableReferences(db, table, p0)
                                .storiesTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.treeId == item.id),
                        typedResults: items),
                  if (mediaTableRefs)
                    await $_getPrefetchedData<TreeData, $TreesTableTable,
                            MediaData>(
                        currentTable: table,
                        referencedTable: $$TreesTableTableReferences
                            ._mediaTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TreesTableTableReferences(db, table, p0)
                                .mediaTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.treeId == item.id),
                        typedResults: items),
                  if (syncOperationsTableRefs)
                    await $_getPrefetchedData<TreeData, $TreesTableTable,
                            SyncOperationData>(
                        currentTable: table,
                        referencedTable: $$TreesTableTableReferences
                            ._syncOperationsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TreesTableTableReferences(db, table, p0)
                                .syncOperationsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.treeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TreesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TreesTableTable,
    TreeData,
    $$TreesTableTableFilterComposer,
    $$TreesTableTableOrderingComposer,
    $$TreesTableTableAnnotationComposer,
    $$TreesTableTableCreateCompanionBuilder,
    $$TreesTableTableUpdateCompanionBuilder,
    (TreeData, $$TreesTableTableReferences),
    TreeData,
    PrefetchHooks Function(
        {bool ownerId,
        bool treeMembersTableRefs,
        bool personsTableRefs,
        bool relationshipsTableRefs,
        bool eventsTableRefs,
        bool storiesTableRefs,
        bool mediaTableRefs,
        bool syncOperationsTableRefs})>;
typedef $$TreeMembersTableTableCreateCompanionBuilder
    = TreeMembersTableCompanion Function({
  required String id,
  required String treeId,
  required String userId,
  required String role,
  required String invitedBy,
  required DateTime invitedAt,
  Value<DateTime?> acceptedAt,
  Value<Map<String, dynamic>> permissions,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$TreeMembersTableTableUpdateCompanionBuilder
    = TreeMembersTableCompanion Function({
  Value<String> id,
  Value<String> treeId,
  Value<String> userId,
  Value<String> role,
  Value<String> invitedBy,
  Value<DateTime> invitedAt,
  Value<DateTime?> acceptedAt,
  Value<Map<String, dynamic>> permissions,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$TreeMembersTableTableReferences extends BaseReferences<
    _$AppDatabase, $TreeMembersTableTable, TreeMemberData> {
  $$TreeMembersTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TreesTableTable _treeIdTable(_$AppDatabase db) =>
      db.treesTable.createAlias(
          $_aliasNameGenerator(db.treeMembersTable.treeId, db.treesTable.id));

  $$TreesTableTableProcessedTableManager get treeId {
    final $_column = $_itemColumn<String>('tree_id')!;

    final manager = $$TreesTableTableTableManager($_db, $_db.treesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_treeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTableTable _userIdTable(_$AppDatabase db) =>
      db.usersTable.createAlias(
          $_aliasNameGenerator(db.treeMembersTable.userId, db.usersTable.id));

  $$UsersTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableTableManager($_db, $_db.usersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTableTable _invitedByTable(_$AppDatabase db) =>
      db.usersTable.createAlias($_aliasNameGenerator(
          db.treeMembersTable.invitedBy, db.usersTable.id));

  $$UsersTableTableProcessedTableManager get invitedBy {
    final $_column = $_itemColumn<String>('invited_by')!;

    final manager = $$UsersTableTableTableManager($_db, $_db.usersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_invitedByTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TreeMembersTableTableFilterComposer
    extends Composer<_$AppDatabase, $TreeMembersTableTable> {
  $$TreeMembersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get invitedAt => $composableBuilder(
      column: $table.invitedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get acceptedAt => $composableBuilder(
      column: $table.acceptedAt, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get permissions => $composableBuilder(
          column: $table.permissions,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$TreesTableTableFilterComposer get treeId {
    final $$TreesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableFilterComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableFilterComposer get userId {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableFilterComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableFilterComposer get invitedBy {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.invitedBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableFilterComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TreeMembersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TreeMembersTableTable> {
  $$TreeMembersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get invitedAt => $composableBuilder(
      column: $table.invitedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get acceptedAt => $composableBuilder(
      column: $table.acceptedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get permissions => $composableBuilder(
      column: $table.permissions, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$TreesTableTableOrderingComposer get treeId {
    final $$TreesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableOrderingComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableOrderingComposer get userId {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableOrderingComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableOrderingComposer get invitedBy {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.invitedBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableOrderingComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TreeMembersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TreeMembersTableTable> {
  $$TreeMembersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<DateTime> get invitedAt =>
      $composableBuilder(column: $table.invitedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get acceptedAt => $composableBuilder(
      column: $table.acceptedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      get permissions => $composableBuilder(
          column: $table.permissions, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$TreesTableTableAnnotationComposer get treeId {
    final $$TreesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableAnnotationComposer get userId {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableAnnotationComposer get invitedBy {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.invitedBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TreeMembersTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TreeMembersTableTable,
    TreeMemberData,
    $$TreeMembersTableTableFilterComposer,
    $$TreeMembersTableTableOrderingComposer,
    $$TreeMembersTableTableAnnotationComposer,
    $$TreeMembersTableTableCreateCompanionBuilder,
    $$TreeMembersTableTableUpdateCompanionBuilder,
    (TreeMemberData, $$TreeMembersTableTableReferences),
    TreeMemberData,
    PrefetchHooks Function({bool treeId, bool userId, bool invitedBy})> {
  $$TreeMembersTableTableTableManager(
      _$AppDatabase db, $TreeMembersTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TreeMembersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TreeMembersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TreeMembersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> treeId = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<String> invitedBy = const Value.absent(),
            Value<DateTime> invitedAt = const Value.absent(),
            Value<DateTime?> acceptedAt = const Value.absent(),
            Value<Map<String, dynamic>> permissions = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TreeMembersTableCompanion(
            id: id,
            treeId: treeId,
            userId: userId,
            role: role,
            invitedBy: invitedBy,
            invitedAt: invitedAt,
            acceptedAt: acceptedAt,
            permissions: permissions,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String treeId,
            required String userId,
            required String role,
            required String invitedBy,
            required DateTime invitedAt,
            Value<DateTime?> acceptedAt = const Value.absent(),
            Value<Map<String, dynamic>> permissions = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              TreeMembersTableCompanion.insert(
            id: id,
            treeId: treeId,
            userId: userId,
            role: role,
            invitedBy: invitedBy,
            invitedAt: invitedAt,
            acceptedAt: acceptedAt,
            permissions: permissions,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TreeMembersTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {treeId = false, userId = false, invitedBy = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (treeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.treeId,
                    referencedTable:
                        $$TreeMembersTableTableReferences._treeIdTable(db),
                    referencedColumn:
                        $$TreeMembersTableTableReferences._treeIdTable(db).id,
                  ) as T;
                }
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable:
                        $$TreeMembersTableTableReferences._userIdTable(db),
                    referencedColumn:
                        $$TreeMembersTableTableReferences._userIdTable(db).id,
                  ) as T;
                }
                if (invitedBy) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.invitedBy,
                    referencedTable:
                        $$TreeMembersTableTableReferences._invitedByTable(db),
                    referencedColumn: $$TreeMembersTableTableReferences
                        ._invitedByTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TreeMembersTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TreeMembersTableTable,
    TreeMemberData,
    $$TreeMembersTableTableFilterComposer,
    $$TreeMembersTableTableOrderingComposer,
    $$TreeMembersTableTableAnnotationComposer,
    $$TreeMembersTableTableCreateCompanionBuilder,
    $$TreeMembersTableTableUpdateCompanionBuilder,
    (TreeMemberData, $$TreeMembersTableTableReferences),
    TreeMemberData,
    PrefetchHooks Function({bool treeId, bool userId, bool invitedBy})>;
typedef $$PersonsTableTableCreateCompanionBuilder = PersonsTableCompanion
    Function({
  required String id,
  required String treeId,
  required String firstName,
  Value<String?> middleName,
  Value<String?> lastName,
  Value<String?> maidenName,
  Value<List<String>> nicknames,
  Value<String?> suffix,
  Value<String?> prefix,
  Value<String?> gender,
  Value<DateTime?> dateOfBirth,
  Value<Map<String, dynamic>?> placeOfBirth,
  Value<DateTime?> dateOfDeath,
  Value<Map<String, dynamic>?> placeOfDeath,
  Value<bool> isLiving,
  Value<String?> biography,
  Value<List<String>> occupation,
  Value<List<String>> education,
  Value<String?> religion,
  Value<List<String>> ethnicity,
  Value<String?> email,
  Value<String?> phoneNumber,
  Value<Map<String, dynamic>?> address,
  Value<String> privacy,
  Value<String?> profilePictureId,
  Value<Map<String, dynamic>> customFields,
  required String createdBy,
  required String updatedBy,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<bool> syncPending,
  Value<int> rowid,
});
typedef $$PersonsTableTableUpdateCompanionBuilder = PersonsTableCompanion
    Function({
  Value<String> id,
  Value<String> treeId,
  Value<String> firstName,
  Value<String?> middleName,
  Value<String?> lastName,
  Value<String?> maidenName,
  Value<List<String>> nicknames,
  Value<String?> suffix,
  Value<String?> prefix,
  Value<String?> gender,
  Value<DateTime?> dateOfBirth,
  Value<Map<String, dynamic>?> placeOfBirth,
  Value<DateTime?> dateOfDeath,
  Value<Map<String, dynamic>?> placeOfDeath,
  Value<bool> isLiving,
  Value<String?> biography,
  Value<List<String>> occupation,
  Value<List<String>> education,
  Value<String?> religion,
  Value<List<String>> ethnicity,
  Value<String?> email,
  Value<String?> phoneNumber,
  Value<Map<String, dynamic>?> address,
  Value<String> privacy,
  Value<String?> profilePictureId,
  Value<Map<String, dynamic>> customFields,
  Value<String> createdBy,
  Value<String> updatedBy,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<bool> syncPending,
  Value<int> rowid,
});

final class $$PersonsTableTableReferences
    extends BaseReferences<_$AppDatabase, $PersonsTableTable, PersonData> {
  $$PersonsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TreesTableTable _treeIdTable(_$AppDatabase db) =>
      db.treesTable.createAlias(
          $_aliasNameGenerator(db.personsTable.treeId, db.treesTable.id));

  $$TreesTableTableProcessedTableManager get treeId {
    final $_column = $_itemColumn<String>('tree_id')!;

    final manager = $$TreesTableTableTableManager($_db, $_db.treesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_treeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTableTable _createdByTable(_$AppDatabase db) =>
      db.usersTable.createAlias(
          $_aliasNameGenerator(db.personsTable.createdBy, db.usersTable.id));

  $$UsersTableTableProcessedTableManager get createdBy {
    final $_column = $_itemColumn<String>('created_by')!;

    final manager = $$UsersTableTableTableManager($_db, $_db.usersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_createdByTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTableTable _updatedByTable(_$AppDatabase db) =>
      db.usersTable.createAlias(
          $_aliasNameGenerator(db.personsTable.updatedBy, db.usersTable.id));

  $$UsersTableTableProcessedTableManager get updatedBy {
    final $_column = $_itemColumn<String>('updated_by')!;

    final manager = $$UsersTableTableTableManager($_db, $_db.usersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_updatedByTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$EventsTableTable, List<EventData>>
      _eventsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.eventsTable,
              aliasName: $_aliasNameGenerator(
                  db.personsTable.id, db.eventsTable.primaryPersonId));

  $$EventsTableTableProcessedTableManager get eventsTableRefs {
    final manager = $$EventsTableTableTableManager($_db, $_db.eventsTable)
        .filter(
            (f) => f.primaryPersonId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MediaTableTable, List<MediaData>>
      _mediaTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.mediaTable,
          aliasName:
              $_aliasNameGenerator(db.personsTable.id, db.mediaTable.personId));

  $$MediaTableTableProcessedTableManager get mediaTableRefs {
    final manager = $$MediaTableTableTableManager($_db, $_db.mediaTable)
        .filter((f) => f.personId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mediaTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PersonsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PersonsTableTable> {
  $$PersonsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get middleName => $composableBuilder(
      column: $table.middleName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get maidenName => $composableBuilder(
      column: $table.maidenName, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get nicknames => $composableBuilder(
          column: $table.nicknames,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get suffix => $composableBuilder(
      column: $table.suffix, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get prefix => $composableBuilder(
      column: $table.prefix, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateOfBirth => $composableBuilder(
      column: $table.dateOfBirth, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>?, Map<String, dynamic>,
          String>
      get placeOfBirth => $composableBuilder(
          column: $table.placeOfBirth,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get dateOfDeath => $composableBuilder(
      column: $table.dateOfDeath, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>?, Map<String, dynamic>,
          String>
      get placeOfDeath => $composableBuilder(
          column: $table.placeOfDeath,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get isLiving => $composableBuilder(
      column: $table.isLiving, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get biography => $composableBuilder(
      column: $table.biography, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get occupation => $composableBuilder(
          column: $table.occupation,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get education => $composableBuilder(
          column: $table.education,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get religion => $composableBuilder(
      column: $table.religion, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get ethnicity => $composableBuilder(
          column: $table.ethnicity,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>?, Map<String, dynamic>,
          String>
      get address => $composableBuilder(
          column: $table.address,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get privacy => $composableBuilder(
      column: $table.privacy, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profilePictureId => $composableBuilder(
      column: $table.profilePictureId,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get customFields => $composableBuilder(
          column: $table.customFields,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get syncPending => $composableBuilder(
      column: $table.syncPending, builder: (column) => ColumnFilters(column));

  $$TreesTableTableFilterComposer get treeId {
    final $$TreesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableFilterComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableFilterComposer get createdBy {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableFilterComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableFilterComposer get updatedBy {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.updatedBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableFilterComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> eventsTableRefs(
      Expression<bool> Function($$EventsTableTableFilterComposer f) f) {
    final $$EventsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.eventsTable,
        getReferencedColumn: (t) => t.primaryPersonId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EventsTableTableFilterComposer(
              $db: $db,
              $table: $db.eventsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> mediaTableRefs(
      Expression<bool> Function($$MediaTableTableFilterComposer f) f) {
    final $$MediaTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mediaTable,
        getReferencedColumn: (t) => t.personId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MediaTableTableFilterComposer(
              $db: $db,
              $table: $db.mediaTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PersonsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PersonsTableTable> {
  $$PersonsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get middleName => $composableBuilder(
      column: $table.middleName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get maidenName => $composableBuilder(
      column: $table.maidenName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nicknames => $composableBuilder(
      column: $table.nicknames, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get suffix => $composableBuilder(
      column: $table.suffix, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get prefix => $composableBuilder(
      column: $table.prefix, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateOfBirth => $composableBuilder(
      column: $table.dateOfBirth, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get placeOfBirth => $composableBuilder(
      column: $table.placeOfBirth,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateOfDeath => $composableBuilder(
      column: $table.dateOfDeath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get placeOfDeath => $composableBuilder(
      column: $table.placeOfDeath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isLiving => $composableBuilder(
      column: $table.isLiving, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get biography => $composableBuilder(
      column: $table.biography, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get occupation => $composableBuilder(
      column: $table.occupation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get education => $composableBuilder(
      column: $table.education, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get religion => $composableBuilder(
      column: $table.religion, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ethnicity => $composableBuilder(
      column: $table.ethnicity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get privacy => $composableBuilder(
      column: $table.privacy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profilePictureId => $composableBuilder(
      column: $table.profilePictureId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customFields => $composableBuilder(
      column: $table.customFields,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get syncPending => $composableBuilder(
      column: $table.syncPending, builder: (column) => ColumnOrderings(column));

  $$TreesTableTableOrderingComposer get treeId {
    final $$TreesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableOrderingComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableOrderingComposer get createdBy {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableOrderingComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableOrderingComposer get updatedBy {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.updatedBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableOrderingComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PersonsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PersonsTableTable> {
  $$PersonsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get middleName => $composableBuilder(
      column: $table.middleName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get maidenName => $composableBuilder(
      column: $table.maidenName, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get nicknames =>
      $composableBuilder(column: $table.nicknames, builder: (column) => column);

  GeneratedColumn<String> get suffix =>
      $composableBuilder(column: $table.suffix, builder: (column) => column);

  GeneratedColumn<String> get prefix =>
      $composableBuilder(column: $table.prefix, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfBirth => $composableBuilder(
      column: $table.dateOfBirth, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      get placeOfBirth => $composableBuilder(
          column: $table.placeOfBirth, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfDeath => $composableBuilder(
      column: $table.dateOfDeath, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      get placeOfDeath => $composableBuilder(
          column: $table.placeOfDeath, builder: (column) => column);

  GeneratedColumn<bool> get isLiving =>
      $composableBuilder(column: $table.isLiving, builder: (column) => column);

  GeneratedColumn<String> get biography =>
      $composableBuilder(column: $table.biography, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get occupation =>
      $composableBuilder(
          column: $table.occupation, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get education =>
      $composableBuilder(column: $table.education, builder: (column) => column);

  GeneratedColumn<String> get religion =>
      $composableBuilder(column: $table.religion, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get ethnicity =>
      $composableBuilder(column: $table.ethnicity, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get privacy =>
      $composableBuilder(column: $table.privacy, builder: (column) => column);

  GeneratedColumn<String> get profilePictureId => $composableBuilder(
      column: $table.profilePictureId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      get customFields => $composableBuilder(
          column: $table.customFields, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<bool> get syncPending => $composableBuilder(
      column: $table.syncPending, builder: (column) => column);

  $$TreesTableTableAnnotationComposer get treeId {
    final $$TreesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableAnnotationComposer get createdBy {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableAnnotationComposer get updatedBy {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.updatedBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> eventsTableRefs<T extends Object>(
      Expression<T> Function($$EventsTableTableAnnotationComposer a) f) {
    final $$EventsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.eventsTable,
        getReferencedColumn: (t) => t.primaryPersonId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EventsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.eventsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> mediaTableRefs<T extends Object>(
      Expression<T> Function($$MediaTableTableAnnotationComposer a) f) {
    final $$MediaTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mediaTable,
        getReferencedColumn: (t) => t.personId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MediaTableTableAnnotationComposer(
              $db: $db,
              $table: $db.mediaTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PersonsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PersonsTableTable,
    PersonData,
    $$PersonsTableTableFilterComposer,
    $$PersonsTableTableOrderingComposer,
    $$PersonsTableTableAnnotationComposer,
    $$PersonsTableTableCreateCompanionBuilder,
    $$PersonsTableTableUpdateCompanionBuilder,
    (PersonData, $$PersonsTableTableReferences),
    PersonData,
    PrefetchHooks Function(
        {bool treeId,
        bool createdBy,
        bool updatedBy,
        bool eventsTableRefs,
        bool mediaTableRefs})> {
  $$PersonsTableTableTableManager(_$AppDatabase db, $PersonsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PersonsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PersonsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PersonsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> treeId = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String?> middleName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> maidenName = const Value.absent(),
            Value<List<String>> nicknames = const Value.absent(),
            Value<String?> suffix = const Value.absent(),
            Value<String?> prefix = const Value.absent(),
            Value<String?> gender = const Value.absent(),
            Value<DateTime?> dateOfBirth = const Value.absent(),
            Value<Map<String, dynamic>?> placeOfBirth = const Value.absent(),
            Value<DateTime?> dateOfDeath = const Value.absent(),
            Value<Map<String, dynamic>?> placeOfDeath = const Value.absent(),
            Value<bool> isLiving = const Value.absent(),
            Value<String?> biography = const Value.absent(),
            Value<List<String>> occupation = const Value.absent(),
            Value<List<String>> education = const Value.absent(),
            Value<String?> religion = const Value.absent(),
            Value<List<String>> ethnicity = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> phoneNumber = const Value.absent(),
            Value<Map<String, dynamic>?> address = const Value.absent(),
            Value<String> privacy = const Value.absent(),
            Value<String?> profilePictureId = const Value.absent(),
            Value<Map<String, dynamic>> customFields = const Value.absent(),
            Value<String> createdBy = const Value.absent(),
            Value<String> updatedBy = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<bool> syncPending = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PersonsTableCompanion(
            id: id,
            treeId: treeId,
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            maidenName: maidenName,
            nicknames: nicknames,
            suffix: suffix,
            prefix: prefix,
            gender: gender,
            dateOfBirth: dateOfBirth,
            placeOfBirth: placeOfBirth,
            dateOfDeath: dateOfDeath,
            placeOfDeath: placeOfDeath,
            isLiving: isLiving,
            biography: biography,
            occupation: occupation,
            education: education,
            religion: religion,
            ethnicity: ethnicity,
            email: email,
            phoneNumber: phoneNumber,
            address: address,
            privacy: privacy,
            profilePictureId: profilePictureId,
            customFields: customFields,
            createdBy: createdBy,
            updatedBy: updatedBy,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            syncPending: syncPending,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String treeId,
            required String firstName,
            Value<String?> middleName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> maidenName = const Value.absent(),
            Value<List<String>> nicknames = const Value.absent(),
            Value<String?> suffix = const Value.absent(),
            Value<String?> prefix = const Value.absent(),
            Value<String?> gender = const Value.absent(),
            Value<DateTime?> dateOfBirth = const Value.absent(),
            Value<Map<String, dynamic>?> placeOfBirth = const Value.absent(),
            Value<DateTime?> dateOfDeath = const Value.absent(),
            Value<Map<String, dynamic>?> placeOfDeath = const Value.absent(),
            Value<bool> isLiving = const Value.absent(),
            Value<String?> biography = const Value.absent(),
            Value<List<String>> occupation = const Value.absent(),
            Value<List<String>> education = const Value.absent(),
            Value<String?> religion = const Value.absent(),
            Value<List<String>> ethnicity = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> phoneNumber = const Value.absent(),
            Value<Map<String, dynamic>?> address = const Value.absent(),
            Value<String> privacy = const Value.absent(),
            Value<String?> profilePictureId = const Value.absent(),
            Value<Map<String, dynamic>> customFields = const Value.absent(),
            required String createdBy,
            required String updatedBy,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<bool> syncPending = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PersonsTableCompanion.insert(
            id: id,
            treeId: treeId,
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            maidenName: maidenName,
            nicknames: nicknames,
            suffix: suffix,
            prefix: prefix,
            gender: gender,
            dateOfBirth: dateOfBirth,
            placeOfBirth: placeOfBirth,
            dateOfDeath: dateOfDeath,
            placeOfDeath: placeOfDeath,
            isLiving: isLiving,
            biography: biography,
            occupation: occupation,
            education: education,
            religion: religion,
            ethnicity: ethnicity,
            email: email,
            phoneNumber: phoneNumber,
            address: address,
            privacy: privacy,
            profilePictureId: profilePictureId,
            customFields: customFields,
            createdBy: createdBy,
            updatedBy: updatedBy,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            syncPending: syncPending,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PersonsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {treeId = false,
              createdBy = false,
              updatedBy = false,
              eventsTableRefs = false,
              mediaTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (eventsTableRefs) db.eventsTable,
                if (mediaTableRefs) db.mediaTable
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (treeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.treeId,
                    referencedTable:
                        $$PersonsTableTableReferences._treeIdTable(db),
                    referencedColumn:
                        $$PersonsTableTableReferences._treeIdTable(db).id,
                  ) as T;
                }
                if (createdBy) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.createdBy,
                    referencedTable:
                        $$PersonsTableTableReferences._createdByTable(db),
                    referencedColumn:
                        $$PersonsTableTableReferences._createdByTable(db).id,
                  ) as T;
                }
                if (updatedBy) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.updatedBy,
                    referencedTable:
                        $$PersonsTableTableReferences._updatedByTable(db),
                    referencedColumn:
                        $$PersonsTableTableReferences._updatedByTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventsTableRefs)
                    await $_getPrefetchedData<PersonData, $PersonsTableTable,
                            EventData>(
                        currentTable: table,
                        referencedTable: $$PersonsTableTableReferences
                            ._eventsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PersonsTableTableReferences(db, table, p0)
                                .eventsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.primaryPersonId == item.id),
                        typedResults: items),
                  if (mediaTableRefs)
                    await $_getPrefetchedData<PersonData, $PersonsTableTable,
                            MediaData>(
                        currentTable: table,
                        referencedTable: $$PersonsTableTableReferences
                            ._mediaTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PersonsTableTableReferences(db, table, p0)
                                .mediaTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.personId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PersonsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PersonsTableTable,
    PersonData,
    $$PersonsTableTableFilterComposer,
    $$PersonsTableTableOrderingComposer,
    $$PersonsTableTableAnnotationComposer,
    $$PersonsTableTableCreateCompanionBuilder,
    $$PersonsTableTableUpdateCompanionBuilder,
    (PersonData, $$PersonsTableTableReferences),
    PersonData,
    PrefetchHooks Function(
        {bool treeId,
        bool createdBy,
        bool updatedBy,
        bool eventsTableRefs,
        bool mediaTableRefs})>;
typedef $$RelationshipsTableTableCreateCompanionBuilder
    = RelationshipsTableCompanion Function({
  required String id,
  required String treeId,
  required String type,
  required String person1Id,
  required String person2Id,
  Value<DateTime?> startDate,
  Value<DateTime?> endDate,
  Value<Map<String, dynamic>?> place,
  Value<String?> status,
  Value<String?> notes,
  Value<Map<String, dynamic>> customFields,
  required String createdBy,
  required String updatedBy,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<bool> syncPending,
  Value<int> rowid,
});
typedef $$RelationshipsTableTableUpdateCompanionBuilder
    = RelationshipsTableCompanion Function({
  Value<String> id,
  Value<String> treeId,
  Value<String> type,
  Value<String> person1Id,
  Value<String> person2Id,
  Value<DateTime?> startDate,
  Value<DateTime?> endDate,
  Value<Map<String, dynamic>?> place,
  Value<String?> status,
  Value<String?> notes,
  Value<Map<String, dynamic>> customFields,
  Value<String> createdBy,
  Value<String> updatedBy,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<bool> syncPending,
  Value<int> rowid,
});

final class $$RelationshipsTableTableReferences extends BaseReferences<
    _$AppDatabase, $RelationshipsTableTable, RelationshipData> {
  $$RelationshipsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TreesTableTable _treeIdTable(_$AppDatabase db) =>
      db.treesTable.createAlias(
          $_aliasNameGenerator(db.relationshipsTable.treeId, db.treesTable.id));

  $$TreesTableTableProcessedTableManager get treeId {
    final $_column = $_itemColumn<String>('tree_id')!;

    final manager = $$TreesTableTableTableManager($_db, $_db.treesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_treeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PersonsTableTable _person1IdTable(_$AppDatabase db) =>
      db.personsTable.createAlias($_aliasNameGenerator(
          db.relationshipsTable.person1Id, db.personsTable.id));

  $$PersonsTableTableProcessedTableManager get person1Id {
    final $_column = $_itemColumn<String>('person1_id')!;

    final manager = $$PersonsTableTableTableManager($_db, $_db.personsTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_person1IdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PersonsTableTable _person2IdTable(_$AppDatabase db) =>
      db.personsTable.createAlias($_aliasNameGenerator(
          db.relationshipsTable.person2Id, db.personsTable.id));

  $$PersonsTableTableProcessedTableManager get person2Id {
    final $_column = $_itemColumn<String>('person2_id')!;

    final manager = $$PersonsTableTableTableManager($_db, $_db.personsTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_person2IdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTableTable _createdByTable(_$AppDatabase db) =>
      db.usersTable.createAlias($_aliasNameGenerator(
          db.relationshipsTable.createdBy, db.usersTable.id));

  $$UsersTableTableProcessedTableManager get createdBy {
    final $_column = $_itemColumn<String>('created_by')!;

    final manager = $$UsersTableTableTableManager($_db, $_db.usersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_createdByTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTableTable _updatedByTable(_$AppDatabase db) =>
      db.usersTable.createAlias($_aliasNameGenerator(
          db.relationshipsTable.updatedBy, db.usersTable.id));

  $$UsersTableTableProcessedTableManager get updatedBy {
    final $_column = $_itemColumn<String>('updated_by')!;

    final manager = $$UsersTableTableTableManager($_db, $_db.usersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_updatedByTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RelationshipsTableTableFilterComposer
    extends Composer<_$AppDatabase, $RelationshipsTableTable> {
  $$RelationshipsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>?, Map<String, dynamic>,
          String>
      get place => $composableBuilder(
          column: $table.place,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get customFields => $composableBuilder(
          column: $table.customFields,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get syncPending => $composableBuilder(
      column: $table.syncPending, builder: (column) => ColumnFilters(column));

  $$TreesTableTableFilterComposer get treeId {
    final $$TreesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableFilterComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PersonsTableTableFilterComposer get person1Id {
    final $$PersonsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.person1Id,
        referencedTable: $db.personsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableTableFilterComposer(
              $db: $db,
              $table: $db.personsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PersonsTableTableFilterComposer get person2Id {
    final $$PersonsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.person2Id,
        referencedTable: $db.personsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableTableFilterComposer(
              $db: $db,
              $table: $db.personsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableFilterComposer get createdBy {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableFilterComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableFilterComposer get updatedBy {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.updatedBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableFilterComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RelationshipsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RelationshipsTableTable> {
  $$RelationshipsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get place => $composableBuilder(
      column: $table.place, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customFields => $composableBuilder(
      column: $table.customFields,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get syncPending => $composableBuilder(
      column: $table.syncPending, builder: (column) => ColumnOrderings(column));

  $$TreesTableTableOrderingComposer get treeId {
    final $$TreesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableOrderingComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PersonsTableTableOrderingComposer get person1Id {
    final $$PersonsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.person1Id,
        referencedTable: $db.personsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableTableOrderingComposer(
              $db: $db,
              $table: $db.personsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PersonsTableTableOrderingComposer get person2Id {
    final $$PersonsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.person2Id,
        referencedTable: $db.personsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableTableOrderingComposer(
              $db: $db,
              $table: $db.personsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableOrderingComposer get createdBy {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableOrderingComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableOrderingComposer get updatedBy {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.updatedBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableOrderingComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RelationshipsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RelationshipsTableTable> {
  $$RelationshipsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String> get place =>
      $composableBuilder(column: $table.place, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      get customFields => $composableBuilder(
          column: $table.customFields, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<bool> get syncPending => $composableBuilder(
      column: $table.syncPending, builder: (column) => column);

  $$TreesTableTableAnnotationComposer get treeId {
    final $$TreesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PersonsTableTableAnnotationComposer get person1Id {
    final $$PersonsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.person1Id,
        referencedTable: $db.personsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.personsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PersonsTableTableAnnotationComposer get person2Id {
    final $$PersonsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.person2Id,
        referencedTable: $db.personsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.personsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableAnnotationComposer get createdBy {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableAnnotationComposer get updatedBy {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.updatedBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RelationshipsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RelationshipsTableTable,
    RelationshipData,
    $$RelationshipsTableTableFilterComposer,
    $$RelationshipsTableTableOrderingComposer,
    $$RelationshipsTableTableAnnotationComposer,
    $$RelationshipsTableTableCreateCompanionBuilder,
    $$RelationshipsTableTableUpdateCompanionBuilder,
    (RelationshipData, $$RelationshipsTableTableReferences),
    RelationshipData,
    PrefetchHooks Function(
        {bool treeId,
        bool person1Id,
        bool person2Id,
        bool createdBy,
        bool updatedBy})> {
  $$RelationshipsTableTableTableManager(
      _$AppDatabase db, $RelationshipsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RelationshipsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RelationshipsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RelationshipsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> treeId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> person1Id = const Value.absent(),
            Value<String> person2Id = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<Map<String, dynamic>?> place = const Value.absent(),
            Value<String?> status = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<Map<String, dynamic>> customFields = const Value.absent(),
            Value<String> createdBy = const Value.absent(),
            Value<String> updatedBy = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<bool> syncPending = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RelationshipsTableCompanion(
            id: id,
            treeId: treeId,
            type: type,
            person1Id: person1Id,
            person2Id: person2Id,
            startDate: startDate,
            endDate: endDate,
            place: place,
            status: status,
            notes: notes,
            customFields: customFields,
            createdBy: createdBy,
            updatedBy: updatedBy,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            syncPending: syncPending,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String treeId,
            required String type,
            required String person1Id,
            required String person2Id,
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<Map<String, dynamic>?> place = const Value.absent(),
            Value<String?> status = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<Map<String, dynamic>> customFields = const Value.absent(),
            required String createdBy,
            required String updatedBy,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<bool> syncPending = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RelationshipsTableCompanion.insert(
            id: id,
            treeId: treeId,
            type: type,
            person1Id: person1Id,
            person2Id: person2Id,
            startDate: startDate,
            endDate: endDate,
            place: place,
            status: status,
            notes: notes,
            customFields: customFields,
            createdBy: createdBy,
            updatedBy: updatedBy,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            syncPending: syncPending,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RelationshipsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {treeId = false,
              person1Id = false,
              person2Id = false,
              createdBy = false,
              updatedBy = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (treeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.treeId,
                    referencedTable:
                        $$RelationshipsTableTableReferences._treeIdTable(db),
                    referencedColumn:
                        $$RelationshipsTableTableReferences._treeIdTable(db).id,
                  ) as T;
                }
                if (person1Id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.person1Id,
                    referencedTable:
                        $$RelationshipsTableTableReferences._person1IdTable(db),
                    referencedColumn: $$RelationshipsTableTableReferences
                        ._person1IdTable(db)
                        .id,
                  ) as T;
                }
                if (person2Id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.person2Id,
                    referencedTable:
                        $$RelationshipsTableTableReferences._person2IdTable(db),
                    referencedColumn: $$RelationshipsTableTableReferences
                        ._person2IdTable(db)
                        .id,
                  ) as T;
                }
                if (createdBy) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.createdBy,
                    referencedTable:
                        $$RelationshipsTableTableReferences._createdByTable(db),
                    referencedColumn: $$RelationshipsTableTableReferences
                        ._createdByTable(db)
                        .id,
                  ) as T;
                }
                if (updatedBy) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.updatedBy,
                    referencedTable:
                        $$RelationshipsTableTableReferences._updatedByTable(db),
                    referencedColumn: $$RelationshipsTableTableReferences
                        ._updatedByTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$RelationshipsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RelationshipsTableTable,
    RelationshipData,
    $$RelationshipsTableTableFilterComposer,
    $$RelationshipsTableTableOrderingComposer,
    $$RelationshipsTableTableAnnotationComposer,
    $$RelationshipsTableTableCreateCompanionBuilder,
    $$RelationshipsTableTableUpdateCompanionBuilder,
    (RelationshipData, $$RelationshipsTableTableReferences),
    RelationshipData,
    PrefetchHooks Function(
        {bool treeId,
        bool person1Id,
        bool person2Id,
        bool createdBy,
        bool updatedBy})>;
typedef $$EventsTableTableCreateCompanionBuilder = EventsTableCompanion
    Function({
  required String id,
  required String treeId,
  required String type,
  required String title,
  Value<String?> description,
  Value<DateTime?> date,
  Value<String> dateAccuracy,
  Value<DateTime?> endDate,
  Value<Map<String, dynamic>?> place,
  required String primaryPersonId,
  Value<List<String>> otherPersonIds,
  Value<List<String>> mediaIds,
  Value<Map<String, dynamic>> sources,
  required String createdBy,
  required String updatedBy,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<bool> syncPending,
  Value<int> rowid,
});
typedef $$EventsTableTableUpdateCompanionBuilder = EventsTableCompanion
    Function({
  Value<String> id,
  Value<String> treeId,
  Value<String> type,
  Value<String> title,
  Value<String?> description,
  Value<DateTime?> date,
  Value<String> dateAccuracy,
  Value<DateTime?> endDate,
  Value<Map<String, dynamic>?> place,
  Value<String> primaryPersonId,
  Value<List<String>> otherPersonIds,
  Value<List<String>> mediaIds,
  Value<Map<String, dynamic>> sources,
  Value<String> createdBy,
  Value<String> updatedBy,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<bool> syncPending,
  Value<int> rowid,
});

final class $$EventsTableTableReferences
    extends BaseReferences<_$AppDatabase, $EventsTableTable, EventData> {
  $$EventsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TreesTableTable _treeIdTable(_$AppDatabase db) =>
      db.treesTable.createAlias(
          $_aliasNameGenerator(db.eventsTable.treeId, db.treesTable.id));

  $$TreesTableTableProcessedTableManager get treeId {
    final $_column = $_itemColumn<String>('tree_id')!;

    final manager = $$TreesTableTableTableManager($_db, $_db.treesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_treeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PersonsTableTable _primaryPersonIdTable(_$AppDatabase db) =>
      db.personsTable.createAlias($_aliasNameGenerator(
          db.eventsTable.primaryPersonId, db.personsTable.id));

  $$PersonsTableTableProcessedTableManager get primaryPersonId {
    final $_column = $_itemColumn<String>('primary_person_id')!;

    final manager = $$PersonsTableTableTableManager($_db, $_db.personsTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_primaryPersonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTableTable _createdByTable(_$AppDatabase db) =>
      db.usersTable.createAlias(
          $_aliasNameGenerator(db.eventsTable.createdBy, db.usersTable.id));

  $$UsersTableTableProcessedTableManager get createdBy {
    final $_column = $_itemColumn<String>('created_by')!;

    final manager = $$UsersTableTableTableManager($_db, $_db.usersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_createdByTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTableTable _updatedByTable(_$AppDatabase db) =>
      db.usersTable.createAlias(
          $_aliasNameGenerator(db.eventsTable.updatedBy, db.usersTable.id));

  $$UsersTableTableProcessedTableManager get updatedBy {
    final $_column = $_itemColumn<String>('updated_by')!;

    final manager = $$UsersTableTableTableManager($_db, $_db.usersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_updatedByTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$EventsTableTableFilterComposer
    extends Composer<_$AppDatabase, $EventsTableTable> {
  $$EventsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dateAccuracy => $composableBuilder(
      column: $table.dateAccuracy, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>?, Map<String, dynamic>,
          String>
      get place => $composableBuilder(
          column: $table.place,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get otherPersonIds => $composableBuilder(
          column: $table.otherPersonIds,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get mediaIds => $composableBuilder(
          column: $table.mediaIds,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get sources => $composableBuilder(
          column: $table.sources,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get syncPending => $composableBuilder(
      column: $table.syncPending, builder: (column) => ColumnFilters(column));

  $$TreesTableTableFilterComposer get treeId {
    final $$TreesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableFilterComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PersonsTableTableFilterComposer get primaryPersonId {
    final $$PersonsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.primaryPersonId,
        referencedTable: $db.personsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableTableFilterComposer(
              $db: $db,
              $table: $db.personsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableFilterComposer get createdBy {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableFilterComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableFilterComposer get updatedBy {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.updatedBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableFilterComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EventsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $EventsTableTable> {
  $$EventsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dateAccuracy => $composableBuilder(
      column: $table.dateAccuracy,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get place => $composableBuilder(
      column: $table.place, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get otherPersonIds => $composableBuilder(
      column: $table.otherPersonIds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaIds => $composableBuilder(
      column: $table.mediaIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sources => $composableBuilder(
      column: $table.sources, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get syncPending => $composableBuilder(
      column: $table.syncPending, builder: (column) => ColumnOrderings(column));

  $$TreesTableTableOrderingComposer get treeId {
    final $$TreesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableOrderingComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PersonsTableTableOrderingComposer get primaryPersonId {
    final $$PersonsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.primaryPersonId,
        referencedTable: $db.personsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableTableOrderingComposer(
              $db: $db,
              $table: $db.personsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableOrderingComposer get createdBy {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableOrderingComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableOrderingComposer get updatedBy {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.updatedBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableOrderingComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EventsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventsTableTable> {
  $$EventsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get dateAccuracy => $composableBuilder(
      column: $table.dateAccuracy, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String> get place =>
      $composableBuilder(column: $table.place, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get otherPersonIds =>
      $composableBuilder(
          column: $table.otherPersonIds, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get mediaIds =>
      $composableBuilder(column: $table.mediaIds, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String> get sources =>
      $composableBuilder(column: $table.sources, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<bool> get syncPending => $composableBuilder(
      column: $table.syncPending, builder: (column) => column);

  $$TreesTableTableAnnotationComposer get treeId {
    final $$TreesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PersonsTableTableAnnotationComposer get primaryPersonId {
    final $$PersonsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.primaryPersonId,
        referencedTable: $db.personsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.personsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableAnnotationComposer get createdBy {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableAnnotationComposer get updatedBy {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.updatedBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EventsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EventsTableTable,
    EventData,
    $$EventsTableTableFilterComposer,
    $$EventsTableTableOrderingComposer,
    $$EventsTableTableAnnotationComposer,
    $$EventsTableTableCreateCompanionBuilder,
    $$EventsTableTableUpdateCompanionBuilder,
    (EventData, $$EventsTableTableReferences),
    EventData,
    PrefetchHooks Function(
        {bool treeId, bool primaryPersonId, bool createdBy, bool updatedBy})> {
  $$EventsTableTableTableManager(_$AppDatabase db, $EventsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> treeId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime?> date = const Value.absent(),
            Value<String> dateAccuracy = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<Map<String, dynamic>?> place = const Value.absent(),
            Value<String> primaryPersonId = const Value.absent(),
            Value<List<String>> otherPersonIds = const Value.absent(),
            Value<List<String>> mediaIds = const Value.absent(),
            Value<Map<String, dynamic>> sources = const Value.absent(),
            Value<String> createdBy = const Value.absent(),
            Value<String> updatedBy = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<bool> syncPending = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EventsTableCompanion(
            id: id,
            treeId: treeId,
            type: type,
            title: title,
            description: description,
            date: date,
            dateAccuracy: dateAccuracy,
            endDate: endDate,
            place: place,
            primaryPersonId: primaryPersonId,
            otherPersonIds: otherPersonIds,
            mediaIds: mediaIds,
            sources: sources,
            createdBy: createdBy,
            updatedBy: updatedBy,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            syncPending: syncPending,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String treeId,
            required String type,
            required String title,
            Value<String?> description = const Value.absent(),
            Value<DateTime?> date = const Value.absent(),
            Value<String> dateAccuracy = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<Map<String, dynamic>?> place = const Value.absent(),
            required String primaryPersonId,
            Value<List<String>> otherPersonIds = const Value.absent(),
            Value<List<String>> mediaIds = const Value.absent(),
            Value<Map<String, dynamic>> sources = const Value.absent(),
            required String createdBy,
            required String updatedBy,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<bool> syncPending = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EventsTableCompanion.insert(
            id: id,
            treeId: treeId,
            type: type,
            title: title,
            description: description,
            date: date,
            dateAccuracy: dateAccuracy,
            endDate: endDate,
            place: place,
            primaryPersonId: primaryPersonId,
            otherPersonIds: otherPersonIds,
            mediaIds: mediaIds,
            sources: sources,
            createdBy: createdBy,
            updatedBy: updatedBy,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            syncPending: syncPending,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$EventsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {treeId = false,
              primaryPersonId = false,
              createdBy = false,
              updatedBy = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (treeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.treeId,
                    referencedTable:
                        $$EventsTableTableReferences._treeIdTable(db),
                    referencedColumn:
                        $$EventsTableTableReferences._treeIdTable(db).id,
                  ) as T;
                }
                if (primaryPersonId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.primaryPersonId,
                    referencedTable:
                        $$EventsTableTableReferences._primaryPersonIdTable(db),
                    referencedColumn: $$EventsTableTableReferences
                        ._primaryPersonIdTable(db)
                        .id,
                  ) as T;
                }
                if (createdBy) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.createdBy,
                    referencedTable:
                        $$EventsTableTableReferences._createdByTable(db),
                    referencedColumn:
                        $$EventsTableTableReferences._createdByTable(db).id,
                  ) as T;
                }
                if (updatedBy) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.updatedBy,
                    referencedTable:
                        $$EventsTableTableReferences._updatedByTable(db),
                    referencedColumn:
                        $$EventsTableTableReferences._updatedByTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$EventsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $EventsTableTable,
    EventData,
    $$EventsTableTableFilterComposer,
    $$EventsTableTableOrderingComposer,
    $$EventsTableTableAnnotationComposer,
    $$EventsTableTableCreateCompanionBuilder,
    $$EventsTableTableUpdateCompanionBuilder,
    (EventData, $$EventsTableTableReferences),
    EventData,
    PrefetchHooks Function(
        {bool treeId, bool primaryPersonId, bool createdBy, bool updatedBy})>;
typedef $$StoriesTableTableCreateCompanionBuilder = StoriesTableCompanion
    Function({
  required String id,
  required String treeId,
  required String title,
  required String content,
  required String authorId,
  Value<List<String>> relatedPersonIds,
  Value<String?> coverImageId,
  Value<List<String>> mediaIds,
  Value<String> status,
  Value<DateTime?> publishedAt,
  Value<String> privacy,
  Value<int> viewCount,
  Value<int> likeCount,
  Value<Map<String, dynamic>?> metadata,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<bool> syncPending,
  Value<int> rowid,
});
typedef $$StoriesTableTableUpdateCompanionBuilder = StoriesTableCompanion
    Function({
  Value<String> id,
  Value<String> treeId,
  Value<String> title,
  Value<String> content,
  Value<String> authorId,
  Value<List<String>> relatedPersonIds,
  Value<String?> coverImageId,
  Value<List<String>> mediaIds,
  Value<String> status,
  Value<DateTime?> publishedAt,
  Value<String> privacy,
  Value<int> viewCount,
  Value<int> likeCount,
  Value<Map<String, dynamic>?> metadata,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<bool> syncPending,
  Value<int> rowid,
});

final class $$StoriesTableTableReferences
    extends BaseReferences<_$AppDatabase, $StoriesTableTable, StoryData> {
  $$StoriesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TreesTableTable _treeIdTable(_$AppDatabase db) =>
      db.treesTable.createAlias(
          $_aliasNameGenerator(db.storiesTable.treeId, db.treesTable.id));

  $$TreesTableTableProcessedTableManager get treeId {
    final $_column = $_itemColumn<String>('tree_id')!;

    final manager = $$TreesTableTableTableManager($_db, $_db.treesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_treeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTableTable _authorIdTable(_$AppDatabase db) =>
      db.usersTable.createAlias(
          $_aliasNameGenerator(db.storiesTable.authorId, db.usersTable.id));

  $$UsersTableTableProcessedTableManager get authorId {
    final $_column = $_itemColumn<String>('author_id')!;

    final manager = $$UsersTableTableTableManager($_db, $_db.usersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_authorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$StoriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $StoriesTableTable> {
  $$StoriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get relatedPersonIds => $composableBuilder(
          column: $table.relatedPersonIds,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get coverImageId => $composableBuilder(
      column: $table.coverImageId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get mediaIds => $composableBuilder(
          column: $table.mediaIds,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get publishedAt => $composableBuilder(
      column: $table.publishedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get privacy => $composableBuilder(
      column: $table.privacy, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get viewCount => $composableBuilder(
      column: $table.viewCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get likeCount => $composableBuilder(
      column: $table.likeCount, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>?, Map<String, dynamic>,
          String>
      get metadata => $composableBuilder(
          column: $table.metadata,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get syncPending => $composableBuilder(
      column: $table.syncPending, builder: (column) => ColumnFilters(column));

  $$TreesTableTableFilterComposer get treeId {
    final $$TreesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableFilterComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableFilterComposer get authorId {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.authorId,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableFilterComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StoriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $StoriesTableTable> {
  $$StoriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get relatedPersonIds => $composableBuilder(
      column: $table.relatedPersonIds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get coverImageId => $composableBuilder(
      column: $table.coverImageId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaIds => $composableBuilder(
      column: $table.mediaIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get publishedAt => $composableBuilder(
      column: $table.publishedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get privacy => $composableBuilder(
      column: $table.privacy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get viewCount => $composableBuilder(
      column: $table.viewCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get likeCount => $composableBuilder(
      column: $table.likeCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get metadata => $composableBuilder(
      column: $table.metadata, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get syncPending => $composableBuilder(
      column: $table.syncPending, builder: (column) => ColumnOrderings(column));

  $$TreesTableTableOrderingComposer get treeId {
    final $$TreesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableOrderingComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableOrderingComposer get authorId {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.authorId,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableOrderingComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StoriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $StoriesTableTable> {
  $$StoriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get relatedPersonIds =>
      $composableBuilder(
          column: $table.relatedPersonIds, builder: (column) => column);

  GeneratedColumn<String> get coverImageId => $composableBuilder(
      column: $table.coverImageId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get mediaIds =>
      $composableBuilder(column: $table.mediaIds, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get publishedAt => $composableBuilder(
      column: $table.publishedAt, builder: (column) => column);

  GeneratedColumn<String> get privacy =>
      $composableBuilder(column: $table.privacy, builder: (column) => column);

  GeneratedColumn<int> get viewCount =>
      $composableBuilder(column: $table.viewCount, builder: (column) => column);

  GeneratedColumn<int> get likeCount =>
      $composableBuilder(column: $table.likeCount, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      get metadata => $composableBuilder(
          column: $table.metadata, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<bool> get syncPending => $composableBuilder(
      column: $table.syncPending, builder: (column) => column);

  $$TreesTableTableAnnotationComposer get treeId {
    final $$TreesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableAnnotationComposer get authorId {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.authorId,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StoriesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StoriesTableTable,
    StoryData,
    $$StoriesTableTableFilterComposer,
    $$StoriesTableTableOrderingComposer,
    $$StoriesTableTableAnnotationComposer,
    $$StoriesTableTableCreateCompanionBuilder,
    $$StoriesTableTableUpdateCompanionBuilder,
    (StoryData, $$StoriesTableTableReferences),
    StoryData,
    PrefetchHooks Function({bool treeId, bool authorId})> {
  $$StoriesTableTableTableManager(_$AppDatabase db, $StoriesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StoriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StoriesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StoriesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> treeId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<String> authorId = const Value.absent(),
            Value<List<String>> relatedPersonIds = const Value.absent(),
            Value<String?> coverImageId = const Value.absent(),
            Value<List<String>> mediaIds = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime?> publishedAt = const Value.absent(),
            Value<String> privacy = const Value.absent(),
            Value<int> viewCount = const Value.absent(),
            Value<int> likeCount = const Value.absent(),
            Value<Map<String, dynamic>?> metadata = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<bool> syncPending = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StoriesTableCompanion(
            id: id,
            treeId: treeId,
            title: title,
            content: content,
            authorId: authorId,
            relatedPersonIds: relatedPersonIds,
            coverImageId: coverImageId,
            mediaIds: mediaIds,
            status: status,
            publishedAt: publishedAt,
            privacy: privacy,
            viewCount: viewCount,
            likeCount: likeCount,
            metadata: metadata,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            syncPending: syncPending,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String treeId,
            required String title,
            required String content,
            required String authorId,
            Value<List<String>> relatedPersonIds = const Value.absent(),
            Value<String?> coverImageId = const Value.absent(),
            Value<List<String>> mediaIds = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime?> publishedAt = const Value.absent(),
            Value<String> privacy = const Value.absent(),
            Value<int> viewCount = const Value.absent(),
            Value<int> likeCount = const Value.absent(),
            Value<Map<String, dynamic>?> metadata = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<bool> syncPending = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StoriesTableCompanion.insert(
            id: id,
            treeId: treeId,
            title: title,
            content: content,
            authorId: authorId,
            relatedPersonIds: relatedPersonIds,
            coverImageId: coverImageId,
            mediaIds: mediaIds,
            status: status,
            publishedAt: publishedAt,
            privacy: privacy,
            viewCount: viewCount,
            likeCount: likeCount,
            metadata: metadata,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            syncPending: syncPending,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$StoriesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({treeId = false, authorId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (treeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.treeId,
                    referencedTable:
                        $$StoriesTableTableReferences._treeIdTable(db),
                    referencedColumn:
                        $$StoriesTableTableReferences._treeIdTable(db).id,
                  ) as T;
                }
                if (authorId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.authorId,
                    referencedTable:
                        $$StoriesTableTableReferences._authorIdTable(db),
                    referencedColumn:
                        $$StoriesTableTableReferences._authorIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$StoriesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StoriesTableTable,
    StoryData,
    $$StoriesTableTableFilterComposer,
    $$StoriesTableTableOrderingComposer,
    $$StoriesTableTableAnnotationComposer,
    $$StoriesTableTableCreateCompanionBuilder,
    $$StoriesTableTableUpdateCompanionBuilder,
    (StoryData, $$StoriesTableTableReferences),
    StoryData,
    PrefetchHooks Function({bool treeId, bool authorId})>;
typedef $$MediaTableTableCreateCompanionBuilder = MediaTableCompanion Function({
  required String id,
  required String treeId,
  Value<String?> personId,
  required String type,
  required String fileName,
  required int fileSize,
  required String mimeType,
  required String storageKey,
  required String url,
  Value<String?> thumbnailUrl,
  Value<String?> title,
  Value<String?> description,
  Value<DateTime?> dateTaken,
  Value<Map<String, dynamic>?> location,
  Value<List<String>> tags,
  Value<int?> width,
  Value<int?> height,
  Value<String> privacy,
  Value<Map<String, dynamic>> detectedFaces,
  required String uploadedBy,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<bool> syncPending,
  Value<int> rowid,
});
typedef $$MediaTableTableUpdateCompanionBuilder = MediaTableCompanion Function({
  Value<String> id,
  Value<String> treeId,
  Value<String?> personId,
  Value<String> type,
  Value<String> fileName,
  Value<int> fileSize,
  Value<String> mimeType,
  Value<String> storageKey,
  Value<String> url,
  Value<String?> thumbnailUrl,
  Value<String?> title,
  Value<String?> description,
  Value<DateTime?> dateTaken,
  Value<Map<String, dynamic>?> location,
  Value<List<String>> tags,
  Value<int?> width,
  Value<int?> height,
  Value<String> privacy,
  Value<Map<String, dynamic>> detectedFaces,
  Value<String> uploadedBy,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<bool> syncPending,
  Value<int> rowid,
});

final class $$MediaTableTableReferences
    extends BaseReferences<_$AppDatabase, $MediaTableTable, MediaData> {
  $$MediaTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TreesTableTable _treeIdTable(_$AppDatabase db) =>
      db.treesTable.createAlias(
          $_aliasNameGenerator(db.mediaTable.treeId, db.treesTable.id));

  $$TreesTableTableProcessedTableManager get treeId {
    final $_column = $_itemColumn<String>('tree_id')!;

    final manager = $$TreesTableTableTableManager($_db, $_db.treesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_treeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PersonsTableTable _personIdTable(_$AppDatabase db) =>
      db.personsTable.createAlias(
          $_aliasNameGenerator(db.mediaTable.personId, db.personsTable.id));

  $$PersonsTableTableProcessedTableManager? get personId {
    final $_column = $_itemColumn<String>('person_id');
    if ($_column == null) return null;
    final manager = $$PersonsTableTableTableManager($_db, $_db.personsTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_personIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTableTable _uploadedByTable(_$AppDatabase db) =>
      db.usersTable.createAlias(
          $_aliasNameGenerator(db.mediaTable.uploadedBy, db.usersTable.id));

  $$UsersTableTableProcessedTableManager get uploadedBy {
    final $_column = $_itemColumn<String>('uploaded_by')!;

    final manager = $$UsersTableTableTableManager($_db, $_db.usersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_uploadedByTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MediaTableTableFilterComposer
    extends Composer<_$AppDatabase, $MediaTableTable> {
  $$MediaTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fileName => $composableBuilder(
      column: $table.fileName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get fileSize => $composableBuilder(
      column: $table.fileSize, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mimeType => $composableBuilder(
      column: $table.mimeType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get storageKey => $composableBuilder(
      column: $table.storageKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get thumbnailUrl => $composableBuilder(
      column: $table.thumbnailUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateTaken => $composableBuilder(
      column: $table.dateTaken, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>?, Map<String, dynamic>,
          String>
      get location => $composableBuilder(
          column: $table.location,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get tags =>
      $composableBuilder(
          column: $table.tags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get width => $composableBuilder(
      column: $table.width, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get height => $composableBuilder(
      column: $table.height, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get privacy => $composableBuilder(
      column: $table.privacy, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get detectedFaces => $composableBuilder(
          column: $table.detectedFaces,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get syncPending => $composableBuilder(
      column: $table.syncPending, builder: (column) => ColumnFilters(column));

  $$TreesTableTableFilterComposer get treeId {
    final $$TreesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableFilterComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PersonsTableTableFilterComposer get personId {
    final $$PersonsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.personId,
        referencedTable: $db.personsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableTableFilterComposer(
              $db: $db,
              $table: $db.personsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableFilterComposer get uploadedBy {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.uploadedBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableFilterComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MediaTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MediaTableTable> {
  $$MediaTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fileName => $composableBuilder(
      column: $table.fileName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get fileSize => $composableBuilder(
      column: $table.fileSize, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mimeType => $composableBuilder(
      column: $table.mimeType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get storageKey => $composableBuilder(
      column: $table.storageKey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get thumbnailUrl => $composableBuilder(
      column: $table.thumbnailUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateTaken => $composableBuilder(
      column: $table.dateTaken, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get width => $composableBuilder(
      column: $table.width, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get height => $composableBuilder(
      column: $table.height, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get privacy => $composableBuilder(
      column: $table.privacy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get detectedFaces => $composableBuilder(
      column: $table.detectedFaces,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get syncPending => $composableBuilder(
      column: $table.syncPending, builder: (column) => ColumnOrderings(column));

  $$TreesTableTableOrderingComposer get treeId {
    final $$TreesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableOrderingComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PersonsTableTableOrderingComposer get personId {
    final $$PersonsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.personId,
        referencedTable: $db.personsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableTableOrderingComposer(
              $db: $db,
              $table: $db.personsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableOrderingComposer get uploadedBy {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.uploadedBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableOrderingComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MediaTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MediaTableTable> {
  $$MediaTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<int> get fileSize =>
      $composableBuilder(column: $table.fileSize, builder: (column) => column);

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<String> get storageKey => $composableBuilder(
      column: $table.storageKey, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get thumbnailUrl => $composableBuilder(
      column: $table.thumbnailUrl, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get dateTaken =>
      $composableBuilder(column: $table.dateTaken, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      get location => $composableBuilder(
          column: $table.location, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<int> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<String> get privacy =>
      $composableBuilder(column: $table.privacy, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      get detectedFaces => $composableBuilder(
          column: $table.detectedFaces, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<bool> get syncPending => $composableBuilder(
      column: $table.syncPending, builder: (column) => column);

  $$TreesTableTableAnnotationComposer get treeId {
    final $$TreesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PersonsTableTableAnnotationComposer get personId {
    final $$PersonsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.personId,
        referencedTable: $db.personsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.personsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableAnnotationComposer get uploadedBy {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.uploadedBy,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MediaTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MediaTableTable,
    MediaData,
    $$MediaTableTableFilterComposer,
    $$MediaTableTableOrderingComposer,
    $$MediaTableTableAnnotationComposer,
    $$MediaTableTableCreateCompanionBuilder,
    $$MediaTableTableUpdateCompanionBuilder,
    (MediaData, $$MediaTableTableReferences),
    MediaData,
    PrefetchHooks Function({bool treeId, bool personId, bool uploadedBy})> {
  $$MediaTableTableTableManager(_$AppDatabase db, $MediaTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> treeId = const Value.absent(),
            Value<String?> personId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> fileName = const Value.absent(),
            Value<int> fileSize = const Value.absent(),
            Value<String> mimeType = const Value.absent(),
            Value<String> storageKey = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<String?> thumbnailUrl = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime?> dateTaken = const Value.absent(),
            Value<Map<String, dynamic>?> location = const Value.absent(),
            Value<List<String>> tags = const Value.absent(),
            Value<int?> width = const Value.absent(),
            Value<int?> height = const Value.absent(),
            Value<String> privacy = const Value.absent(),
            Value<Map<String, dynamic>> detectedFaces = const Value.absent(),
            Value<String> uploadedBy = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<bool> syncPending = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaTableCompanion(
            id: id,
            treeId: treeId,
            personId: personId,
            type: type,
            fileName: fileName,
            fileSize: fileSize,
            mimeType: mimeType,
            storageKey: storageKey,
            url: url,
            thumbnailUrl: thumbnailUrl,
            title: title,
            description: description,
            dateTaken: dateTaken,
            location: location,
            tags: tags,
            width: width,
            height: height,
            privacy: privacy,
            detectedFaces: detectedFaces,
            uploadedBy: uploadedBy,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            syncPending: syncPending,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String treeId,
            Value<String?> personId = const Value.absent(),
            required String type,
            required String fileName,
            required int fileSize,
            required String mimeType,
            required String storageKey,
            required String url,
            Value<String?> thumbnailUrl = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime?> dateTaken = const Value.absent(),
            Value<Map<String, dynamic>?> location = const Value.absent(),
            Value<List<String>> tags = const Value.absent(),
            Value<int?> width = const Value.absent(),
            Value<int?> height = const Value.absent(),
            Value<String> privacy = const Value.absent(),
            Value<Map<String, dynamic>> detectedFaces = const Value.absent(),
            required String uploadedBy,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<bool> syncPending = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaTableCompanion.insert(
            id: id,
            treeId: treeId,
            personId: personId,
            type: type,
            fileName: fileName,
            fileSize: fileSize,
            mimeType: mimeType,
            storageKey: storageKey,
            url: url,
            thumbnailUrl: thumbnailUrl,
            title: title,
            description: description,
            dateTaken: dateTaken,
            location: location,
            tags: tags,
            width: width,
            height: height,
            privacy: privacy,
            detectedFaces: detectedFaces,
            uploadedBy: uploadedBy,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            syncPending: syncPending,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MediaTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {treeId = false, personId = false, uploadedBy = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (treeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.treeId,
                    referencedTable:
                        $$MediaTableTableReferences._treeIdTable(db),
                    referencedColumn:
                        $$MediaTableTableReferences._treeIdTable(db).id,
                  ) as T;
                }
                if (personId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.personId,
                    referencedTable:
                        $$MediaTableTableReferences._personIdTable(db),
                    referencedColumn:
                        $$MediaTableTableReferences._personIdTable(db).id,
                  ) as T;
                }
                if (uploadedBy) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.uploadedBy,
                    referencedTable:
                        $$MediaTableTableReferences._uploadedByTable(db),
                    referencedColumn:
                        $$MediaTableTableReferences._uploadedByTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MediaTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MediaTableTable,
    MediaData,
    $$MediaTableTableFilterComposer,
    $$MediaTableTableOrderingComposer,
    $$MediaTableTableAnnotationComposer,
    $$MediaTableTableCreateCompanionBuilder,
    $$MediaTableTableUpdateCompanionBuilder,
    (MediaData, $$MediaTableTableReferences),
    MediaData,
    PrefetchHooks Function({bool treeId, bool personId, bool uploadedBy})>;
typedef $$SyncOperationsTableTableCreateCompanionBuilder
    = SyncOperationsTableCompanion Function({
  required String id,
  Value<String?> treeId,
  required String operationType,
  required String entityType,
  required String entityId,
  required Map<String, dynamic> data,
  required DateTime createdAt,
  Value<DateTime?> syncedAt,
  Value<int> retryCount,
  Value<String?> error,
  required String userId,
  Value<String?> userAgent,
  Value<String?> deviceId,
  Value<int> rowid,
});
typedef $$SyncOperationsTableTableUpdateCompanionBuilder
    = SyncOperationsTableCompanion Function({
  Value<String> id,
  Value<String?> treeId,
  Value<String> operationType,
  Value<String> entityType,
  Value<String> entityId,
  Value<Map<String, dynamic>> data,
  Value<DateTime> createdAt,
  Value<DateTime?> syncedAt,
  Value<int> retryCount,
  Value<String?> error,
  Value<String> userId,
  Value<String?> userAgent,
  Value<String?> deviceId,
  Value<int> rowid,
});

final class $$SyncOperationsTableTableReferences extends BaseReferences<
    _$AppDatabase, $SyncOperationsTableTable, SyncOperationData> {
  $$SyncOperationsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TreesTableTable _treeIdTable(_$AppDatabase db) =>
      db.treesTable.createAlias($_aliasNameGenerator(
          db.syncOperationsTable.treeId, db.treesTable.id));

  $$TreesTableTableProcessedTableManager? get treeId {
    final $_column = $_itemColumn<String>('tree_id');
    if ($_column == null) return null;
    final manager = $$TreesTableTableTableManager($_db, $_db.treesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_treeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTableTable _userIdTable(_$AppDatabase db) =>
      db.usersTable.createAlias($_aliasNameGenerator(
          db.syncOperationsTable.userId, db.usersTable.id));

  $$UsersTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableTableManager($_db, $_db.usersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$SyncOperationsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SyncOperationsTableTable> {
  $$SyncOperationsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get operationType => $composableBuilder(
      column: $table.operationType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get data => $composableBuilder(
          column: $table.data,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
      column: $table.syncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get error => $composableBuilder(
      column: $table.error, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userAgent => $composableBuilder(
      column: $table.userAgent, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnFilters(column));

  $$TreesTableTableFilterComposer get treeId {
    final $$TreesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableFilterComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableFilterComposer get userId {
    final $$UsersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableFilterComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SyncOperationsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncOperationsTableTable> {
  $$SyncOperationsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get operationType => $composableBuilder(
      column: $table.operationType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
      column: $table.syncedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get error => $composableBuilder(
      column: $table.error, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userAgent => $composableBuilder(
      column: $table.userAgent, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnOrderings(column));

  $$TreesTableTableOrderingComposer get treeId {
    final $$TreesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableOrderingComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableOrderingComposer get userId {
    final $$UsersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableOrderingComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SyncOperationsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncOperationsTableTable> {
  $$SyncOperationsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get operationType => $composableBuilder(
      column: $table.operationType, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => column);

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => column);

  GeneratedColumn<String> get error =>
      $composableBuilder(column: $table.error, builder: (column) => column);

  GeneratedColumn<String> get userAgent =>
      $composableBuilder(column: $table.userAgent, builder: (column) => column);

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  $$TreesTableTableAnnotationComposer get treeId {
    final $$TreesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.treeId,
        referencedTable: $db.treesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.treesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableTableAnnotationComposer get userId {
    final $$UsersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.usersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.usersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SyncOperationsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SyncOperationsTableTable,
    SyncOperationData,
    $$SyncOperationsTableTableFilterComposer,
    $$SyncOperationsTableTableOrderingComposer,
    $$SyncOperationsTableTableAnnotationComposer,
    $$SyncOperationsTableTableCreateCompanionBuilder,
    $$SyncOperationsTableTableUpdateCompanionBuilder,
    (SyncOperationData, $$SyncOperationsTableTableReferences),
    SyncOperationData,
    PrefetchHooks Function({bool treeId, bool userId})> {
  $$SyncOperationsTableTableTableManager(
      _$AppDatabase db, $SyncOperationsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncOperationsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncOperationsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncOperationsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> treeId = const Value.absent(),
            Value<String> operationType = const Value.absent(),
            Value<String> entityType = const Value.absent(),
            Value<String> entityId = const Value.absent(),
            Value<Map<String, dynamic>> data = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> syncedAt = const Value.absent(),
            Value<int> retryCount = const Value.absent(),
            Value<String?> error = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String?> userAgent = const Value.absent(),
            Value<String?> deviceId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncOperationsTableCompanion(
            id: id,
            treeId: treeId,
            operationType: operationType,
            entityType: entityType,
            entityId: entityId,
            data: data,
            createdAt: createdAt,
            syncedAt: syncedAt,
            retryCount: retryCount,
            error: error,
            userId: userId,
            userAgent: userAgent,
            deviceId: deviceId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> treeId = const Value.absent(),
            required String operationType,
            required String entityType,
            required String entityId,
            required Map<String, dynamic> data,
            required DateTime createdAt,
            Value<DateTime?> syncedAt = const Value.absent(),
            Value<int> retryCount = const Value.absent(),
            Value<String?> error = const Value.absent(),
            required String userId,
            Value<String?> userAgent = const Value.absent(),
            Value<String?> deviceId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncOperationsTableCompanion.insert(
            id: id,
            treeId: treeId,
            operationType: operationType,
            entityType: entityType,
            entityId: entityId,
            data: data,
            createdAt: createdAt,
            syncedAt: syncedAt,
            retryCount: retryCount,
            error: error,
            userId: userId,
            userAgent: userAgent,
            deviceId: deviceId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SyncOperationsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({treeId = false, userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (treeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.treeId,
                    referencedTable:
                        $$SyncOperationsTableTableReferences._treeIdTable(db),
                    referencedColumn: $$SyncOperationsTableTableReferences
                        ._treeIdTable(db)
                        .id,
                  ) as T;
                }
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable:
                        $$SyncOperationsTableTableReferences._userIdTable(db),
                    referencedColumn: $$SyncOperationsTableTableReferences
                        ._userIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$SyncOperationsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SyncOperationsTableTable,
    SyncOperationData,
    $$SyncOperationsTableTableFilterComposer,
    $$SyncOperationsTableTableOrderingComposer,
    $$SyncOperationsTableTableAnnotationComposer,
    $$SyncOperationsTableTableCreateCompanionBuilder,
    $$SyncOperationsTableTableUpdateCompanionBuilder,
    (SyncOperationData, $$SyncOperationsTableTableReferences),
    SyncOperationData,
    PrefetchHooks Function({bool treeId, bool userId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db, _db.usersTable);
  $$TreesTableTableTableManager get treesTable =>
      $$TreesTableTableTableManager(_db, _db.treesTable);
  $$TreeMembersTableTableTableManager get treeMembersTable =>
      $$TreeMembersTableTableTableManager(_db, _db.treeMembersTable);
  $$PersonsTableTableTableManager get personsTable =>
      $$PersonsTableTableTableManager(_db, _db.personsTable);
  $$RelationshipsTableTableTableManager get relationshipsTable =>
      $$RelationshipsTableTableTableManager(_db, _db.relationshipsTable);
  $$EventsTableTableTableManager get eventsTable =>
      $$EventsTableTableTableManager(_db, _db.eventsTable);
  $$StoriesTableTableTableManager get storiesTable =>
      $$StoriesTableTableTableManager(_db, _db.storiesTable);
  $$MediaTableTableTableManager get mediaTable =>
      $$MediaTableTableTableManager(_db, _db.mediaTable);
  $$SyncOperationsTableTableTableManager get syncOperationsTable =>
      $$SyncOperationsTableTableTableManager(_db, _db.syncOperationsTable);
}
