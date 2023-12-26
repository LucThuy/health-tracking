import 'package:moor_flutter/moor_flutter.dart';

part 'line.g.dart';

class Line extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pageId => integer()();
  DateTimeColumn get date => dateTime()();
}

@UseMoor(tables: [Line], daos: [LineDao])
class LineDatabase extends _$LineDatabase {
  LineDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'line.lite', logStatements: true));

  @override
  int get schemaVersion => 1;

}

@UseDao(tables: [Line])
class LineDao extends DatabaseAccessor<LineDatabase> with _$LineDaoMixin {
  final LineDatabase lineDb;

  LineDao(this.lineDb) : super(lineDb);

  Stream<List<LineData>> watchAllLine() => select(line).watch();
  Future insertLine(Insertable<LineData> lineData) => into(line).insert(lineData);
}