import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/JobOfferView.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/OfferCard.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/OfferView.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/ShimmerScreen/HomeShimmerEffect.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/StoreOfferView.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../service/HomeController.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  HomeController hctrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return (hctrl.contentModel == null)
        ? HomeScreenShimmer()
        : SingleChildScrollView(
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
                              left: 3.2.w,
                              top: .5.h,
                              bottom: .5.h,
                              child: InkWell(
                                onTap: () {
                                  hctrl.TopMenu = 0;
                                  hctrl.update();
                                },
                                child: Container(
                                  width: 26.31.w,
                                  alignment: Alignment.center,
                                  height: 4.2.h,
                                  //  color: Colors.white,
                                  child: Text(
                                    "Deals",
                                    style: GoogleFonts.poppins(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 30.5.w,
                              top: 10,
                              bottom: 10,
                              child: InkWell(
                                onTap: () {
                                  hctrl.TopMenu = 1;
                                  hctrl.update();
                                },
                                child: Container(
                                  width: 28.w,
                                  height: 4.5.h,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Jobs",
                                    style: GoogleFonts.poppins(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 64.05.w,
                              top: 10,
                              bottom: 10,
                              child: InkWell(
                                onTap: () {
                                  hctrl.TopMenu = 2;
                                  hctrl.update();
                                },
                                child: Container(
                                  width: 28.w,
                                  height: 4.5.h,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Stores",
                                    style: GoogleFonts.poppins(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
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
                    if (hctrl.contentModel != null &&
                        hctrl.contentModel!.ads!.length > 0)
                      Container(
                        width: 100.1.w,
                        height: 24.82.h,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: .9,
                            enlargeCenterPage: true,
                            height: 24.82.h,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 4),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                          ),
                          items: [
                            for (var data in hctrl.contentModel!.ads!)
                              InkWell(
                                onTap: () {
                                  if (data.isLink!) {
                                    launchUrl(Uri.parse(data.link!),
                                        mode: LaunchMode.inAppBrowserView);
                                  }
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    data.image!,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      )
                    else
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
                    if (hctrl.TopMenu == 0)
                      OfferView(
                        OfferList: hctrl.offerList,
                      ),
                    if (hctrl.TopMenu == 1) JobOfferView(),
                    if (hctrl.TopMenu == 2) StoreOfferView(),
                    SizedBox(
                      height: 8.h,
                    )
                  ],
                );
              }),
            ),
          );
  }
}
