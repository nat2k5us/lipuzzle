import 'package:drift/drift.dart';
import '../app_database.dart';
import 'users_table.dart';

@DataClassName('TreeData')
class TreesTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get ownerId => text().named('owner_id').references(UsersTable, #id)();
  TextColumn get visibility => text().withDefault(const Constant('private'))();
  TextColumn get settings => text().map(const CustomJsonTypeConverter()).withDefault(const Constant('{}'))();
  TextColumn get coverImageUrl => text().named('cover_image_url').nullable()();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
  DateTimeColumn get deletedAt => dateTime().named('deleted_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Index> get indexes => [
    Index('idx_trees_owner_id', 'CREATE INDEX idx_trees_owner_id ON trees_table (owner_id)'),
    Index('idx_trees_visibility', 'CREATE INDEX idx_trees_visibility ON trees_table (visibility)'),
    Index('idx_trees_created_at', 'CREATE INDEX idx_trees_created_at ON trees_table (created_at)'),
  ];
}