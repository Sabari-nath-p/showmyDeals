import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/AuthenticationScreen/Service/controller.dart';
import 'package:show_my_deals/Screens/AuthenticationScreen/Views/OTPVerificationScreen.dart';
import 'package:show_my_deals/Screens/DetailedView/DetailedViewScreen.dart';
import 'package:show_my_deals/Screens/DetailedView/Views/DetailedView.dart';
import 'package:show_my_deals/appConfig.dart';
import 'package:show_my_deals/src/FlashMessage.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthenticationView extends StatelessWidget {
  AuthenticationView({super.key});

  AuthenticationController authctrl = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(builder: (_) {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8.9.h),
            SizedBox(
              width: 100.w,
              height: 39.76.h,
              child: Image.asset(
                "lib/Base/Assets/Images/authBanner.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5.1.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.8.w),
                child: InkWell(
                  onTap: () {
                    Get.to(() => DetailedViewScreen());
                  },
                  child: Text(
                    "Discover Deals, Jobs and Stores  in one place!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 15.sp, fontWeight: FontWeight.w700),
                  ),
                )),
            SizedBox(
              height: 5.2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.8.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    "   Log in or Sign up   ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 12.5.sp, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 1,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 3.05.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    authctrl.changeCountryCode(context);
                  },
                  child: Container(
                    width: 20.7.w,
                    height: 4.8.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Appc.PrimaryColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          size: 12.sp,
                          color: Colors.black45,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          authctrl.countryCodeController,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.8.w,
                ),
                Container(
                    width: 65.w,
                    height: 4.8.h,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Appc.LightGery)),
                    child: TextFormField(
                      controller: authctrl.PhoneController,
                      keyboardType: TextInputType.phone,
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          hintText: "Enter Your Phone Number",
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              color: Appc.TLightGrey)),
                    )),
              ],
            ),
            SizedBox(
              height: 5.4.h,
            ),
            InkWell(
              onTap: () {
                // if (authctrl.PhoneController.text.isEmpty) {
                //   FlashMessage("Invalid Entry",
                //       "Some fields were left empty or contain invalid information");
                //   return;
                // } else if (authctrl.Loading) {
                //   return;
                // } else {
                //   authctrl.SendOtp();
                // }

                Get.to(() => OTPVerificationScreen());
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
            SizedBox(
              height: 5.4.h,
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
            )
          ],
        ),
      );
    });
  }
}
