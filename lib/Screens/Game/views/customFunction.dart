import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/Game/controller.dart';
import 'package:sizer/sizer.dart';

dialog(BuildContext context, int selectedIndex) {
  GameController gctrl = Get.put(GameController());

  showDialog(
      context: context,
      builder: (ctx) => Container(
            alignment: Alignment.center,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: 82.89.w,
                height: 29.69.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    border: Border.all(color: Appc.PrimaryColor)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 31.31.w,
                      height: 31.31.w,
                      child: LottieBuilder.asset(
                          "lib/Base/Assets/Images/reward.json"),
                    ),
                    Text(
                      gctrl.spinItem!.spinContent!.items![selectedIndex]
                          .heading!,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: Appc.PrimaryColor),
                    ),
                    Text(
                      gctrl.spinItem!.spinContent!.items![selectedIndex].text!,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 26.57.w,
                        height: 3.5.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Appc.PrimaryColor),
                        child: Text("Back",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp,
                                color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
}
