import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:odometer/odometer.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/Game/controller.dart';
import 'package:show_my_deals/src/FlashMessage.dart';
import 'package:sizer/sizer.dart';

class CoinGenerator extends StatelessWidget {
  CoinGenerator({super.key});
  GameController gctrl = Get.put(GameController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(builder: (_) {
      return Container(
        margin: EdgeInsets.only(top: 5.88.h, bottom: 20.w),
        child: AnimatedGradientBorder(
          borderSize: 1,
          glowSize: 1,
          animationTime: 5,
          gradientColors: [
            Appc.PrimaryColor,
            Colors.white,
            Appc.PrimaryColor,
            Colors.white,
          ],
          // animationProgress: currentProgress,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            width: 92.w,
            //  height: 30.h,
            padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffF6F8FF)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ConfettiWidget(
                      confettiController: gctrl.coinpop,
                      numberOfParticles: 50,
                      maxBlastForce: 4,
                      minBlastForce: 2,
                      blastDirection: pi / 3,
                    ),
                    ConfettiWidget(
                      confettiController: gctrl.coinpop,
                      numberOfParticles: 50,
                      maxBlastForce: 4,
                      minBlastForce: 2,
                      blastDirection: pi / 1.4,
                    ),
                  ],
                ),
                Text(
                  "Claim your free coin",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 15.sp),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Wallet Coins",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 13.sp),
                        ),
                        Row(
                          children: [
                            AnimatedSlideOdometerNumber(
                              //  numberTextStyle: TextStyle(fontSize: 15),
                              odometerNumber: OdometerNumber(gctrl.coin),
                              duration: Duration(seconds: 1),
                              numberTextStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Appc.PrimaryColor,
                                  fontSize: 15.sp),
                              groupSeparator: Text(
                                ",",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Appc.PrimaryColor,
                                    fontSize: 15.sp),
                              ),
                              letterWidth: 3.5.w,
                            ),
                            Text(
                              " Coin",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Appc.PrimaryColor,
                                  fontSize: 15.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.w,
                        ),
                        SizedBox(
                          width: 60.w,
                          child: Text(
                            "Spend coin to claim rewards. Offers from top stores",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 9.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 26.w,
                      height: 26.w,
                      child: Lottie.asset("lib/Base/Assets/Images/coinbox.json",
                          fit: BoxFit.fill),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    if (gctrl.ClaimButton) {
                      if (!gctrl.ClaimLoading) gctrl.GenerateCoin();
                    } else {
                      FlashMessage("No Claim avalible",
                          "Next claim avalible at ${gctrl.counterDuration!.hour} : ${gctrl.counterDuration!.minute} ");
                    }
                    // gctrl.coinCount.addValue(10);
                  },
                  child: Container(
                    //  width: 45.w,
                    padding: EdgeInsets.symmetric(horizontal: 4.2.w),
                    height: 5.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: (gctrl.ClaimButton && !gctrl.ClaimLoading)
                                  ? Appc.PrimaryColor
                                  : Appc.LightGery,
                              offset: Offset(2, 2),
                              blurRadius: .2,
                              spreadRadius: .7),
                          BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              offset: Offset(1, 1),
                              blurRadius: .2,
                              spreadRadius: .7)
                        ],
                        color: (gctrl.ClaimButton && !gctrl.ClaimLoading)
                            ? Appc.PrimaryColor
                            : Appc.LightGery),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LottieBuilder.asset(
                            "lib/Base/Assets/Images/coinloading.json"),
                        (!gctrl.ClaimButton)
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Next Claim",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: (gctrl.ClaimButton &&
                                                !gctrl.ClaimLoading)
                                            ? Color(0xffF5DD42)
                                            : Colors.black.withOpacity(.6),
                                        fontSize: 8.sp),
                                  ),
                                  if (gctrl.counterDuration != null)
                                    TimerCountdown(
                                      format: CountDownTimerFormat
                                          .hoursMinutesSeconds,
                                      endTime: gctrl.counterDuration!,
                                      enableDescriptions: false,
                                      timeTextStyle: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600),
                                      spacerWidth: .4.w,
                                      onEnd: () {
                                        gctrl.ClaimButton = true;
                                        gctrl.ClaimLoading = false;
                                        gctrl.counterDuration = null;
                                        gctrl.update();
                                      },
                                    ),
                                ],
                              )
                            : Text(
                                gctrl.ClaimLoading
                                    ? "Collecting..."
                                    : "Claim Now",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: (gctrl.ClaimButton &&
                                            !gctrl.ClaimLoading)
                                        ? Color(0xffF5DD42)
                                        : Colors.black.withOpacity(.6),
                                    fontSize: 12.sp),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
