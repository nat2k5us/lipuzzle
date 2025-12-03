import 'package:drift/drift.dart';
import '../app_database.dart';
import 'trees_table.dart';
import 'persons_table.dart';
import 'users_table.dart';

@DataClassName('MediaData')
class MediaTable extends Table {
  TextColumn get id => text()();
  TextColumn get treeId => text().named('tree_id').references(TreesTable, #id)();
  TextColumn get personId => text().named('person_id').references(PersonsTable, #id).nullable()(); // nullable for tree-level media

  // File Information
  TextColumn get type => text()();
  TextColumn get fileName => text().named('file_name')();
  IntColumn get fileSize => integer().named('file_size')(); // bytes
  TextColumn get mimeType => text().named('mime_type')();
  TextColumn get storageKey => text().named('storage_key')(); // S3 key or storage path
  TextColumn get url => text()(); // CDN or storage URL
  TextColumn get thumbnailUrl => text().named('thumbnail_url').nullable()();

  // Metadata
  TextColumn get title => text().nullable()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get dateTaken => dateTime().named('date_taken').nullable()();
  TextColumn get location => text().map(const CustomJsonTypeConverter()).nullable()();
  TextColumn get tags => text().map(const StringListConverter()).withDefault(const Constant(''))();

  // Image-specific
  IntColumn get width => integer().nullable()();
  IntColumn get height => integer().nullable()();

  // Permissions
  TextColumn get privacy => text().withDefault(const Constant('family'))();

  // Face Recognition
  TextColumn get detectedFaces => text().named('detected_faces').map(const CustomJsonTypeConverter()).withDefault(const Constant('[]'))();

  // Audit
  TextColumn get uploadedBy => text().named('uploaded_by').references(UsersTable, #id)(); // References User.id
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
  DateTimeColumn get deletedAt => dateTime().named('deleted_at').nullable()();

  // Sync fields
  BoolColumn get syncPending => boolean().named('sync_pending').withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Index> get indexes => [
    Index('idx_media_tree_id', 'CREATE INDEX idx_media_tree_id ON media_table (tree_id)'),
    Index('idx_media_person_id', 'CREATE INDEX idx_media_person_id ON media_table (person_id)'),
    Index('idx_media_type', 'CREATE INDEX idx_media_type ON media_table (type)'),
    Index('idx_media_uploaded_by', 'CREATE INDEX idx_media_uploaded_by ON media_table (uploaded_by)'),
    Index('idx_media_created_at', 'CREATE INDEX idx_media_created_at ON media_table (created_at)'),
    Index('idx_media_sync_pending', 'CREATE INDEX idx_media_sync_pending ON media_table (sync_pending)'),
  ];
}