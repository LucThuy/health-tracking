import 'dart:io';

import 'package:get/get.dart';
import 'package:health_tracking/routes/app_pages.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../../local/line/line.dart';
import '../../../local/page/page.dart';

class AddLineController extends GetxController {
  var currentDate = DateTime.now().obs;
  final DateFormat timeFormatter = DateFormat('jm');
  final DateFormat dateFormatter = DateFormat('yMEd');
  final DateFormat dateFormat = DateFormat('yMd');
  final image = Get.arguments['image'];

  final LineDao lineDao = Get.find();
  final PageDao pageDao = Get.find();

  String name = "";

  Future<void> insertLine() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    File savedImage = await File(image).copy("$path/$currentDate.jpg");
    PageData todayPage =
        await pageDao.getPageByDate(dateFormat.format(currentDate.value));
    await lineDao.insertLine(LineCompanion.insert(
        pageId: todayPage.id,
        date: currentDate.value,
        imagePath: savedImage.path,
        name: name));
    Get.toNamed(AppRoutes.rMain);
  }
}
