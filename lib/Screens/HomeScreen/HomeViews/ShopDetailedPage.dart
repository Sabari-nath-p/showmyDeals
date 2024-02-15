import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/OfferModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/OfferView.dart';
import 'package:show_my_deals/main.dart';
import 'package:show_my_deals/src/SMDappBar.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopDetailedPage extends StatelessWidget {
  ShopDetailedPage({super.key});
  HomeController hctrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        hctrl.selectOutletModel = null;
        hctrl.outlet = null;
        hctrl.update();
      },
      child: (hctrl.outlet == null)
          ? Container()
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 100.w,
                    height: 19.29.h,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Blur(
                            blur: 1.6,
                            colorOpacity: .2,
                            blurColor: Colors.black,
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 100.w,
                              height: 19.29.h,
                              child: Image.network(
                                hctrl.outlet!.store!.images!.bg!.url!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 3.44.h,
                            left: 6.31.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 25.0.w,
                                  height: 7.29.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: Colors.black, width: 1)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      hctrl.outlet!.store!.images!.logo!.url!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      hctrl.outlet!.store!.name
                                          .toString()
                                          .capitalizeFirst
                                          .toString(),
                                      style: GoogleFonts.poppins(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 2.h,
                                          color: Appc.PrimaryColor,
                                        ),
                                        Text(
                                          hctrl.outlet!.district
                                              .toString()
                                              .capitalizeFirst
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )),
                        Positioned(
                            bottom: 1.6.h,
                            left: 6.3.w,
                            right: 6.3.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    launchUrl(Uri.parse(
                                        "tel:+91${hctrl.outlet!.store!.contact!.phone}"));
                                  },
                                  child: Container(
                                    width: 42.w,
                                    height: 4.0.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Appc.PrimaryColor),
                                    child: Text(
                                      "Contact",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    launchUrl(Uri.parse(
                                        "${hctrl.outlet!.store!.contact!.googleMap}"));
                                  },
                                  child: Container(
                                    width: 42.w,
                                    height: 4.0.h,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Locate Us",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Appc.PrimaryColor),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  OfferView(
                    // OfferList: hctrl.outlet!.offers as List<OfferModel>,
                    offerList2: hctrl.outlet!.offers,
                    title: hctrl.outlet!.store!.name
                        .toString()
                        .capitalizeFirst
                        .toString(),
                  )
                ],
              ),
            ),
    );
  }
}
