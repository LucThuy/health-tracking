import 'package:get/get.dart';
import 'package:health_tracking/local/line/line.dart';
import 'package:health_tracking/modules/main/main_controller.dart';
import 'package:intl/intl.dart';

import '../../local/page/page.dart';
import '../../routes/app_pages.dart';

class DashboardController extends GetxController {
  var currentDate = DateTime.now().obs;
  final DateFormat formatter = DateFormat('yMEd');
  final DateFormat dateFormat = DateFormat('yMd');
  final PageDao pageDao = Get.find();
  final LineDao lineDao = Get.find();
  final lineList = RxList<LineData>([]);
  final mainController = Get.find<MainController>();
  final pageList = RxList<PageData>([]);
  var todayPage = Rxn<PageData>();

  var isLoading = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadTodayPage();
    await loadLine();
    await loadPage();
    isLoading.value = false;
  }

  Future<void> loadTodayPage() async {
    todayPage.value =
        await pageDao.getPageByDate(dateFormat.format(currentDate.value));
    if (todayPage.value == null) {
      await pageDao.insertPage(PageCompanion.insert(
          date: dateFormat.format(currentDate.value),
          calories: 0.0,
          protein: 0.0,
          carbohydrates: 0.0,
          fat: 0.0));
      todayPage.value =
          await pageDao.getPageByDate(dateFormat.format(currentDate.value));
    }
  }

  Future<void> loadPage() async {
    var page = await pageDao.getAllPage();
    pageList.assignAll(page);
  }

  Future<void> loadLine() async {
    if (todayPage.value != null) {
      lineDao.watchLineByPageId(todayPage.value!.id).listen((data) {
        lineList.assignAll(data);
      });
    }
  }

  detailLine(int index) {
    Get.offNamed(AppRoutes.rDetailLine, arguments: {'lineId': lineList[index].id});
    Get.until((route) => route.isFirst);
  }
}
