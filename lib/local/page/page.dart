import 'package:moor_flutter/moor_flutter.dart';

part 'page.g.dart';

class Page extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get date => text()();
}

@UseMoor(tables: [Page], daos: [PageDao])
class PageDatabase extends _$PageDatabase {
  PageDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'page.lite', logStatements: true));

  @override
  int get schemaVersion => 1;

}

@UseDao(tables: [Page])
class PageDao extends DatabaseAccessor<PageDatabase> with _$PageDaoMixin {
  final PageDatabase pageDb;

  PageDao(this.pageDb) : super(pageDb);

  Future getPageByDate(String date) => (select(page)..where((p) => p.date.equals(date))).getSingleOrNull();
  Future insertPage(Insertable<PageData> pageData) => into(page).insert(pageData);
}