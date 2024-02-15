import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/addtoCartBottomSheet.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class OfferDetailedView extends StatelessWidget {
  OfferDetailedView({super.key});
  HomeController hctrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool) {
        hctrl.selectedOfferModel = null;
        hctrl.update();
      },
      child: SingleChildScrollView(
        child: Column(
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
                            borderRadius: BorderRadius.circular(11.5.h)),
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
                              "${hctrl.formatCount(hctrl.selectedOfferModel!.viewCount!)}",
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
                      Container(
                        width: 18.1.w,
                        height: 2.9.h,
                        decoration: BoxDecoration(
                            color: Appc.PrimaryColor,
                            borderRadius: BorderRadius.circular(11.5.h)),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.share_outlined,
                          size: 20,
                          color: Colors.white,
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
                    child: (hctrl.selectedOfferModel!.pages!.length! < 2)
                        ? Container(
                            width: 91.10.w,
                            height: 39.11.h,
                            child: Image.network(
                                hctrl.selectedOfferModel!.pages!.first!),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                          )
                        : FanCarouselImageSlider(
                            imagesLink: hctrl.selectedOfferModel!.pages!,
                            isAssets: false,
                            sliderHeight: 38.11.h,
                            imageRadius: 5,
                            sliderWidth: 91.10.w,
                            //showArrowNav: true,
                            imageFitMode: BoxFit.fill,
                          ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    onTap: () {
                      if (!hctrl.CardDb!
                          .containsKey(hctrl.selectedOfferModel!.id!)) {
                        if (hctrl.selectedOfferModel!.hasLink!) {
                          // launchUrl(Uri.parse(hctrl.selectedOfferModel.))
                        } else if (hctrl.selectedOfferModel!.hasItems!) {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (ctx) => addToCartBottomSheet());
                        } else {
                          hctrl.addToCard(
                              hctrl.selectedOfferModel!.id.toString(),
                              hctrl.selectedOfferModel!.name.toString(),
                              hctrl.selectedOfferModel!.pages!.first!
                                  .toString());
                          showDialog(
                              context: context,
                              builder: (ctx) => Container(
                                  alignment: Alignment.center,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Container(
                                      width: 82.89.w,
                                      height: 29.69.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Appc.PrimaryColor)),
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
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.sp,
                                                color: Appc.PrimaryColor),
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
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Appc.PrimaryColor),
                                              child: Text("Back",
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13.sp,
                                                      color: Colors.white)),
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
                            (hctrl.CardDb!
                                    .containsKey(hctrl.selectedOfferModel!.id!))
                                ? "Already in Cart"
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
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          hctrl.selectedOfferModel!.name
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
                      if (DateTime.now().isAfter(DateTime.parse(
                          hctrl.selectedOfferModel!.from!.toString())))
                        Container(
                          width: 30.w,
                          height: 3.5.h,
                          decoration: BoxDecoration(
                              color: Appc.PrimaryColor,
                              borderRadius: BorderRadius.circular(9.7.w)),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Expires in ${hctrl.CAppRelative(hctrl.selectedOfferModel!.to!, context).replaceAll("ago", "").replaceAll("in", "")}",
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
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Area Name - ${hctrl.selectedOfferModel!.shopaddress.toString()!.capitalizeFirst.toString().replaceAll("Null", "--")} ",
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
                        "${hctrl.CAppformat(hctrl.selectedOfferModel!.from!)} - ${hctrl.CAppformat(hctrl.selectedOfferModel!.to!)}",
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
                            color: Appc.PrimaryColor),
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
                        for (var data
                            in hctrl.selectedOfferModel!.groupMembers!)
                          Container(
                            width: 29.5.w,
                            height: 6.2.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.3.w),
                                border: Border.all(color: Appc.PrimaryColor)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  data.name
                                      .toString()
                                      .capitalizeFirst!
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                      color: Appc.PrimaryColor,
                                      fontSize: 8.5.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                      constraints:
                                          BoxConstraints(maxWidth: 20.w),
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
                                            fontWeight: FontWeight.w400,
                                            fontSize: 7.sp),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
