import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:health_tracking/local/database/nutrition_database.dart';
import '../../../local/database/nutritions_database.dart' as nb;
import '../../../local/model/food_type.dart';
import '../nutrition_controller.dart';

class ResultsTab extends StatelessWidget {
  final String foodType;
  final NutritionController controller = Get.find();
  final nb.NutritionsDao nutritionsDao = Get.find();

  ResultsTab({required this.foodType});

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(future: nutritionsDao.searchTypeNutrition(foodType), builder: (context,snapshot){
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.searchController,
              onChanged: (value) {
                controller.performSearch();
              },
              decoration: InputDecoration(
                hintText: 'Tìm kiếm',
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              RxList<nb.NutritionData> results = RxList([]);
              results.value= snapshot.data ?? [];
              print(results);

              return ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  nb.NutritionData result = results[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 4.0, bottom: 4.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.purple, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      title: Text(result.name),
                      subtitle: Text(
                        'Calories: ${result.calories}, Protein: ${result.protein}, Carbs: ${result.carbohydrates}, Fat: ${result.fat}',
                      ),
                    ),
                  );
                },
              );
            }
            ),
          )],
      );
    },);

  }
}