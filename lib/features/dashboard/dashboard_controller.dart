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

  // final NutritionsDao nd = NutritionsDao(NutritionsDatabase());

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadLine();
  }

  Future<void> loadLine() async {
    // await pageDao
    //     .getPageByDate(dateFormat.format(currentDate.value))
    //     .then((pageData) => {
    //           if (pageData == null)
    //             {
    //               pageDao.insertPage(PageCompanion.insert(
    //                   date: dateFormat.format(currentDate.value)))
    //             }
    //         });
    // print('Load line');
    // nd.syncFirebaseData();
    //
    // var list = await nd.getAllNutrition();
    //
    // for (var l in list) {
    //   print(l);
    // }

    var todayPage =
        await pageDao.getPageByDate(dateFormat.format(currentDate.value));
    todayPage ??= await pageDao.insertPage(
        PageCompanion.insert(date: dateFormat.format(currentDate.value)));
    lineDao.watchLineByPageId(todayPage.id).listen((data) {
      lineList.assignAll(data);
    });
  }
}
