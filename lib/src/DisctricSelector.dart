import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/Game/controller.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:show_my_deals/main.dart';
import 'package:sizer/sizer.dart';

class DisctrictSelector extends StatefulWidget {
  const DisctrictSelector({super.key});

  @override
  State<DisctrictSelector> createState() => _DisctrictSelectorState();
}

class _DisctrictSelectorState extends State<DisctrictSelector> {
  String SelectedDistrict = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SelectedDistrict = ctrl.selectedDistrict!;
  }

  HomeController ctrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 0.2.w, vertical: 4.w),
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Text(
            "Select District",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, fontSize: 13.sp),
          ),
          SizedBox(
            height: 2.w,
          ),
          Container(
            width: 100.w,
            height: 1,
            color: Colors.grey.withOpacity(.3),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                for (var data in DistrictList)
                  InkWell(
                    onTap: () {
                      setState(() {
                        SelectedDistrict = data;
                      });
                    },
                    child: Container(
                      width: 100.w,
                      height: 4.5.h,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 4.2.w),
                      margin:
                          EdgeInsets.symmetric(horizontal: 4.2.w, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Container(
                            width: 5.w,
                            height: 5.w,
                            decoration: BoxDecoration(
                                color: (SelectedDistrict == data)
                                    ? Appc.PrimaryColor
                                    : Colors.white,
                                border: Border.all(color: Colors.black45),
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            data.toString().capitalize!,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400, fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          )),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.8.w),
                  height: 4.5.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Appc.PrimaryColor),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Text(
                    "Cancel",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Appc.PrimaryColor,
                        fontSize: 12.66.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  GameController gctrl = Get.put(GameController());
                  // context.deleteAccount();
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.setString("DISTRICT", SelectedDistrict);

                  ctrl.loadOffers();
                  ctrl.loadJobs();
                  ctrl.loadShopes();
                  ctrl.selectedTag = null;
                  ctrl.selectedDistrict = SelectedDistrict;
                  ctrl.selectedJobModel = null;
                  ctrl.selectedOfferModel = null;
                  ctrl.selectOutletModel = null;
                  gctrl.fetchData();
                  ctrl.update();
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.8.w),
                  height: 4.5.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Appc.PrimaryColor),
                  child: Text(
                    "Change",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 12.66.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
