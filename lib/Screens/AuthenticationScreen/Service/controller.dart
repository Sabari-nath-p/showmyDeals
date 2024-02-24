import 'dart:convert';

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_my_deals/Screens/AuthenticationScreen/Views/OTPVerificationScreen.dart';
import 'package:show_my_deals/Screens/AuthenticationScreen/Views/OnBoardingView.dart';
import 'package:show_my_deals/Screens/Game/controller.dart';
import 'package:show_my_deals/Screens/HomeScreen/DashBoard.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:show_my_deals/appConfig.dart';
import 'package:show_my_deals/main.dart';
import 'package:show_my_deals/src/FlashMessage.dart';
import 'package:show_my_deals/src/ServerRequest.dart';
import 'package:sizer/sizer.dart';

class AuthenticationController extends GetxController {
  TextEditingController PhoneController = TextEditingController();
  TextEditingController OtpController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String countryCodeController = "+91";
  String TOP = "";
  bool Loading = false;
  String? SelectedDistrict;
  var userDate;

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

  submitOnboarding() async {
    final Response = await post(Uri.parse(AppConfig.endpoint + "user/details"),
        body: json.encode({
          "id": userDate["id"],
          " district": SelectedDistrict,
          "name": nameController.text.trim()
        }),
        headers: {
          "Content-Type": "application/json",
        });
    print(Response.body);
    print(Response.statusCode);
    Loading = false;
    update();
    if (Response.statusCode == 200) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("NAME", nameController.text);
      pref.setString("DISTRICT", SelectedDistrict!);
      pref.setString("LOGIN", "IN");
      HomeController hctrl = Get.put(HomeController());
      GameController gctrl = Get.put(GameController());

      Get.offAll(() => DashBoardScreen(), transition: Transition.rightToLeft);
    }
  }

  verifyOtp() async {
    Loading = true;
    update();
    final Response = await post(Uri.parse(AppConfig.endpoint + "user/otp"),
        body: json.encode({
          "phone": PhoneController.text.trim(),
          "otp": OtpController.text.trim(),
        }),
        headers: {
          "Content-Type": "application/json",
        });
    print(Response.body);
    print(Response.statusCode);
    var data = json.decode(Response.body);
    if (Response.statusCode == 200) {
      if (data["otpVerified"]) {
        Loading = false;
        update();
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("ID", data["user"]["id"]);
        pref.setString("SID", data["user"]["secret"]);
        userDate = data["user"];
        if (!data["collectData"]) {
          pref.setString("NAME", data["user"]["name"]);
          pref.setString("DISTRICT", DistrictList.first);
          pref.setString("LOGIN", "IN");
          HomeController hctrl = Get.put(HomeController());
          GameController gctrl = Get.put(GameController());
          Get.offAll(() => DashBoardScreen(),
              transition: Transition.rightToLeft);
        } else {
          nameController.text = "";
          SelectedDistrict = DistrictList.first.toString();
          update();
          Get.to(() => OnBoardingScreen(), transition: Transition.rightToLeft);
        }
      } else {
        FlashMessage("Invalid OTP", "");
        Loading = false;
        update();
      }
    } else {
      FlashMessage("Invalid OTP", "Please enter correct otp");
      Loading = false;
      update();
      Loading = false;
      update();
    }
  }

  SendOtp() async {
    Loading = true;
    update();
    ResponseData response =
        await GFetch("user/otp?phone=${PhoneController.text.trim()}");

    print(response.data);
    if (response.isSucess) {
      // TOP = response.data["top"];
      OtpController.text = "";
      Loading = false;
      update();
      Get.to(() => OTPVerificationScreen(), transition: Transition.rightToLeft);
    } else {
      Loading = false;
      update();
    }
  }
}
