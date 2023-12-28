import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../local/database/diary.dart';
import '../../../utility/theme.dart';
import '../page/diary_page.dart';

class DiaryBox extends StatelessWidget {
  var focusedDay;
  var diaryDao;

  DiaryBox(DateTime focusedDay, DiaryDao diaryDao, {Key? key}) : super(key: key){
    this.focusedDay = focusedDay;
    this.diaryDao = diaryDao;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 30.h,
      width: 100.w,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: kBackgroundLinearMainSubColor,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 0.5.h, bottom: 0.5.h, left: 3.w, right: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nhật ký",
                    style: GoogleFonts.pangolin(
                        color: kGreen800,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp
                    ),
                  ),
                  Row(
                    children: [
                      Card(
                        color: kBackgroundTransparentSubZeroColor,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: StreamBuilder<List<DiaryData>>(
                            stream: diaryDao.watchDiaryByDate(focusedDay),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final diaryList = snapshot.data!;
                                if (diaryList.isNotEmpty) {
                                  // Nếu có nhật ký, hiển thị nội dung nhật ký
                                  final diaryContent = diaryList.first.content;
                                  return Container(
                                      decoration: BoxDecoration(
                                        gradient: kGradientGreen100White,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      height: 150,
                                      width: 300,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => DiaryPage(focusedDay, diaryDao)),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            diaryContent!,
                                            style: GoogleFonts.pangolin(
                                                color: kGreen400,
                                                fontSize: 12.sp
                                            ),
                                          ),
                                        ),
                                      )
                                  );
                                }
                              }
                              // Nếu không có nhật ký hoặc có lỗi, hiển thị giao diện thêm nhật ký mới
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DiaryPage(focusedDay, diaryDao)),
                                  );
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 50,
                                    color: kTextInvertColor,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}