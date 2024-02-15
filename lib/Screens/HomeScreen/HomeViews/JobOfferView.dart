import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/JobDetailedScreen.dart';
import 'package:sizer/sizer.dart';

import '../service/HomeController.dart';

class JobOfferView extends StatelessWidget {
  JobOfferView({super.key});
  HomeController hctrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 100.2.w,
            margin: EdgeInsets.symmetric(horizontal: 3.8.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffF6F8FF)),
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Appc.PrimaryColor),
                  child: Text(
                    "All Stores from ${hctrl.selectedDistrict.toString().capitalizeFirst.toString()}",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 100.w,
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 5.w,
                    runSpacing: 3.w,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runAlignment: WrapAlignment.center,
                    alignment: WrapAlignment.start,
                    children: [
                      for (var data in hctrl.jobList)
                        InkWell(
                          onTap: () {
                            Get.to(() => JobDetailedScreen());
                          },
                          child: Container(
                            width: 41.54.w,
                            height: 26.35.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                data.thumbnail!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
