import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../local/database/plan.dart';
import '../../local/line/line.dart';
import '../../local/page/page.dart';
import '../../routes/app_pages.dart';
import '../plan/plan_controller.dart';

class DiaryController extends GetxController {
  Rx<DateTime> focusedDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).toUtc().add(Duration(hours: 7)).obs;
  final DateFormat formatter = DateFormat('yMEd');
  final DateFormat dateFormat = DateFormat('yMd');
  final PageDao pageDao = Get.find();
  final LineDao lineDao = Get.find();
  final PlanDao planDao = Get.find();

  final lineList = RxList<LineData>([]);

  final planList = RxList<PlanData>([]);



  var isLoading = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getLine(focusedDay.value);
    await getPlan(focusedDay.value);
    isLoading.value = false;
  }


  void updateSelectedDay(DateTime newDate) {
    focusedDay.value = newDate;
  }

  Future<void> getLine(DateTime focusedDay) async {
    var todayPage = await pageDao.getPageByDate(dateFormat.format(focusedDay));
    lineList.clear();
    if(todayPage != null){
      lineDao.watchLineByPageId(todayPage.id).listen((data) {
        lineList.assignAll(data);
      });
    }
  }

  Future<void> getPlan(DateTime focusedDay) async{
    planList.clear();
    List<PlanData> plans = await planDao.getPlansByDate(focusedDay);
    planList.assignAll(plans);
    }

  detailLine(int index) {
    Get.offNamed(AppRoutes.rDetailLine, arguments: {'lineId': lineList[index].id});
    Get.until((route) => route.isFirst);
  }


}