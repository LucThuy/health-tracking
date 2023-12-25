import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddLineController extends GetxController {
  var currentDate = DateTime.now().obs;
  final DateFormat timeFormatter = DateFormat('jm');
  final DateFormat dateFormatter = DateFormat('yMEd');
  final image = Get.arguments['image'];

}