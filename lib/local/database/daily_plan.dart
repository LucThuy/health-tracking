import 'package:moor_flutter/moor_flutter.dart';

part 'daily_plan.g.dart';

class DailyPlan extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get date => dateTime()();

  RealColumn get calories => real()();

  RealColumn get protein => real()();

  RealColumn get carbohydrates => real()();

  RealColumn get fat => real()();
}

@UseMoor(tables: [DailyPlan], daos: [DailyPlanDao])
class DailyPlanDatabase extends _$DailyPlanDatabase {
  DailyPlanDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'dailyPlan.lite', logStatements: true));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [DailyPlan])
class DailyPlanDao extends DatabaseAccessor<DailyPlanDatabase> with _$DailyPlanDaoMixin {
  final DailyPlanDatabase dailyPlanDb;

  DailyPlanDao(this.dailyPlanDb) : super(dailyPlanDb);

  Future getAllDailyPlan() => (select(dailyPlan).get());

  Future insertDailyPlan(Insertable<DailyPlanData> dailyPlanData) =>
      into(dailyPlan).insert(dailyPlanData);

  Future updateDailyPlan(Insertable<DailyPlanData> dailyPlanData) async {
    await update(dailyPlan).replace(dailyPlanData);
  }


  Future<DailyPlanData> getDailyPlanByDate(DateTime date) async {
    final query = select(dailyPlan)
      ..where((p) => p.date.equals(date));

    final result = await query.getSingleOrNull();

    if (result == null) {
      final newPlan = DailyPlanCompanion.insert(date: date, calories: 0.0, protein: 0.0, carbohydrates: 0.0, fat: 0.0);
      await insertDailyPlan(newPlan);

      final query1 = select(dailyPlan)
        ..where((p) => p.date.equals(date));
      return await query1.getSingle();
    } else {
      // Nếu có dữ liệu, trả về kết quả
      return result;
    }
  }
}
