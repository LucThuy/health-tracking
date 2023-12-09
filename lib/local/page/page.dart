import 'package:moor_flutter/moor_flutter.dart';

part 'page.g.dart';

class Page extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
}

@UseMoor(tables: [Page], daos: [PageDao])
class PageDatabase extends _$PageDatabase {
  PageDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.lite', logStatements: false));

  @override
  int get schemaVersion => 1;

}

@UseDao(tables: [Page])
class PageDao extends DatabaseAccessor<PageDatabase> with _$PageDaoMixin {
  final PageDatabase pageDb;

  PageDao(this.pageDb) : super(pageDb);

}