import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/HomeScreen/views/OfferCard.dart';
import 'package:sizer/sizer.dart';

import '../service/HomeController.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  HomeController hctrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white.withOpacity(.9),
        child: GetBuilder<HomeController>(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 21,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 92.1.w,
                  height: 5.2.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.black),
                  child: Stack(
                    children: [
                      Positioned(
                          top: .5.h,
                          bottom: .5.h,
                          left: .5.h,
                          //right: .5.h,
                          child: AnimatedContainer(
                            width: 26.29.w,
                            height: .5.h,
                            margin: EdgeInsets.symmetric(
                                horizontal: (hctrl.TopMenu * 31.5.w)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: Appc.PrimaryColor),
                            curve: Curves.easeInOut,
                            duration: Duration(milliseconds: 500),
                          )),
                      Positioned(
                        left: 7.89.w,
                        top: 1.5.h,
                        bottom: 1.5.h,
                        child: InkWell(
                          onTap: () {
                            hctrl.TopMenu = 0;
                            hctrl.update();
                          },
                          child: Text(
                            "Deals",
                            style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 40.5.w,
                        top: 10,
                        bottom: 10,
                        child: InkWell(
                          onTap: () {
                            hctrl.TopMenu = 1;
                            hctrl.update();
                          },
                          child: Text(
                            "Jobs",
                            style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 71.05.w,
                        top: 10,
                        bottom: 10,
                        child: InkWell(
                          onTap: () {
                            hctrl.TopMenu = 2;
                            hctrl.update();
                          },
                          child: Text(
                            "Stores",
                            style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 90.1.w,
                height: 18.82.h,
                child: Image.asset(
                  "lib/Base/Assets/Images/banner1.png",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 3.4.h,
                width: 90.2.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.withOpacity(.5))),
                child: Row(
                  children: [
                    for (var data in [
                      "All",
                      "Trending Offer",
                      "Grocerry",
                      "Gadget"
                    ])
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(color: Appc.LightGery))),
                        child: Text(
                          data,
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: Appc.LightGery),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
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
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Appc.PrimaryColor),
                      child: Text(
                        "All  Deals in Kozhikode",
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
                      child: Wrap(
                        spacing: 5.w,
                        runSpacing: 3.w,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runAlignment: WrapAlignment.center,
                        alignment: WrapAlignment.center,
                        children: [for (int i = 0; i < 20; i++) OfferCard()],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
