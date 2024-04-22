import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pinput/pinput.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/AuthenticationScreen/Service/controller.dart';
import 'package:show_my_deals/Screens/AuthenticationScreen/Views/OnBoardingView.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:show_my_deals/appConfig.dart';
import 'package:show_my_deals/src/FlashMessage.dart';
import 'package:show_my_deals/src/SMDappBar.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class OTPVerificationScreen extends StatefulWidget {
  OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  AuthenticationController authctrl = Get.put(AuthenticationController());
  bool isResendOtp = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SMDAppBar(
              title: "OTP Verification",
            ),
            Expanded(
              child: GetBuilder<AuthenticationController>(builder: (context) {
                return Column(
                  children: [
                    SizedBox(
                      height: 3.7.h,
                    ),
                    Text(
                      "We’ve sent an OTP to",
                      style: GoogleFonts.poppins(
                          fontSize: 13.33.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    Text(
                      authctrl.countryCodeController +
                          " " +
                          authctrl.PhoneController.text,
                      style: GoogleFonts.poppins(
                          fontSize: 13.33.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 7.05.h,
                    ),
                    Pinput(
                      length: 4,
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsUserConsentApi,
                      controller: authctrl.OtpController,
                      defaultPinTheme: PinTheme(
                          width: 10.8.w,
                          height: 10.8.w,
                          margin: EdgeInsets.symmetric(horizontal: 1.42.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Appc.PrimaryColor, width: 1.2))),
                    ),
                    SizedBox(
                      height: 3.2.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (!authctrl.counterDateTime.isAfter(DateTime.now()))
                          Text(
                            "Didn’t Receive ?",
                            style: GoogleFonts.poppins(
                                fontSize: 12.5.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        if (authctrl.counterDateTime.isAfter(DateTime.now()))
                          Text(
                            " Resend OTP in ",
                            style: GoogleFonts.poppins(
                                fontSize: 12.5.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        if (authctrl.counterDateTime.isAfter(DateTime.now()))
                          TimerCountdown(
                            format: CountDownTimerFormat.secondsOnly,
                            endTime: authctrl.counterDateTime,
                            enableDescriptions: false,
                            timeTextStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600),
                            spacerWidth: .4.w,
                            onEnd: () {
                              // gctrl.ClaimButton = true;
                              // gctrl.ClaimLoading = false;
                              // gctrl.counterDuration = null;
                              // gctrl.update();
                              authctrl.update();
                            },
                          ),
                        if (authctrl.counterDateTime.isAfter(DateTime.now()))
                          Text(
                            " second",
                            style: GoogleFonts.poppins(
                                fontSize: 12.5.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        if (authctrl.counterDateTime.isBefore(DateTime.now()))
                          InkWell(
                            onTap: () {
                              authctrl.SendOtp();
                            },
                            child: Text(
                              " Resent",
                              style: GoogleFonts.poppins(
                                  fontSize: 12.5.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Appc.PrimaryColor),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 2.8.h,
                    ),
                    InkWell(
                      onTap: () {
                        if (authctrl.OtpController.text.isNotEmpty) {
                          authctrl.Loading = true;
                          authctrl.update();
                          authctrl.verifyOtp();
                        } else {
                          FlashMessage(
                              "Invalid Entry", "Please enter OTP to continue");
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.8.w),
                        height: 5.5.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Appc.PrimaryColor),
                        child: (authctrl.Loading)
                            ? LoadingAnimationWidget.staggeredDotsWave(
                                color: Colors.white, size: 26)
                            : Text(
                                "Continue",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16.66.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Need Help ?  ",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400),
                ),
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse("https://showmydeals.in/contact"));
                  },
                  child: Text(
                    "Contact Us",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        color: Appc.PrimaryColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            )
          ],
        ),
      ),
    );
  }
}
