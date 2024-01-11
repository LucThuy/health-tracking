import 'package:moor_flutter/moor_flutter.dart';

part 'page.g.dart';

class Page extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get date => text()();

  RealColumn get calories => real()();

  RealColumn get protein => real()();

  RealColumn get carbohydrates => real()();

  RealColumn get fat => real()();
}

@UseMoor(tables: [Page], daos: [PageDao])
class PageDatabase extends _$PageDatabase {
  PageDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'page.lite', logStatements: true));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [Page])
class PageDao extends DatabaseAccessor<PageDatabase> with _$PageDaoMixin {
  final PageDatabase pageDb;

  PageDao(this.pageDb) : super(pageDb);

  Future getPageByDate(String date) =>
      (select(page)..where((p) => p.date.equals(date))).getSingleOrNull();

  Future<PageData> getPageByDateOrNot(String date) async {
    var pageData =
        await (select(page)..where((p) => p.date.equals(date))).get();
    if (pageData.isNotEmpty) {
      // If there is a matching row, return the first one
      return pageData.first;
    } else {
      // If no matching row, return a new PageData object
      return PageData(
        id: 0,
        date: date,
        calories: 0,
        protein: 0,
        carbohydrates: 0,
        fat: 0,
      );
    }
  }

  Future getAllPage() => (select(page).get());

  Future insertPage(Insertable<PageData> pageData) =>
      into(page).insert(pageData);

  Future updatePage(Insertable<PageData> pageData) =>
      update(page).replace(pageData);
}
