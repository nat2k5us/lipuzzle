import 'package:drift/drift.dart';
import '../app_database.dart';
import 'trees_table.dart';
import 'users_table.dart';

@DataClassName('SyncOperationData')
class SyncOperationsTable extends Table {
  TextColumn get id => text()();
  TextColumn get treeId => text().named('tree_id').references(TreesTable, #id).nullable()(); // nullable for user-level operations

  // Operation Details
  TextColumn get operationType => text().named('operation_type')(); // 'create', 'update', 'delete'
  TextColumn get entityType => text().named('entity_type')(); // 'person', 'relationship', 'media', etc.
  TextColumn get entityId => text().named('entity_id')(); // ID of the entity being synced
  TextColumn get data => text().map(const CustomJsonTypeConverter())(); // JSON data for the operation

  // Sync Status
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get syncedAt => dateTime().named('synced_at').nullable()(); // null means not synced yet
  IntColumn get retryCount => integer().named('retry_count').withDefault(const Constant(0))();
  TextColumn get error => text().nullable()(); // Error message if sync failed

  // User context
  TextColumn get userId => text().named('user_id').references(UsersTable, #id)();

  // Network context
  TextColumn get userAgent => text().named('user_agent').nullable()();
  TextColumn get deviceId => text().named('device_id').nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Index> get indexes => [
    Index('idx_sync_operations_pending', 'CREATE INDEX idx_sync_operations_pending ON sync_operations_table (synced_at)'),
    Index('idx_sync_operations_entity', 'CREATE INDEX idx_sync_operations_entity ON sync_operations_table (entity_type, entity_id)'),
    Index('idx_sync_operations_tree_id', 'CREATE INDEX idx_sync_operations_tree_id ON sync_operations_table (tree_id)'),
    Index('idx_sync_operations_user_id', 'CREATE INDEX idx_sync_operations_user_id ON sync_operations_table (user_id)'),
    Index('idx_sync_operations_created_at', 'CREATE INDEX idx_sync_operations_created_at ON sync_operations_table (created_at)'),
  ];
}