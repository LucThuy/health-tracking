import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracking/modules/dashboard/add_line/add_line_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/theme.dart';

class AddLineScreen extends GetView<AddLineController> {
  const AddLineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: kGradientGreen50White),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text("NEW LINE",
                    style: GoogleFonts.pangolin(
                      color: kGreen800,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                    )),
              ),
              Card(
                elevation: 3,
                shadowColor: kGreen800,
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(controller.image),
                    fit: BoxFit.cover,
                    height: 300,
                    width: 300,
                  ),
                ),
              ),
              Obx(() => Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            controller.dateFormatter
                                .format(controller.currentDate.value),
                            style: GoogleFonts.pangolin(
                              color: kGreen800,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                            )),
                        Text(
                            controller.timeFormatter
                                .format(controller.currentDate.value),
                            style: GoogleFonts.pangolin(
                              color: kGreen800,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                            ))
                      ],
                    ),
                  )),
              SizedBox(
                width: 90.w,
                child: TextField(
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
                      labelText: "Dish name",
                      hintText: "Ex. Bún đậu mắm tôm",
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
