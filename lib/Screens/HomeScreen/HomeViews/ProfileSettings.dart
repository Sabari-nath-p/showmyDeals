import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Reward/RewardScreen.dart';
import 'package:show_my_deals/Screens/Game/controller.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/EditProfile.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/deleteAccount.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/logoutBottomSheet.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:show_my_deals/main.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileSettingScreen extends StatelessWidget {
  ProfileSettingScreen({super.key});

  GameController ctrl = Get.put(GameController());
  HomeController hctrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: 7.8.w),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    InkWell(
                      onTap: () {
                        // showModalBottomSheet(
                        //     context: context,
                        //     isScrollControlled: true,
                        //     backgroundColor: Colors.transparent,
                        //     builder: (context) => );
                        Get.to(() => EditProfileBottomSheet(),
                            transition: Transition.rightToLeft);
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 7.6.w,
                            height: 7.6.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Appc.PrimaryColor.withOpacity(.08)),
                            child: Icon(
                              Icons.person,
                              size: 4.w,
                              color: Appc.PrimaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${hctrl.name}",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.3333.sp),
                              ),
                              Text(
                                "Edit Name, District",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 8.sp,
                                    color: Color(0xffAAAAAA)),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Icon(
                            Icons.chevron_right,
                            color: Appc.PrimaryColor,
                            size: 4.h,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 42.4.w,
                          height: 5.2.h,
                          decoration: BoxDecoration(
                              color: Appc.PrimaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 3.w,
                              ),
                              SizedBox(
                                height: 6.8.w,
                                width: 6.8.w,
                                child: Image.asset(
                                    "lib/Base/Assets/Images/coin.png"),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              InkWell(
                                onTap: () {
                                  hctrl.bottomSelected = "gameicon.png";
                                  hctrl.update();
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Reward Coins",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 7.sp,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 0.2.h,
                                    ),
                                    Text(
                                      "${ctrl.coin} Collected",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 6.sp,
                                          color: Color(0xffFBC93B)),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(child: Container()),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 4.h,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => RewardScreen(),
                                transition: Transition.rightToLeft);
                          },
                          child: Container(
                            width: 39.4.w,
                            height: 5.2.h,
                            decoration: BoxDecoration(
                                color: Appc.PrimaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 3.w,
                                ),
                                SizedBox(
                                  height: 6.8.w,
                                  width: 6.8.w,
                                  child: Image.asset(
                                      "lib/Base/Assets/Images/gift.png"),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "View all",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 7.sp,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 0.2.h,
                                    ),
                                    Text(
                                      "Rewards",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 6.sp,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Expanded(child: Container()),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                  size: 4.h,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse("https://showmydeals.in/add"),
                            mode: LaunchMode.externalApplication);
                      },
                      child: Row(
                        children: [
                          Container(
                              width: 7.6.w,
                              height: 7.6.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Appc.PrimaryColor.withOpacity(.08)),
                              child: Image.asset(
                                "lib/Base/Assets/Images/store.png",
                                color: Appc.PrimaryColor,
                              )),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Add your store",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp),
                              ),
                              Text(
                                "Create your store profile",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 8.sp,
                                    color: Color(0xffAAAAAA)),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Icon(
                            Icons.chevron_right,
                            color: Appc.PrimaryColor,
                            size: 4.h,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse("https://showmydeals.in/contact"),
                            mode: LaunchMode.externalApplication);
                      },
                      child: Row(
                        children: [
                          Container(
                              width: 7.6.w,
                              height: 7.6.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Appc.PrimaryColor.withOpacity(.08)),
                              child: Image.asset(
                                "lib/Base/Assets/Images/help.png",
                                color: Appc.PrimaryColor,
                              )),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Help",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp),
                              ),
                              Text(
                                "Get Help from Us",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 8.sp,
                                    color: Color(0xffAAAAAA)),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Icon(
                            Icons.chevron_right,
                            color: Appc.PrimaryColor,
                            size: 4.h,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => DeleteAccountBottomSheet());
                      },
                      child: Row(
                        children: [
                          Container(
                              width: 7.6.w,
                              height: 7.6.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Appc.PrimaryColor.withOpacity(.08)),
                              child: Image.asset(
                                "lib/Base/Assets/Images/setting.png",
                                color: Appc.PrimaryColor,
                              )),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Settings",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp),
                              ),
                              Text(
                                "Delete Account",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 8.sp,
                                    color: Color(0xffAAAAAA)),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Icon(
                            Icons.chevron_right,
                            color: Appc.PrimaryColor,
                            size: 4.h,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      width: 85.w,
                      height: 0.2.h,
                      color: Color(0xffAAAAAA).withOpacity(0.6),
                    ),
                    SizedBox(
                      height: 3.5.h,
                    ),
                    Text(
                      "FAQ",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 8.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "ABOUT US",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 8.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "CONTACT US",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 8.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "TERMS OF USE",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 8.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "PRIVACY POLICY",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 8.sp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => LogoutPopup());
              },
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 60.7.w,
                  height: 4.5.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Appc.PrimaryColor,
                      borderRadius: BorderRadius.circular(17.3)),
                  child: Text(
                    "Log out",
                    style: GoogleFonts.poppins(
                        fontSize: 12.3.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Align(
                alignment: Alignment.center,
                child: Text("App version 1.2.2",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 8.sp,
                        color: Colors.black))),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
