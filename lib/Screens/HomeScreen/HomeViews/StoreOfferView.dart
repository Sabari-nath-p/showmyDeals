import 'dart:convert';
import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/GroupOffer.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/ShopDetailedPage.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/shopDetailedModel.dart';
import 'package:show_my_deals/appConfig.dart';
import 'package:show_my_deals/src/FlashMessage.dart';
import 'package:sizer/sizer.dart';

import '../service/HomeController.dart';

class StoreOfferView extends StatelessWidget {
  StoreOfferView({super.key});

  HomeController hctrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
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
              GetBuilder<HomeController>(builder: (_) {
                return Container(
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
                        InkWell(
                          onTap: () {
                            hctrl.selectedStoreTag = "";

                            hctrl.update();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(color: Appc.LightGery))),
                            child: Text(
                              "All",
                              style: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: (hctrl.selectedStoreTag == "")
                                      ? Appc.PrimaryColor
                                      : Color(0xffA8A8A8)),
                            ),
                          ),
                        ),
                        for (var data in hctrl.contentModel!.storeTags!)
                          InkWell(
                            onTap: () {
                              hctrl.selectedStoreTag = data.tag!;
                              // hctrl.loadOffers();
                              hctrl.update();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right:
                                          BorderSide(color: Appc.LightGery))),
                              child: Text(
                                data.name!,
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: (hctrl.selectedStoreTag == data.tag)
                                        ? Appc.PrimaryColor
                                        : Color(0xffA8A8A8)),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Appc.PrimaryColor),
                child: Text(
                  (hctrl.selectedStoreTag == "")
                      ? "All Stores from ${hctrl.selectedDistrict.toString().capitalizeFirst.toString()}"
                      : "All ${hctrl.selectedStoreTag.replaceAll("-", " ").capitalize.toString()} from ${hctrl.selectedDistrict.toString().capitalizeFirst.toString()}",
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
                  children: [
                    for (var data in hctrl.outletList)
                      if (hctrl.selectedStoreTag == "" ||
                          hctrl.selectedStoreTag == data.storeType)
                        if (!data.isInGroup!)
                          FadeIn(
                            child: InkWell(
                              onTap: () {
                                if (data.isShop!) {
                                  hctrl.selectOutletModel = data;

                                  Get.to(() => ShopDetailedPage(
                                        shopid: data.id!,
                                      ));
                                  hctrl.update();
                                } else {
                                  Get.to(
                                      () => GrouOfferScreen(
                                            id: data.id!,
                                            name: data.name!,
                                            thumbnail: data!.images!.logo!.url!,
                                          ),
                                      transition: Transition.rightToLeft);
                                }
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 39.73.w,
                                    height: 11.76.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        data!.images!.logo!.url!,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 39.73.w,
                                    child: Text(
                                      data.name!,
                                      style: GoogleFonts.poppins(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 39.73.w,
                                    child: Text(
                                      (data.isShop!)
                                          ? data.address!
                                          : "All stores in ${data.district}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black45),
                                    ),
                                  )
                                ],
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
    );
  }
}
