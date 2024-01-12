import 'package:moor_flutter/moor_flutter.dart';

part 'plan.g.dart';

class Plan extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text().nullable()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get time => dateTime()();
}

@UseMoor(tables: [Plan], daos: [PlanDao])
class PlanDatabase extends _$PlanDatabase {
  PlanDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'plan.lite', logStatements: true));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [Plan])
class PlanDao extends DatabaseAccessor<PlanDatabase> with _$PlanDaoMixin {
  final PlanDatabase planDb;

  PlanDao(this.planDb) : super(planDb);

  Future<void> insertPlan(String content, DateTime date, DateTime time) async {
    await into(plan).insert(
      PlanCompanion(
          content: Value(content), date: Value(date), time: Value(time)),
    );
  }

  Future<List<PlanData>> getPlansByDate(DateTime date) async {
    final query = select(plan)..where((p) => p.date.equals(date));

    return query.get();
  }
}
