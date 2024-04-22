import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/ShimmerScreen/offerShimmerScreen.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/ShopDetailedPage.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/addtoCartBottomSheet.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/OfferModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:show_my_deals/appConfig.dart';
import 'package:show_my_deals/dynamicLinkConfig.dart';
import 'package:show_my_deals/main.dart';
import 'package:show_my_deals/src/FlashMessage.dart';
import 'package:show_my_deals/src/SMDappBar.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class OfferDetailedView extends StatefulWidget {
  String offerID;
  OfferDetailedView({super.key, required this.offerID});

  @override
  State<OfferDetailedView> createState() => _OfferDetailedViewState();
}

class _OfferDetailedViewState extends State<OfferDetailedView> {
  HomeController hctrl = Get.put(HomeController());

  OfferModel? offer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadOffer();
  }

  loadOffer() async {
    final Response = await get(Uri.parse(AppConfig.endpoint +
        "${hctrl.selectedDistrict}/offer/" +
        widget.offerID));
    print(AppConfig.endpoint +
        "${hctrl.selectedDistrict}/offer/" +
        widget.offerID);
    print(Response.body);
    if (Response.statusCode == 200) {
      offer = OfferModel.fromJson(json.decode(Response.body)["offer"]);
      setState(() {});
    } else {
      FlashMessage("Offer unavalible", "This offer is currently unavaliable");
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CappBar(isBack: true),
      body: SingleChildScrollView(
        child: (offer == null)
            ? offerShimmerEffect()
            : GetBuilder<HomeController>(builder: (_) {
                return Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.2.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: Container()),
                              Container(
                                // width: 18.1.w,
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                height: 2.9.h,
                                decoration: BoxDecoration(
                                    color: Appc.PrimaryColor,
                                    borderRadius:
                                        BorderRadius.circular(11.5.h)),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    SizedBox(
                                        child: Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                                    SizedBox(
                                      width: 1.5.w,
                                    ),
                                    Text(
                                      "${hctrl.formatCount(offer!.viewCount!)}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              // Container(
                              //   width: 18.1.w,
                              //   height: 2.9.h,
                              //   decoration: BoxDecoration(
                              //       color: Appc.PrimaryColor,
                              //       borderRadius: BorderRadius.circular(11.5.h)),
                              //   child: Icon(
                              //     Icons.favorite_border_outlined,
                              //     size: 20,
                              //     color: Colors.white,
                              //   ),
                              // ),
                              SizedBox(
                                width: 1.w,
                              ),
                              InkWell(
                                onTap: () {
                                  // createDynamicLink();
                                  print("working");
                                  Share.share(
                                      'Checkout this offer from showmydeals https://www.showmydeals.in/${offer!.district}/offer/${offer!.id!}');
                                },
                                child: Container(
                                  width: 18.1.w,
                                  height: 2.9.h,
                                  decoration: BoxDecoration(
                                      color: Appc.PrimaryColor,
                                      borderRadius:
                                          BorderRadius.circular(11.5.h)),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.share_outlined,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                              width: 92.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffF6F8FF)),
                              height: 42.82.h,
                              child: CarouselSlider(
                                  items: [
                                    for (var data in offer!.pages!)
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                              // barrierColor: Colors.white10,
                                              context: context,
                                              builder: (_) => Material(
                                                    color: Colors.white12,
                                                    child: Container(
                                                      width: 100.w,
                                                      height: 100.h,
                                                      child: Stack(
                                                        children: [
                                                          Positioned(
                                                            top: 0,
                                                            bottom: 0,
                                                            right: 0,
                                                            left: 0,
                                                            child: Container(
                                                              width: 95.w,
                                                              height: 96.h,
                                                              child: PhotoView(
                                                                maxScale:
                                                                    PhotoViewComputedScale
                                                                            .contained *
                                                                        1.5,
                                                                basePosition:
                                                                    Alignment
                                                                        .center,
                                                                initialScale:
                                                                    PhotoViewComputedScale
                                                                        .contained,
                                                                minScale:
                                                                    PhotoViewComputedScale
                                                                        .contained,
//minScale: .4,
                                                                imageProvider:
                                                                    NetworkImage(
                                                                        data),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                              right: 10,
                                                              top: 10,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  Get.back();
                                                                },
                                                                child: Icon(
                                                                  Icons.close,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                  ));
                                        },
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              data,
                                              fit: BoxFit.fill,
                                            )),
                                      )
                                  ],
                                  options: CarouselOptions(
                                      enlargeCenterPage: true,
                                      height: 42.82.h,
                                      autoPlay: true,
                                      viewportFraction: .7))),
                          SizedBox(
                            height: 2.h,
                          ),
                          InkWell(
                            onTap: () {
                              if (!hctrl.CardDb!.containsKey(offer!.id!)) {
                                if (offer!.hasItems!) {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      builder: (ctx) => addToCartBottomSheet(
                                            offer: offer!,
                                          ));
                                } else {
                                  hctrl.addToCard(
                                      offer!.id.toString(),
                                      offer!.name.toString(),
                                      offer!.pages!.first!.toString(),
                                      offer!);
                                  hctrl.update();
                                  showDialog(
                                      context: context,
                                      builder: (ctx) => Container(
                                          alignment: Alignment.center,
                                          child: Material(
                                            color: Colors.transparent,
                                            child: Container(
                                              width: 82.89.w,
                                              height: 33.69.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color:
                                                          Appc.PrimaryColor)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 31.31.w,
                                                    height: 31.31.w,
                                                    child: LottieBuilder.asset(
                                                        "lib/Base/Assets/Images/loading.json"),
                                                  ),
                                                  Text(
                                                    "Added to Bag",
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15.sp,
                                                        color:
                                                            Appc.PrimaryColor),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      width: 26.57.w,
                                                      height: 3.5.h,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: Appc
                                                              .PrimaryColor),
                                                      child: Text("Back",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      13.sp,
                                                                  color: Colors
                                                                      .white)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )));
                                }
                              }
                            },
                            child: Container(
                              width: 92.w,
                              height: 5.5.h,
                              decoration: BoxDecoration(
                                  color: Appc.PrimaryColor,
                                  borderRadius: BorderRadius.circular(9.7.w)),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    (hctrl.CardDb!.containsKey(widget.offerID))
                                        ? "Added to Bag"
                                        : "Add to Bag",
                                    style: GoogleFonts.poppins(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Image.asset("lib/Base/Assets/Images/bag.png"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          if (offer!.hasLink!)
                            InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(offer!.link!));
                              },
                              child: Container(
                                width: 92.w,
                                height: 5.5.h,
                                decoration: BoxDecoration(
                                    color: Appc.PrimaryColor,
                                    borderRadius: BorderRadius.circular(9.7.w)),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      offer!.linkText
                                          .toString()
                                          .replaceAll("null", "View Details"),
                                      style: GoogleFonts.poppins(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    // SizedBox(
                                    //   width: 1.w,
                                    // ),
                                    // Image.asset("lib/Base/Assets/Images/bag.png"),
                                  ],
                                ),
                              ),
                            ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  offer!.name
                                      .toString()
                                      .capitalizeFirst
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 12.5.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                              //   Expanded(child: Container()),
                              if (false)
                                if (DateTime.now().isAfter(
                                    DateTime.parse(offer!.from!.toString())))
                                  Container(
                                    width: 30.w,
                                    height: 3.5.h,
                                    decoration: BoxDecoration(
                                        color: Appc.PrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(9.7.w)),
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Expires in ${hctrl.CAppRelative(offer!.to!, context).replaceAll("ago", "").replaceAll("in", "")}",
                                          style: GoogleFonts.poppins(
                                              fontSize: 7.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                      ],
                                    ),
                                  ),
                              SizedBox(
                                width: 1.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.w,
                          ),
                          if (false)
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Area Name - ${offer!.shopaddress.toString()!.capitalizeFirst.toString().replaceAll("Null", "--")} ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                )),
                          SizedBox(
                            height: 1.w,
                          ),
                          Row(
                            children: [
                              Text(
                                "Validity : ",
                                style: GoogleFonts.poppins(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Appc.PrimaryColor),
                              ),
                              Text(
                                "${hctrl.CAppformat(offer!.from!)} - ${hctrl.CAppformat(offer!.to!)}",
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Stores where this offer is available",
                                style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54),
                              )),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            width: 100.w,
                            alignment: Alignment.centerLeft,
                            child: Wrap(
                              runSpacing: 10,
                              spacing: 2,
                              runAlignment: WrapAlignment.start,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: [
                                for (var data in offer!.groupMembers!)
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => ShopDetailedPage(
                                          shopid: data.id!.toString()));
                                    },
                                    child: Container(
                                      width: 29.5.w,
                                      height: 8.2.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1.3.w),
                                          border: Border.all(
                                              color: Appc.PrimaryColor)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            data.name
                                                .toString()
                                                .capitalizeFirst!
                                                .toString(),
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                                color: Appc.PrimaryColor,
                                                fontSize: 8.5.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 3.w,
                                                child: Icon(
                                                  Icons.location_on,
                                                  size: 16,
                                                  color: Appc.PrimaryColor,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Container(
                                                constraints: BoxConstraints(
                                                    maxWidth: 20.w),
                                                //width: 20.w,
                                                child: Text(
                                                  data.address
                                                      .toString()
                                                      .capitalizeFirst
                                                      .toString(),
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                      color: Color(0xff707070),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 7.sp),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }),
      ),
    );
  }
}
