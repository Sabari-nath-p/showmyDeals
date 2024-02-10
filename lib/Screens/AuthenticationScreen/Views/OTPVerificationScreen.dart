import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pinput/pinput.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/AuthenticationScreen/Service/controller.dart';
import 'package:show_my_deals/Screens/AuthenticationScreen/Views/OnBoardingView.dart';
import 'package:show_my_deals/appConfig.dart';
import 'package:show_my_deals/src/SMDappBar.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class OTPVerificationScreen extends StatelessWidget {
  OTPVerificationScreen({super.key});

  AuthenticationController authctrl = Get.put(AuthenticationController());

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
              child: Column(
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
                      Text(
                        "Didn’t Receive ?",
                        style: GoogleFonts.poppins(
                            fontSize: 12.5.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Text(
                        " Resent",
                        style: GoogleFonts.poppins(
                            fontSize: 12.5.sp,
                            fontWeight: FontWeight.w500,
                            color: Appc.PrimaryColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.8.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => OnBoardingScreen(),
                          transition: Transition.rightToLeft);
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
              ),
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
                    launchUrl(Uri.parse("tel:" + AppConfig.contactNumber));
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
