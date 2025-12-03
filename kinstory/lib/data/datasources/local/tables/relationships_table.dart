import 'package:drift/drift.dart';
import '../app_database.dart';
import 'trees_table.dart';
import 'persons_table.dart';
import 'users_table.dart';

@DataClassName('RelationshipData')
class RelationshipsTable extends Table {
  TextColumn get id => text()();
  TextColumn get treeId => text().named('tree_id').references(TreesTable, #id)();
  TextColumn get type => text()();

  // Person References
  TextColumn get person1Id => text().named('person1_id').references(PersonsTable, #id)();
  TextColumn get person2Id => text().named('person2_id').references(PersonsTable, #id)();

  // Relationship Details
  DateTimeColumn get startDate => dateTime().named('start_date').nullable()();
  DateTimeColumn get endDate => dateTime().named('end_date').nullable()();
  TextColumn get place => text().map(const CustomJsonTypeConverter()).nullable()();
  TextColumn get status => text().nullable()();

  // Additional Context
  TextColumn get notes => text().nullable()();
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
    Index('idx_relationships_tree_id', 'CREATE INDEX idx_relationships_tree_id ON relationships_table (tree_id)'),
    Index('idx_relationships_person1', 'CREATE INDEX idx_relationships_person1 ON relationships_table (person1_id)'),
    Index('idx_relationships_person2', 'CREATE INDEX idx_relationships_person2 ON relationships_table (person2_id)'),
    Index('idx_relationships_type', 'CREATE INDEX idx_relationships_type ON relationships_table (type)'),
    Index('idx_relationships_unique', 'CREATE UNIQUE INDEX idx_relationships_unique ON relationships_table (person1_id, person2_id, type)'),
    Index('idx_relationships_sync_pending', 'CREATE INDEX idx_relationships_sync_pending ON relationships_table (sync_pending)'),
  ];
}