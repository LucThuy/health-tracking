import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../local/database/diary.dart';
import '../../../utility/theme.dart';
import '../diary_controller.dart';

class DiaryPage extends StatelessWidget {
  final diaryController = Get.find<DiaryController>();
  final textController = TextEditingController();
  var focusedDay;
  var diaryDao;
  DiaryPage(DateTime focusedDay, DiaryDao diaryDao){
    this.focusedDay = focusedDay;
    this.diaryDao = diaryDao;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            diaryController.formatter.format(focusedDay),
          style: GoogleFonts.pangolin(
              color: kGreen800,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: ElevatedButton(
              onPressed: () {
                diaryController.saveDiary(textController.text, diaryController.focusedDay.value);
                Navigator.of(context).pop();
              },
              child: Text(
                'Lưu',
                style: GoogleFonts.pangolin(
                    color: kGreen800,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: kGradientGreen100White),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:StreamBuilder<List<DiaryData>>(
                stream: diaryDao.watchDiaryByDate(focusedDay),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final diaryList = snapshot.data!;
                    if (diaryList.isNotEmpty) {
                      final diaryContent = diaryList.first.content;

                      // Gán giá trị của diaryContent cho textController
                      textController.text = diaryContent ?? '';

                      return TextField(
                        controller: textController,
                        maxLines: null,
                        cursorColor: kGreen800,
                        style: GoogleFonts.pangolin(
                          color: kGreen800,
                          fontWeight: FontWeight.w300,
                          fontSize: 12.sp,
                        ),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                top: 20, bottom: 15, left: 20, right: 20),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            floatingLabelStyle: GoogleFonts.pangolin(
                              color: kGreen800,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                            ),
                            labelStyle: GoogleFonts.pangolin(
                              color: kGreen800,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                            ),
                            fillColor: kWhite,
                            filled: true,
                            hintText: "Nhập nội dung nhật ký",
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: kGreen800),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: kGreen800, width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(color: kGreen800),
                                borderRadius: BorderRadius.circular(10))),
                      );
                    }
                  }

                  // Nếu không có dữ liệu hoặc có dữ liệu rỗng, trả về TextField mặc định
                  return TextField(
                    controller: textController,
                    maxLines: null,
                    cursorColor: kGreen800,
                    style: GoogleFonts.pangolin(
                      color: kGreen800,
                      fontWeight: FontWeight.w300,
                      fontSize: 12.sp,
                    ),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            top: 20, bottom: 15, left: 20, right: 20),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        floatingLabelStyle: GoogleFonts.pangolin(
                          color: kGreen800,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                        labelStyle: GoogleFonts.pangolin(
                          color: kGreen800,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                        fillColor: kWhite,
                        filled: true,
                        hintText: "Nhập nội dung nhật ký",
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: kGreen800),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: kGreen800, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: kGreen800),
                            borderRadius: BorderRadius.circular(10))),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}