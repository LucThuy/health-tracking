import 'package:moor_flutter/moor_flutter.dart';

part 'diary_database.g.dart';

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
  final DiaryDatabase DiaryDb;

  DiaryDao(this.DiaryDb) : super(DiaryDb);

  Stream<List<DiaryData>> watchAllDiary() => select(diary).watch();
  Future insertDiary(Insertable<DiaryData> diaryData) => into(diary).insert(diaryData);
}
