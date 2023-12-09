import 'package:get/get.dart';
import 'package:health_tracking/local/line/line.dart';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  var currentDate = DateTime.now().obs;
  final DateFormat formatter = DateFormat('yMEd');
  final LineDao lineDao = Get.find();
  final lineList = RxList<LineData>([]);

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadLine();
  }

  Future<void> loadLine() async {
    lineDao.watchAllLine().listen((data) {
      lineList.assignAll(data);
    });
  }

  Future<void> insertLine() async {
    lineDao.insertLine(LineCompanion.insert(pageId: 1, date: currentDate.value));
  }
}