import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/AuthenticationScreen/Service/controller.dart';
import 'package:show_my_deals/Screens/HomeScreen/DashBoard.dart';
import 'package:show_my_deals/main.dart';
import 'package:show_my_deals/src/SMDappBar.dart';
import 'package:sizer/sizer.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  AuthenticationController authctrl = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthenticationController>(builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SMDAppBar(
              title: "Enter Your Details",
              isback: false,
              isSkip: true,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(7.63.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Your Name",
                      style: GoogleFonts.poppins(
                          fontSize: 13.33.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        width: 88.68.w,
                        height: 4.8.h,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Appc.LightGery)),
                        child: TextFormField(
                          // controller: authctrl.PhoneController,
                          keyboardType: TextInputType.phone,
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              hintText: "Enter Your Name",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Appc.TLightGrey)),
                        )),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "Select Your District",
                      style: GoogleFonts.poppins(
                          fontSize: 13.33.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        width: 88.68.w,
                        height: 4.8.h,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Appc.LightGery)),
                        child: DropdownButton(
                          items: DistrictList.map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e.toString().capitalize.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 11.33.sp,
                                    fontWeight: FontWeight.w600),
                              ))).toList(),
                          isExpanded: true,
                          underline: Container(),
                          onChanged: (v) {},
                        )),
                    SizedBox(
                      height: 4.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => DashBoardScreen(),
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
            ))
          ],
        );
      }),
    ));
  }
}
