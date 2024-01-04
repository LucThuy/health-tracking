import 'dart:core';

import 'package:health_tracking/local/model/food_type.dart';
import 'package:moor_flutter/moor_flutter.dart';

// Moor works by source gen. This file will all the generated code.
part 'nutritions_database.g.dart';

// The name of the database table is "tasks"
// By default, the name of the generated data class will be "Task" (without "s")
class Nutrition extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 50)();

  TextColumn get foodType => text().withLength(min: 1, max: 50)();

  RealColumn get calories => real().nullable()();

  RealColumn get protein => real().nullable()();

  RealColumn get carbohydrates => real().nullable()();

  RealColumn get fat => real().nullable()();
}

// This annotation tells the code generator which tables this DB works with
@UseMoor(tables: [Nutrition], daos: [NutritionsDao])
// _$AppDatabase is the name of the generated class
class NutritionsDatabase extends _$NutritionsDatabase {
  NutritionsDatabase()
      // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          // Good for debugging - prints SQL in the console
          logStatements: true,
        )));

  // Bump this when changing tables and columns.
  // Migrations will be covered in the next part.
  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [Nutrition])
class NutritionsDao extends DatabaseAccessor<NutritionsDatabase>
    with _$NutritionsDaoMixin {
  final NutritionsDatabase nutritionsDatabase;

  NutritionsDao(this.nutritionsDatabase) : super(nutritionsDatabase);

  Stream<List<NutritionData>> watchAllNutrition() => select(nutrition).watch();

  Future insertNutritionData(Insertable<NutritionData> nutritionData) =>
      into(nutrition).insert(nutritionData);

  List<NutritionData> search(FoodType type, String query) {
    List<NutritionData> nutritionList = [];

    return nutritionList;
  }
}
