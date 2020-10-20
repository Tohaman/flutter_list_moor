import 'package:moor_flutter/moor_flutter.dart';

part 'main_db.g.dart';

class MainDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('name')();
  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get completed => boolean().withDefault(Constant(false))();

  // @override
  // Set<Column> get primaryKey => {id, name};
}

@UseMoor(tables: [MainDB])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}