import 'package:drift/drift.dart';
import '../app_database.dart';
import 'trees_table.dart';
import 'persons_table.dart';
import 'users_table.dart';

@DataClassName('EventData')
class EventsTable extends Table {
  TextColumn get id => text()();
  TextColumn get treeId => text().named('tree_id').references(TreesTable, #id)();
  TextColumn get type => text()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();

  // Timing
  DateTimeColumn get date => dateTime().nullable()();
  TextColumn get dateAccuracy => text().named('date_accuracy').withDefault(const Constant('exact'))();
  DateTimeColumn get endDate => dateTime().named('end_date').nullable()();

  // Location
  TextColumn get place => text().map(const CustomJsonTypeConverter()).nullable()();

  // Participants
  TextColumn get primaryPersonId => text().named('primary_person_id').references(PersonsTable, #id)();
  TextColumn get otherPersonIds => text().named('other_person_ids').map(const StringListConverter()).withDefault(const Constant(''))();

  // Supporting Information
  TextColumn get mediaIds => text().named('media_ids').map(const StringListConverter()).withDefault(const Constant(''))();
  TextColumn get sources => text().map(const CustomJsonTypeConverter()).withDefault(const Constant('[]'))();

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
    Index('idx_events_tree_id', 'CREATE INDEX idx_events_tree_id ON events_table (tree_id)'),
    Index('idx_events_primary_person', 'CREATE INDEX idx_events_primary_person ON events_table (primary_person_id)'),
    Index('idx_events_type', 'CREATE INDEX idx_events_type ON events_table (type)'),
    Index('idx_events_date', 'CREATE INDEX idx_events_date ON events_table (date)'),
    Index('idx_events_sync_pending', 'CREATE INDEX idx_events_sync_pending ON events_table (sync_pending)'),
  ];
}