import 'package:health_tracking/local/database/nutritions_database.dart';

class nutritiondb_builder {
  NutritionsDao _nutritionsDao;

  nutritiondb_builder(NutritionsDao nd) : _nutritionsDao = nd {}

  bool insertToDB() {
    bool isInserted = true;
    _nutritionsDao.insertNutritionData(
        NutritionData(id: 1, name: 'nothing', foodType: 'meals'));

    return isInserted;
  }
}
