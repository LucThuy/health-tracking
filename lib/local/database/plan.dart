import 'package:moor_flutter/moor_flutter.dart';

part 'plan.g.dart';

class Plan extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  DateTimeColumn get date => dateTime()();

  DateTimeColumn get time => dateTime()();

  RealColumn get calories => real()();

  RealColumn get protein => real()();

  RealColumn get carbohydrates => real()();

  RealColumn get fat => real()();
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

  Future watchPlanById(int id) => (select(plan)..where((p) => p.id.equals(id))).getSingleOrNull();

  Future insertPlan(Insertable<PlanData> planData) =>
      into(plan).insert(planData);

  Future<List<PlanData>> getPlansByDate(DateTime date) async {
    final query = select(plan)
      ..where((p) => p.date.equals(date));

    return query.get();
  }

  Future deletePlan(Insertable<PlanData> planData) => delete(plan).delete(planData);


}
