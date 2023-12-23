import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../diary_controller.dart';

class DiaryPage extends StatelessWidget {
  final diaryController = Get.find<DiaryController>();
  final textController = TextEditingController();
  var focusedDay;
  DiaryPage(DateTime focusedDay){
    this.focusedDay = focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            diaryController.formatter.format(focusedDay)
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: ElevatedButton(
              onPressed: () {
                diaryController.saveDiary(textController.text, diaryController.focusedDay.value);
              },
              child: Text('Lưu'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textController,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Nhập nội dung nhật ký',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}