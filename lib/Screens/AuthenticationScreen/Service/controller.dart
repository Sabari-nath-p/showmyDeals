import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Screens/AuthenticationScreen/Views/OTPVerificationScreen.dart';
import 'package:show_my_deals/src/ServerRequest.dart';
import 'package:sizer/sizer.dart';

class AuthenticationController extends GetxController {
  TextEditingController PhoneController = TextEditingController();
  TextEditingController OtpController = TextEditingController();
  String countryCodeController = "+91";
  String TOP = "";
  bool Loading = false;
  String SelectedDistrict = "";

  changeCountryCode(BuildContext context) async {
    FlCountryCodePicker countryPicker = FlCountryCodePicker(
      title: Padding(
        padding: EdgeInsets.only(
          left: 1.5.h,
          right: 1.5.h,
          top: 2.h,
        ),
        child: Text(
          "Select Country",
          style: GoogleFonts.raleway(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff1C1C1C)),
        ),
      ),
    );

    var SelectedCountryCode =
        (await countryPicker.showPicker(context: context, fullScreen: true))!;

    countryCodeController = SelectedCountryCode.dialCode;
    update();
  }

  SendOtp() async {
    Loading = true;
    ResponseData response =
        await GFetch("user/otp?phone=${PhoneController.text.trim()}");
    Loading = false;
    if (response.isSucess) {
      TOP = response.data["top"];
      update();
      Get.to(() => OTPVerificationScreen(), transition: Transition.rightToLeft);
    }
  }
}
