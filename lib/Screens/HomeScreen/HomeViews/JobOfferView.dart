import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/JobDetailedScreen.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/JobModel.dart';
import 'package:show_my_deals/main.dart';
import 'package:sizer/sizer.dart';

import '../service/HomeController.dart';

class JobOfferView extends StatefulWidget {
  JobOfferView({super.key});

  @override
  State<JobOfferView> createState() => _JobOfferViewState();
}

class _JobOfferViewState extends State<JobOfferView> {
  HomeController hctrl = Get.put(HomeController());
  String SelectedDistrict = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 3.4.h,
            width: 90.2.w,
            padding: EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.withOpacity(.5))),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // if (isHeading)
                  InkWell(
                    onTap: () {
                      SelectedDistrict = "";
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(
                          border:
                              Border(right: BorderSide(color: Appc.LightGery))),
                      child: Text(
                        "All",
                        style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: (SelectedDistrict == "")
                                ? Appc.PrimaryColor
                                : Color(0xffA8A8A8)),
                      ),
                    ),
                  ),
                  // if (isHeading)
                  for (var data in DistrictList)
                    InkWell(
                      onTap: () {
                        setState(() {
                          SelectedDistrict = data;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(color: Appc.LightGery))),
                        child: Text(
                          data!.toString().capitalize!,
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: (SelectedDistrict == data)
                                  ? Appc.PrimaryColor
                                  : Color(0xffA8A8A8)),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
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
                if (SelectedDistrict != "")
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Appc.PrimaryColor),
                    child: Text(
                      "All Jobs from ${SelectedDistrict.toString().capitalizeFirst.toString()}",
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
                  alignment: Alignment.center,
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      for (var data in hctrl.jobList)
                        if (data.districts!.contains(SelectedDistrict) ||
                            SelectedDistrict == "")
                          InkWell(
                            onTap: () {
                              Get.to(
                                  () => JobDetailedScreen(
                                        model: data,
                                      ),
                                  transition: Transition.rightToLeft);
                            },
                            child: Container(
                              width: 150,
                              height: 230,
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
