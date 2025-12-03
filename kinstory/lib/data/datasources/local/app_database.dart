import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:sqlite3/sqlite3.dart';

// Import table definitions
import 'tables/persons_table.dart';
import 'tables/trees_table.dart';
import 'tables/tree_members_table.dart';
import 'tables/relationships_table.dart';
import 'tables/events_table.dart';
import 'tables/stories_table.dart';
import 'tables/media_table.dart';
import 'tables/users_table.dart';
import 'tables/sync_operations_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  UsersTable,
  TreesTable,
  TreeMembersTable,
  PersonsTable,
  RelationshipsTable,
  EventsTable,
  StoriesTable,
  MediaTable,
  SyncOperationsTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();

        // Create indexes for better performance
        await _createIndexes();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle schema migrations here when needed
      },
    );
  }

  Future<void> _createIndexes() async {
    // Person indexes
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_persons_tree_id ON persons_table(tree_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_persons_name ON persons_table(tree_id, last_name, first_name)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_persons_is_living ON persons_table(is_living)',
    );

    // Relationship indexes
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_relationships_tree_id ON relationships_table(tree_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_relationships_person1 ON relationships_table(person1_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_relationships_person2 ON relationships_table(person2_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_relationships_type ON relationships_table(type)',
    );

    // Event indexes
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_events_tree_id ON events_table(tree_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_events_primary_person ON events_table(primary_person_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_events_date ON events_table(date)',
    );

    // Story indexes
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_stories_tree_id ON stories_table(tree_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_stories_author ON stories_table(author_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_stories_status ON stories_table(status)',
    );

    // Media indexes
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_media_tree_id ON media_table(tree_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_media_person ON media_table(person_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_media_type ON media_table(type)',
    );

    // Tree member indexes
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_tree_members_tree_id ON tree_members_table(tree_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_tree_members_user_id ON tree_members_table(user_id)',
    );

    // Sync operations indexes
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_sync_operations_pending ON sync_operations_table(synced_at)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_sync_operations_entity ON sync_operations_table(entity_type, entity_id)',
    );
  }

  // Helper methods for common operations
  Future<void> clearAllData() async {
    await transaction(() async {
      await delete(syncOperationsTable).go();
      await delete(mediaTable).go();
      await delete(storiesTable).go();
      await delete(eventsTable).go();
      await delete(relationshipsTable).go();
      await delete(personsTable).go();
      await delete(treeMembersTable).go();
      await delete(treesTable).go();
      await delete(usersTable).go();
    });
  }

  Future<void> deleteUserData(String userId) async {
    await transaction(() async {
      // Delete trees owned by user
      final userTrees = await (select(treesTable)
            ..where((t) => t.ownerId.equals(userId)))
          .get();

      for (final tree in userTrees) {
        await deleteTreeData(tree.id);
      }

      // Remove user from tree memberships
      await (delete(treeMembersTable)
            ..where((t) => t.userId.equals(userId)))
          .go();

      // Delete user
      await (delete(usersTable)..where((u) => u.id.equals(userId))).go();
    });
  }

  Future<void> deleteTreeData(String treeId) async {
    await transaction(() async {
      await (delete(syncOperationsTable)
            ..where((s) => s.treeId.equals(treeId)))
          .go();
      await (delete(mediaTable)..where((m) => m.treeId.equals(treeId))).go();
      await (delete(storiesTable)..where((s) => s.treeId.equals(treeId))).go();
      await (delete(eventsTable)..where((e) => e.treeId.equals(treeId))).go();
      await (delete(relationshipsTable)
            ..where((r) => r.treeId.equals(treeId)))
          .go();
      await (delete(personsTable)..where((p) => p.treeId.equals(treeId))).go();
      await (delete(treeMembersTable)
            ..where((tm) => tm.treeId.equals(treeId)))
          .go();
      await (delete(treesTable)..where((t) => t.id.equals(treeId))).go();
    });
  }

  // Get database size for monitoring
  Future<int> getDatabaseSize() async {
    final dbPath = await _getDatabasePath();
    final file = File(dbPath);
    if (await file.exists()) {
      return await file.length();
    }
    return 0;
  }

  // Export database for backup
  Future<String> exportDatabase() async {
    final dbPath = await _getDatabasePath();
    final appDir = await getApplicationDocumentsDirectory();
    final backupPath = p.join(appDir.path, 'kinstory_backup_${DateTime.now().millisecondsSinceEpoch}.db');

    final sourceFile = File(dbPath);
    final backupFile = await sourceFile.copy(backupPath);

    return backupFile.path;
  }

  Future<String> _getDatabasePath() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    return p.join(dbFolder.path, 'kinstory_database.db');
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // Put the database file in the Application Documents directory
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'kinstory_database.db'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}

// JSON type converter for storing Map<String, dynamic> as JSON in database
class CustomJsonTypeConverter extends TypeConverter<Map<String, dynamic>, String> {
  const CustomJsonTypeConverter();

  @override
  Map<String, dynamic> fromSql(String fromDb) {
    if (fromDb.isEmpty) return <String, dynamic>{};
    try {
      // Simple implementation - in production would use json.decode()
      if (fromDb == '{}') return <String, dynamic>{};
      return <String, dynamic>{'raw': fromDb};
    } catch (e) {
      return <String, dynamic>{};
    }
  }

  @override
  String toSql(Map<String, dynamic> value) {
    if (value.isEmpty) return '{}';
    return value.toString(); // In a real app, use json.encode()
  }
}

// List<String> type converter
class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    if (fromDb.isEmpty) return [];
    return fromDb.split(',');
  }

  @override
  String toSql(List<String> value) {
    return value.join(',');
  }
}

// DateTime? type converter for nullable DateTime
class NullableDateTimeConverter extends TypeConverter<DateTime?, int?> {
  const NullableDateTimeConverter();

  @override
  DateTime? fromSql(int? fromDb) {
    if (fromDb == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(fromDb);
  }

  @override
  int? toSql(DateTime? value) {
    return value?.millisecondsSinceEpoch;
  }
}