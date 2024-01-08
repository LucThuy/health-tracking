import 'package:get/get.dart';
import 'package:health_tracking/local/line/line.dart';
import 'package:health_tracking/modules/main/main_controller.dart';
import 'package:intl/intl.dart';

import '../../local/page/page.dart';

class DashboardController extends GetxController {
  var currentDate = DateTime.now().obs;
  final DateFormat formatter = DateFormat('yMEd');
  final DateFormat dateFormat = DateFormat('yMd');
  final PageDao pageDao = Get.find();
  final LineDao lineDao = Get.find();
  final lineList = RxList<LineData>([]);
  final mainController = Get.find<MainController>();
  final pageList = RxList<PageData>([]);

  // final NutritionsDao nd = NutritionsDao(NutritionsDatabase());

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadLine();
    await loadPage();
  }

  Future<void> loadPage() async {
    var page = await pageDao.getAllPage();
    pageList.assignAll(page);
  }

  Future<void> loadLine() async {
    var todayPage =
        await pageDao.getPageByDate(dateFormat.format(currentDate.value));
    todayPage ??= await pageDao.insertPage(PageCompanion.insert(
        date: dateFormat.format(currentDate.value),
        calories: 0.0,
        protein: 0.0,
        carbohydrates: 0.0,
        fat: 0.0));
    print(todayPage);
    lineDao.watchLineByPageId(todayPage.id).listen((data) {
      lineList.assignAll(data);
    });
  }
}
