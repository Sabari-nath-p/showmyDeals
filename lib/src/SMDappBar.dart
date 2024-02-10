import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:sizer/sizer.dart';

class SMDAppBar extends StatelessWidget {
  String title;
  bool isback;
  bool isSkip;
  SMDAppBar(
      {super.key,
      required this.title,
      this.isback = true,
      this.isSkip = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 8.94.h,
      padding: EdgeInsets.symmetric(horizontal: 4.2.w),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(.1),
            offset: Offset(0, -9),
            spreadRadius: 0,
            blurRadius: 22)
      ]),
      child: Row(
        children: [
          (!isback)
              ? SizedBox(
                  width: 20,
                )
              : InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_ios_new_outlined)),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 13.33.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          (isSkip)
              ? SizedBox(
                  height: 3.8.w,
                  child: Image.asset("lib/Base/Assets/Images/skip.png"))
              : SizedBox(
                  width: 20,
                )
        ],
      ),
    );
  }
}
