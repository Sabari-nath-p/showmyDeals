import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/main.dart';
import 'package:sizer/sizer.dart';

FlashMessage(String title, String body) async {
  ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
    SnackBar(
      content: Container(
        height: 11.3.h,
        width: 100.w,

        //  margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 10),
        child: Stack(children: [
          Positioned(
            top: 5,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Appc.PrimaryColor),
              child: Row(
                children: [
                  SizedBox(
                    width: 13.71.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: EdgeInsets.only(top: 44),
                        child: SvgPicture.asset(
                          "lib/Base/Assets/Images/bubbles.svg",
                          colorFilter: ColorFilter.mode(
                              HSLColor.fromColor(Appc.PrimaryColor)
                                  .withLightness((.6 - 0.1).clamp(0.0, 1.0))
                                  .toColor(),
                              BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(3.2.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.poppins(
                                fontSize: 12.33.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                            maxLines: 1,
                          ),
                          Text(
                            body, //  "That Email Address is already in use! Please try with a different one.",
                            style: GoogleFonts.poppins(
                                fontSize: 10.sp, color: Colors.white),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
      margin: EdgeInsets.all(3.w),
      padding: EdgeInsets.zero,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: Duration(milliseconds: 1200),
    ),
  );
}
