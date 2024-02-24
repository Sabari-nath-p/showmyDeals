import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/Game/controller.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:show_my_deals/main.dart';
import 'package:show_my_deals/src/DisctricSelector.dart';
import 'package:sizer/sizer.dart';

class SMDAppBar extends StatelessWidget {
  String title;
  bool isback;
  bool isSkip;
  SMDAppBar(
      {super.key,
      required this.title,
      this.isback = true,
      this.isSkip = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 8.94.h,
      padding: EdgeInsets.symmetric(horizontal: 4.2.w),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(.1),
            offset: Offset(0, -9),
            spreadRadius: 0,
            blurRadius: 22)
      ]),
      child: Row(
        children: [
          (!isback)
              ? SizedBox(
                  width: 20,
                )
              : InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_ios_new_outlined)),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 13.33.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          (isSkip)
              ? SizedBox(
                  height: 3.8.w,
                  child: Image.asset("lib/Base/Assets/Images/skip.png"))
              : SizedBox(
                  width: 20,
                )
        ],
      ),
    );
  }
}

PreferredSizeWidget CappBar({bool isBack = false}) {
  HomeController hctrl = Get.put(HomeController());
  GameController gctrl = Get.put(GameController());
  return AppBar(
    leadingWidth: 36.51.w,
    leading: (isBack)
        ? InkWell(
            onTap: () {
              Get.back();
            },
            child: Row(
              children: [
                SizedBox(
                  width: 5.2.w,
                ),
                Icon(Icons.arrow_back_ios_new),
                SizedBox(
                  width: 2.2.w,
                ),
                Expanded(
                  child: Text(
                    "Back",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          )
        : Row(
            children: [
              SizedBox(
                width: 5.2.w,
              ),
              Expanded(
                  child: Image.asset("lib/Base/Assets/Images/badgelogo.png")),
            ],
          ),
    actions: [
      GetBuilder<HomeController>(builder: (_) {
        return Container(
          width: 35.21.w,
          height: 3.11.h,
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Appc.LightGery)),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  //    showDragHandle: true,
                  // backgroundColor: Colors.white,
                  context: navigatorKey.currentState!.context,
                  builder: (ct) => DisctrictSelector());
            },
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Appc.PrimaryColor,
                  size: 4.w,
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    _.selectedDistrict.toString().replaceAll("null", "--"),
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    //   color: Appc.PrimaryColor,
                    size: 4.2.w,
                  ),
                ),

                // GetBuilder<HomeController>(builder: (_) {
                //   return Expanded(
                //     child: DropdownButton(

                //       value: hctrl.selectedDistrict == ""
                //           ? DistrictList.first
                //           : hctrl.selectedDistrict,
                //       style: GoogleFonts.poppins(
                //           color: Colors.black,
                //           fontSize: 10.sp,
                //           fontWeight: FontWeight.w400),
                //       items: DistrictList.map((e) => DropdownMenuItem(
                //           value: e,
                //           child: Text(
                //             e.toString().capitalize.toString(),
                //             style: GoogleFonts.poppins(
                //                 color: Colors.black,
                //                 fontSize: 10.sp,
                //                 fontWeight: FontWeight.w300),
                //           ))).toList(),
                //       isExpanded: true,
                //       underline: Container(),
                //       onChanged: (v) async {
                //         hctrl.selectedDistrict = v.toString();
                //         SharedPreferences preferences =
                //             await SharedPreferences.getInstance();
                //         preferences.setString("DISTRICT", v.toString());

                //         print(v);
                //         hctrl.loadOffers();
                //         hctrl.loadJobs();
                //         hctrl.loadShopes();
                //         gctrl.fetchData();
                //         hctrl.selectedJobModel = null;
                //         hctrl.selectedOfferModel = null;
                //         hctrl.selectOutletModel = null;
                //         hctrl.selectedTag = null;
                //         hctrl.update();
                //       },
                //     ),
                //   );
                // }),
              ],
            ),
          ),
        );
      }),
      SizedBox(
        width: 5.2.w,
      ),
    ],
  );
}
