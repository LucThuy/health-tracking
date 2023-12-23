import 'package:moor_flutter/moor_flutter.dart';

part 'diary.g.dart';

class Diary extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text().nullable()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
}

@UseMoor(tables: [Diary], daos: [DiaryDao])
class DiaryDatabase extends _$DiaryDatabase {
  DiaryDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.lite', logStatements: true));

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

  Future<void> saveDiary(String content, DateTime date) async {
    await into(diary).insert(
      DiaryCompanion(
        content: Value(content),
        date: Value(date),
      ),
    );
  }

}
