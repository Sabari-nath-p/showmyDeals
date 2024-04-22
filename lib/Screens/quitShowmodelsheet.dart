import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:sizer/sizer.dart';

class QuitModelsheet extends StatelessWidget {
  const QuitModelsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 15.h,
      padding: EdgeInsets.symmetric(horizontal: 6.2.w, vertical: 6.2.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Are you sure want to Quit ?",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, fontSize: 13.sp),
          ),
          SizedBox(
            height: 2.w,
          ),
          SizedBox(
            height: 1.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.8.w),
                  height: 4.5.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Appc.PrimaryColor),
                  child: Text(
                    "Cancel",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 12.66.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  exit(0);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.8.w),
                  height: 4.5.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Appc.PrimaryColor),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    "Confirm",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Appc.PrimaryColor,
                        fontSize: 12.66.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
