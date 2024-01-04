import 'package:moor_flutter/moor_flutter.dart';

part 'diary.g.dart';

class Diary extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text().nullable()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
}

@UseMoor(tables: [Diary], daos: [DiaryDao])
class DiaryDatabase extends _$DiaryDatabase {
  DiaryDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'diary.lite', logStatements: true));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [Diary])
class DiaryDao extends DatabaseAccessor<DiaryDatabase> with _$DiaryDaoMixin {
  final DiaryDatabase diaryDb;

  DiaryDao(this.diaryDb) : super(diaryDb);

  Stream<List<DiaryData>> watchAllDiary() => select(diary).watch();
  Future updateDiary(Insertable<DiaryData> diaryData) => update(diary).replace(diaryData);
  Future deleteDiary(Insertable<DiaryData> diaryData) => delete(diary).delete(diaryData);

  Stream<List<DiaryData>> watchDiaryByDate(DateTime date) {
    return (select(diary)
      ..where((tbl) => tbl.date.equals(date))
    ).watch();
  }

  Future<void> saveDiary(String content, DateTime date) async {
    final existingDiary = await (select(diary)..where((d) => d.date.equals(date))).getSingleOrNull();

    if (existingDiary != null) {
      await update(diary).replace(
        DiaryCompanion(
          id: Value(existingDiary.id),
          content: Value(content),
          date: Value(date),
        ),
      );
    } else {
      await into(diary).insert(
        DiaryCompanion(
          content: Value(content),
          date: Value(date),
        ),
      );
    }
  }

}
