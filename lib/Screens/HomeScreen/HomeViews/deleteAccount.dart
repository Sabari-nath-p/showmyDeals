import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/Game/controller.dart';
import 'package:sizer/sizer.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  DeleteAccountBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(builder: (context) {
      return Container(
        width: 390.w,
        height: 25.h,
        padding: EdgeInsets.symmetric(horizontal: 6.2.w, vertical: 6.2.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Are you sure want to delete ?",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 13.sp),
            ),
            SizedBox(
              height: 2.w,
            ),
            Text(
              "please note that all your offers and coins will be permanently removed and cannot be recovered.",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 10.sp),
            ),
            SizedBox(
              height: 3.2.h,
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
                    context.deleteAccount();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.8.w),
                    height: 4.5.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Appc.PrimaryColor),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: (context.deleteAccountLoading)
                        ? LoadingAnimationWidget.staggeredDotsWave(
                            color: Colors.white, size: 26)
                        : Text(
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
    });
  }
}
