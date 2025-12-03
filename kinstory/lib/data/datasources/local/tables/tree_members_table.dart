import 'package:drift/drift.dart';
import '../app_database.dart';
import 'trees_table.dart';
import 'users_table.dart';

@DataClassName('TreeMemberData')
class TreeMembersTable extends Table {
  TextColumn get id => text()();
  TextColumn get treeId => text().named('tree_id').references(TreesTable, #id)();
  TextColumn get userId => text().named('user_id').references(UsersTable, #id)();
  TextColumn get role => text()();
  TextColumn get invitedBy => text().named('invited_by').references(UsersTable, #id)();
  DateTimeColumn get invitedAt => dateTime().named('invited_at')();
  DateTimeColumn get acceptedAt => dateTime().named('accepted_at').nullable()();
  TextColumn get permissions => text().map(const CustomJsonTypeConverter()).withDefault(const Constant('{}'))();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Index> get indexes => [
    Index('idx_tree_members_composite', 'CREATE UNIQUE INDEX idx_tree_members_composite ON tree_members_table (tree_id, user_id)'),
    Index('idx_tree_members_user_id', 'CREATE INDEX idx_tree_members_user_id ON tree_members_table (user_id)'),
    Index('idx_tree_members_role', 'CREATE INDEX idx_tree_members_role ON tree_members_table (role)'),
  ];
}