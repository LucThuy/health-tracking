import 'package:get/get.dart';

class MainController extends GetxController {
  final currentIndex = 0.obs;

  void changeCurrentIndex(int newIndex) {
    currentIndex.value = newIndex;
  }

  MainController();
}