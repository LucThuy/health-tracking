import 'package:moor_flutter/moor_flutter.dart';

part 'line.g.dart';

class Line extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get pageId => integer()();

  DateTimeColumn get date => dateTime()();

  TextColumn get imagePath => text()();

  TextColumn get name => text()();

  RealColumn get calories => real()();

  RealColumn get protein => real()();

  RealColumn get carbohydrates => real()();

  RealColumn get fat => real()();
}

@UseMoor(tables: [Line], daos: [LineDao])
class LineDatabase extends _$LineDatabase {
  LineDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'line1.lite', logStatements: true));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [Line])
class LineDao extends DatabaseAccessor<LineDatabase> with _$LineDaoMixin {
  final LineDatabase lineDb;

  LineDao(this.lineDb) : super(lineDb);

  Stream<List<LineData>> watchAllLine() => select(line).watch();

  Stream<List<LineData>> watchLineByPageId(int pageId) =>
      (select(line)..where((line) => line.pageId.equals(pageId))).watch();

  Future insertLine(Insertable<LineData> lineData) =>
      into(line).insert(lineData);
}
