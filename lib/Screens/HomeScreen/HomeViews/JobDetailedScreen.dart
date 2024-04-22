import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/JobModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:show_my_deals/main.dart';
import 'package:show_my_deals/src/SMDappBar.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetailedScreen extends StatelessWidget {
  JobModel model;

  JobDetailedScreen({super.key, required this.model});
  HomeController ctrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CappBar(isBack: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (false)
                  Container(
                    width: 14.21.w,
                    height: 2.9.h,
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Appc.PrimaryColor),
                  ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    print("working");
                    Share.share(
                        'Checkout this job from showmydeals https://www.showmydeals.in/${model.districts!.first.toString()}/jobs/${model!.id!}');
                  },
                  child: Container(
                    width: 14.21.w,
                    height: 2.9.h,
                    child: Icon(
                      Icons.share_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Appc.PrimaryColor),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(5.26.w),
              width: 92.1.w,
              height: 47.17.h,
              padding: EdgeInsets.only(
                  left: 1.78.w, right: 1.78.w, top: 2.8.h, bottom: 2.8.h),
              alignment: Alignment.center,
              child: CarouselSlider(
                  items: [
                    for (var data in model.pages!)
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
                                                maxScale: .6,
                                                initialScale:
                                                    PhotoViewComputedScale
                                                        .contained,
                                                minScale: PhotoViewComputedScale
                                                    .contained,
                                                imageProvider:
                                                    NetworkImage(data),
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
                                                  color: Colors.white,
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ));
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
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
                      viewportFraction: .8)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffF6F8FF)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.26.w),
              child: Column(
                children: [
                  if (false)
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "", //   "${ctrl.selectedJobModel!.id!}",
                            style: GoogleFonts.poppins(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          width: 25.35.w,
                          height: 3.35.h,
                          alignment: Alignment.center,
                          child: Text(
                            "Go to Maps",
                            style: GoogleFonts.poppins(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w500,
                                color: Appc.PrimaryColor),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    spreadRadius: .4,
                                    blurRadius: 2,
                                    color: Colors.grey.withOpacity(.2))
                              ]),
                        )
                      ],
                    ),
                  SizedBox(
                    height: 8,
                  ),
                  if (false)
                    Row(
                      children: [
                        Text(
                          "Avaliable in :  ",
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: Appc.PrimaryColor),
                        ),
                        Expanded(
                          child: Text(
                            "${model.districts!.join(', ')}",
                            style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  if (false)
                    Row(
                      children: [
                        Text(
                          "Location :  ",
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: Appc.PrimaryColor),
                        ),
                        Expanded(
                          child: Text(
                            "${model.location!}",
                            style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 10.9.h,
                  ),
                  InkWell(
                    onTap: () {
                      launchUrl(
                          Uri.parse(
                            model.applyLink!,
                          ),
                          mode: LaunchMode.externalApplication);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 6.8.w),
                      height: 5.5.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Appc.PrimaryColor),
                      child: Text(
                        "Apply Now",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16.66.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
