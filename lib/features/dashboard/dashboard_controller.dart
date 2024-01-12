import 'package:get/get.dart';
import 'package:health_tracking/local/database/plan.dart';
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
  final PlanDao planDao = Get.find();
  final lineList = RxList<LineData>([]);
  final mainController = Get.find<MainController>();
  final pageList = RxList<PageData>([]);
  final planList = RxList<PlanData>([]);
  var todayPage = Rxn<PageData>();
  var isLoading = true.obs;

  Rx<DateTime> focusedWeek = DateTime.now().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadTodayPage();
    await loadLine();
    await loadPage();
    await loadPlan();
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
    pageList.clear();
    var dates = generateWeekDates(findWeekStart(focusedWeek.value));
    for (var date in dates) {
      print('log date');
      print(date);
      var page = await pageDao.getPageByDateOrNot(dateFormat.format(date));
      print(page);
      pageList.add(page);
    }
    print(pageList.value.length);
  }

  Future<void> loadPlan() async {
    var plan = await planDao.getAllPlan();
    planList.assignAll(plan);
  }

  Future<void> loadLine() async {
    if (todayPage.value != null) {
      lineDao.watchLineByPageId(todayPage.value!.id).listen((data) {
        lineList.assignAll(data);
      });
    }
  }

  detailLine(int index) {
    Get.offNamed(AppRoutes.rDetailLine,
        arguments: {'lineId': lineList[index].id});
    Get.until((route) => route.isFirst);
  }

  //week utility
  void updateSelectedWeek(DateTime day) {
    this.focusedWeek.value = day;
    // loadPage();
    // loadPlan();
  }

  DateTime findWeekStart(DateTime date) {
    // Find the starting date of the week (Sunday in this example)
    int difference = date.weekday - DateTime.monday;
    return date.subtract(Duration(days: difference));
  }

  List<DateTime> generateWeekDates(DateTime weekStart) {
    // Generate all dates in the same week
    List<DateTime> weekDates = [];
    for (int i = 0; i < 7; i++) {
      DateTime date = weekStart.add(Duration(days: i));
      weekDates.add(date);
    }
    return weekDates;
  }
}
