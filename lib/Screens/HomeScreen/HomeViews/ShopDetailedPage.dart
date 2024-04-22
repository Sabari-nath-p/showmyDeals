import 'dart:convert';
import 'dart:developer';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/ShimmerScreen/shopDetailedPage.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/OfferModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/shopDetailedModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/OfferView.dart';
import 'package:show_my_deals/appConfig.dart';
import 'package:show_my_deals/main.dart';
import 'package:show_my_deals/src/SMDappBar.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../src/FlashMessage.dart';

class ShopDetailedPage extends StatefulWidget {
  String shopid;
  ShopDetailedPage({super.key, required this.shopid});

  @override
  State<ShopDetailedPage> createState() => _ShopDetailedPageState();
}

class _ShopDetailedPageState extends State<ShopDetailedPage> {
  HomeController hctrl = Get.put(HomeController());

  OutletDetailedModel? outlet;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadShop();
  }

  loadShop() async {
    final Respose = await get(
        Uri.parse(AppConfig.endpoint +
            "${hctrl.selectedDistrict}/outlet/${widget.shopid}"),
        headers: hctrl.header);
    log("Request -->" +
        AppConfig.endpoint +
        "${hctrl.selectedDistrict}/outlet/${widget.shopid}" +
        " --> ${Respose.statusCode}");
    print(Respose.body);

    if (Respose.statusCode == 200) {
      outlet = OutletDetailedModel.fromJson(json.decode(Respose.body));
      setState(() {});
    } else {
      FlashMessage("Store unavaliable",
          "Something went worng. Please try after some time");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CappBar(isBack: true),
      body: (outlet == null)
          ? ShopDetailedPageShimmer()
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
                                outlet!.store!.images!.bg!.url!,
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
                                      outlet!.store!.images!.logo!.url!,
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
                                      outlet!.store!.name
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
                                          outlet!.district
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
                                        "tel:+91${outlet!.store!.contact!.phone}"));
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
                                        "${outlet!.store!.contact!.googleMap}"));
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
                  if (!outlet!.activeOffers!.isEmpty)
                    OfferView(
                      // OfferList: outlet!.offers as List<OfferModel>,
                      offerList2: outlet!.activeOffers,
                      title: outlet!.store!.name
                          .toString()
                          .capitalizeFirst
                          .toString(),
                    ),
                  OfferView(
                    // OfferList: outlet!.offers as List<OfferModel>,
                    offerList2: outlet!.oldOffers,
                    isHeading: false, // outlet!.activeOffers!.isEmpty,
                    title: outlet!.store!.name
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
