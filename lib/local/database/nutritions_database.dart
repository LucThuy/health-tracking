import 'dart:core';

import 'package:health_tracking/local/model/food_type.dart';
import 'package:health_tracking/services/food_crud.dart';
import 'package:moor_flutter/moor_flutter.dart';

// Moor works by source gen. This file will all the generated code.
part 'nutritions_database.g.dart';

// The name of the database table is "tasks"
// By default, the name of the generated data class will be "Task" (without "s")
class Nutrition extends Table {
  TextColumn get id => text()();

  TextColumn get name => text().withLength(min: 1, max: 50)();

  TextColumn get foodType => text().withLength(min: 1, max: 50)();

  RealColumn get calories => real().nullable()();

  RealColumn get protein => real().nullable()();

  RealColumn get carbohydrates => real().nullable()();

  RealColumn get fat => real().nullable()();

  TextColumn get imagePath => text()();

}

// This annotation tells the code generator which tables this DB works with
@UseMoor(tables: [Nutrition], daos: [NutritionsDao])
// _$AppDatabase is the name of the generated class
class NutritionsDatabase extends _$NutritionsDatabase {
  NutritionsDatabase()
      // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'nutrition.lite',
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

  Future<List<NutritionData>> getAllNutrition() async {
    try {
      // Wait for the first value emitted by the stream
      final List<NutritionData> nutritionList = await watchAllNutrition().first;

      // Return the list
      return nutritionList;
    } catch (e) {
      print("Error fetching data: $e");
      // Handle the error as needed
      return [];
    }
  }

  Future insertNutritionData(Insertable<NutritionData> nutritionData) =>
      into(nutrition).insert(nutritionData);

  List<NutritionData> search(FoodType type, String query) {
    List<NutritionData> nutritionList = [];

    return nutritionList;
  }

  Future<void> syncFirebaseData() async {
    print("start sync");
    delete(nutrition).go();
    final foodCollection = await FoodCrud.readFoodData().first;
    final List<NutritionData> nutritionList =
        foodCollection.docs.map((document) {
      final nutritionData = NutritionData(
        id: document.id,
        name: document['name'],
        foodType: document['type'],
        protein: double.parse(document['protein']),
        calories: double.parse(document['calories']),
        carbohydrates: double.parse(document['carbohydrates']),
        fat: double.parse(document['fat']),
        imagePath: '',
      );
      return nutritionData;
    }).toList();

    // Insert or update the data in your local database
    await batch((batch) {
      batch.insertAll(nutrition, nutritionList,
          mode: InsertMode.insertOrReplace);
    });
  }

  Future<List<NutritionData>> searchNutrition(String query) => (select(nutrition)
      ..where((n) => n.name.like('%$query%'))).get();
}
