import 'package:drift/drift.dart';
import '../app_database.dart';
import 'trees_table.dart';
import 'users_table.dart';

@DataClassName('StoryData')
class StoriesTable extends Table {
  TextColumn get id => text()();
  TextColumn get treeId => text().named('tree_id').references(TreesTable, #id)();
  TextColumn get title => text()();
  TextColumn get content => text()(); // Rich text / Markdown

  // Relations
  TextColumn get authorId => text().named('author_id').references(UsersTable, #id)();
  TextColumn get relatedPersonIds => text().named('related_person_ids').map(const StringListConverter()).withDefault(const Constant(''))();

  // Media
  TextColumn get coverImageId => text().named('cover_image_id').nullable()();
  TextColumn get mediaIds => text().named('media_ids').map(const StringListConverter()).withDefault(const Constant(''))();

  // Publishing
  TextColumn get status => text().withDefault(const Constant('draft'))();
  DateTimeColumn get publishedAt => dateTime().named('published_at').nullable()();
  TextColumn get privacy => text().withDefault(const Constant('family'))();

  // Engagement
  IntColumn get viewCount => integer().named('view_count').withDefault(const Constant(0))();
  IntColumn get likeCount => integer().named('like_count').withDefault(const Constant(0))();

  // AI-generated metadata
  TextColumn get metadata => text().map(const CustomJsonTypeConverter()).nullable()();

  // Audit
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
  DateTimeColumn get deletedAt => dateTime().named('deleted_at').nullable()();

  // Sync fields
  BoolColumn get syncPending => boolean().named('sync_pending').withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Index> get indexes => [
    Index('idx_stories_tree_id', 'CREATE INDEX idx_stories_tree_id ON stories_table (tree_id)'),
    Index('idx_stories_author', 'CREATE INDEX idx_stories_author ON stories_table (author_id)'),
    Index('idx_stories_status', 'CREATE INDEX idx_stories_status ON stories_table (status)'),
    Index('idx_stories_published_at', 'CREATE INDEX idx_stories_published_at ON stories_table (published_at)'),
    Index('idx_stories_sync_pending', 'CREATE INDEX idx_stories_sync_pending ON stories_table (sync_pending)'),
  ];
}