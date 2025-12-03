import 'package:drift/drift.dart';
import '../app_database.dart';

@DataClassName('UserData')
class UsersTable extends Table {
  TextColumn get id => text()();
  TextColumn get email => text()();
  TextColumn get firstName => text().named('first_name')();
  TextColumn get lastName => text().named('last_name')();
  TextColumn get profilePictureUrl => text().named('profile_picture_url').nullable()();
  TextColumn get phoneNumber => text().named('phone_number').nullable()();
  DateTimeColumn get dateOfBirth => dateTime().named('date_of_birth').nullable()();
  TextColumn get preferences => text().map(const CustomJsonTypeConverter()).withDefault(const Constant('{}'))();
  BoolColumn get emailVerified => boolean().named('email_verified').withDefault(const Constant(false))();
  BoolColumn get mfaEnabled => boolean().named('mfa_enabled').withDefault(const Constant(false))();
  TextColumn get mfaSecret => text().named('mfa_secret').nullable()();
  DateTimeColumn get lastLoginAt => dateTime().named('last_login_at').nullable()();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
  DateTimeColumn get deletedAt => dateTime().named('deleted_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Index> get indexes => [
    Index('idx_users_email', 'CREATE UNIQUE INDEX idx_users_email ON users_table (email)'),
    Index('idx_users_created_at', 'CREATE INDEX idx_users_created_at ON users_table (created_at)'),
  ];
}