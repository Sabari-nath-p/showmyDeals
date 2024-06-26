import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:show_my_deals/Screens/Reward/RewardDetailedCard.dart';
import 'package:show_my_deals/Screens/Game/spinnerItem.dart';
import 'package:show_my_deals/src/FlashMessage.dart';
import 'package:sizer/sizer.dart';

class RewardCard extends StatelessWidget {
  Items Voucher;
  RewardCard({super.key, required this.Voucher});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Voucher.active!)
          Get.to(
              () => RewardDetailedCard(
                    voucher: Voucher,
                  ),
              transition: Transition.rightToLeft);
        else {
          //FlashMessage("Can't Open", "This voucher is expired");
        }
      },
      child: Container(
        width: 92.1.w,
        height: 21.05.h,
        margin: EdgeInsets.symmetric(horizontal: 1.h, vertical: .5.h),
        child: Stack(
          children: [
            Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: Image.asset(
                  "lib/Base/Assets/Images/rewardcard.png",
                  fit: BoxFit.cover,
                )),
            Positioned(
                top: 2.3.h,
                left: 9.3.w,
                child: Row(
                  children: [
                    Image.asset("lib/Base/Assets/Images/clock.png"),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      "Valid till  ${Voucher.expiry!}",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 8.3.sp,
                          color: Colors.white),
                      textAlign: TextAlign.start,
                    )
                  ],
                )),
            if (Voucher.image != null && Voucher.image != "")
              Positioned(
                top: 6.3.h,
                left: 9.3.w,
                child: Row(
                  children: [Image.network(Voucher.image!)],
                ),
              )
            else
              Positioned(
                top: 5.3.h,
                left: 9.3.w,
                right: 35.w,
                bottom: 8.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      Voucher.heading!,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 11.sp,
                          color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            Positioned(
              left: 9.3.w,
              bottom: 4.5.h,
              child: Container(
                  // padding: EdgeInsets.only(left: 5.w, bottom: 19.h),
                  child: Text(
                Voucher.heading!,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 8.3.sp,
                    color: Colors.white),
                textAlign: TextAlign.start,
              )),
            ),
            Positioned(
              left: 5.w,
              right: 4.w,
              bottom: 1.2.h,
              child: Container(
                  // padding: EdgeInsets.only(left: 5.w, bottom: 19.h),
                  child: Text(
                " *Terms and Conditions apply",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 8.3.sp,
                    color: Colors.white),
                textAlign: TextAlign.start,
              )),
            ),
            //    if (Voucher.expiry!.compareTo(DateTime.now().toString()) < 0)
            if (!Voucher.active!)
              Positioned(
                  left: 0,
                  right: 0,
                  top: 2,
                  bottom: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Blur(
                      blur: .7,
                      blurColor: Colors.black54,
                      colorOpacity: .3,
                      child: Container(),
                    ),
                  )),
            //    if (Voucher.expiry!.compareTo(DateTime.now().toString()) < 0)
            if (!Voucher.active!)
              Positioned(
                  child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Expired / claimed",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ))
          ],
        ),
      ),
    );
  }
}
