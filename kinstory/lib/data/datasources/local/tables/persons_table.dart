import 'package:drift/drift.dart';
import '../app_database.dart';
import 'trees_table.dart';
import 'users_table.dart';

@DataClassName('PersonData')
class PersonsTable extends Table {
  TextColumn get id => text()();
  TextColumn get treeId => text().named('tree_id').references(TreesTable, #id)();

  // Basic Information
  TextColumn get firstName => text().named('first_name')();
  TextColumn get middleName => text().named('middle_name').nullable()();
  TextColumn get lastName => text().named('last_name').nullable()();
  TextColumn get maidenName => text().named('maiden_name').nullable()();
  TextColumn get nicknames => text().map(const StringListConverter()).withDefault(const Constant(''))();
  TextColumn get suffix => text().nullable()();
  TextColumn get prefix => text().nullable()();

  // Demographics
  TextColumn get gender => text().nullable()();
  DateTimeColumn get dateOfBirth => dateTime().named('date_of_birth').nullable()();
  TextColumn get placeOfBirth => text().named('place_of_birth').map(const CustomJsonTypeConverter()).nullable()();
  DateTimeColumn get dateOfDeath => dateTime().named('date_of_death').nullable()();
  TextColumn get placeOfDeath => text().named('place_of_death').map(const CustomJsonTypeConverter()).nullable()();
  BoolColumn get isLiving => boolean().named('is_living').withDefault(const Constant(true))();

  // Additional Information
  TextColumn get biography => text().nullable()();
  TextColumn get occupation => text().map(const StringListConverter()).withDefault(const Constant(''))();
  TextColumn get education => text().map(const StringListConverter()).withDefault(const Constant(''))();
  TextColumn get religion => text().nullable()();
  TextColumn get ethnicity => text().map(const StringListConverter()).withDefault(const Constant(''))();

  // Contact (for living relatives)
  TextColumn get email => text().nullable()();
  TextColumn get phoneNumber => text().named('phone_number').nullable()();
  TextColumn get address => text().map(const CustomJsonTypeConverter()).nullable()();

  // Metadata
  TextColumn get privacy => text().withDefault(const Constant('family'))();
  TextColumn get profilePictureId => text().named('profile_picture_id').nullable()();
  TextColumn get customFields => text().named('custom_fields').map(const CustomJsonTypeConverter()).withDefault(const Constant('{}'))();

  // Audit
  TextColumn get createdBy => text().named('created_by').references(UsersTable, #id)();
  TextColumn get updatedBy => text().named('updated_by').references(UsersTable, #id)();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
  DateTimeColumn get deletedAt => dateTime().named('deleted_at').nullable()();

  // Sync fields
  BoolColumn get syncPending => boolean().named('sync_pending').withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Index> get indexes => [
    Index('idx_persons_tree_id', 'CREATE INDEX idx_persons_tree_id ON persons_table (tree_id)'),
    Index('idx_persons_name', 'CREATE INDEX idx_persons_name ON persons_table (tree_id, last_name, first_name)'),
    Index('idx_persons_is_living', 'CREATE INDEX idx_persons_is_living ON persons_table (is_living)'),
    Index('idx_persons_created_by', 'CREATE INDEX idx_persons_created_by ON persons_table (created_by)'),
    Index('idx_persons_sync_pending', 'CREATE INDEX idx_persons_sync_pending ON persons_table (sync_pending)'),
  ];
}