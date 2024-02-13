import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/DetailedView/Model/OfferDataModel.dart';
import 'package:show_my_deals/Screens/DetailedView/Service/Controller.dart';
import 'package:sizer/sizer.dart';

class DetailedView extends StatelessWidget {
  DetailedView({super.key});
  OfferController ofctrl = Get.put(OfferController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 8.9.h,
              child: AppBar(
                leadingWidth: 20.w,
                backgroundColor: Colors.white,
                shape: Border(
                    bottom: BorderSide(
                        width: 0.01.w, color: Colors.white.withOpacity(0.01))),
                leading: Row(
                  children: [
                    SizedBox(
                      width: 1.w,
                    ),
                    Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                    Text(
                      "Back",
                      style: GoogleFonts.poppins(color: Colors.black),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                actions: [
                  Image.asset("lib/Base/Assets/Images/favourite.png"),
                  Container(
                    width: 29.w,
                    height: 0.001.h,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 1.w,
                        ),
                        Image.asset("lib/Base/Assets/Images/Loc.png"),
                        Text(
                          "Kozhikode",
                          style: GoogleFonts.poppins(
                              fontSize: 12.5.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Image.asset("lib/Base/Assets/Images/arrowdown.png"),
                      ],
                    ),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(11.5.h)),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.6.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Container(
                        width: 18.1.w,
                        height: 2.9.h,
                        decoration: BoxDecoration(
                            color: Appc.PrimaryColor,
                            borderRadius: BorderRadius.circular(11.5.h)),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 1.5.w,
                            ),
                            SizedBox(
                                child: Icon(
                              Icons.remove_red_eye,
                              color: Colors.white,
                            )),
                            SizedBox(
                              width: 1.5.w,
                            ),
                            Text(
                              "1.1k",
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
                      Container(
                        width: 18.1.w,
                        height: 2.9.h,
                        decoration: BoxDecoration(
                            color: Appc.PrimaryColor,
                            borderRadius: BorderRadius.circular(11.5.h)),
                        child: SizedBox(
                            width: 4.7.w,
                            height: 1.76.h,
                            child: SizedBox(
                                child: Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.white,
                            ))),
                      ),
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
                        child: SizedBox(
                            height: 2.5.h,
                            child: Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    width: 92.w,
                    height: 42.82.h,
                    color: Color(0xffF6F8FF),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    width: 92.w,
                    height: 4.5.h,
                    decoration: BoxDecoration(
                        color: Appc.PrimaryColor,
                        borderRadius: BorderRadius.circular(9.7.w)),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add to Bag",
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
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Greens-Daily deals",
                        style: GoogleFonts.poppins(
                            fontSize: 12.5.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Expanded(child: Container()),
                      Container(
                        width: 26.w,
                        height: 4.5.h,
                        decoration: BoxDecoration(
                            color: Appc.PrimaryColor,
                            borderRadius: BorderRadius.circular(9.7.w)),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Expires in : 1d 3h",
                              style: GoogleFonts.poppins(
                                  fontSize: 6.sp,
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
                    height: 1.w,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Area Name-Kozhikode",
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      )),
                  SizedBox(
                    height: 1.w,
                  ),
                  Row(
                    children: [
                      Text(
                        "Validity :",
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Appc.PrimaryColor),
                      ),
                      Text(
                        "10 Aug 2023 - 12 Aug 2023",
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
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
                    width: 29.5.w,
                    height: 6.2.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.3.w),
                        border: Border.all(color: Appc.PrimaryColor)),
                    child: Column(
                      children: [
                        Text(
                          "Greens",
                          style: GoogleFonts.poppins(
                              color: Appc.PrimaryColor,
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            Image.asset("lib/Base/Assets/Images/Loc.png"),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              "Chalappuram,kozhikode",
                              style: GoogleFonts.poppins(
                                  color: Appc.LightGery,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 4.1.sp),
                            )
                          ],
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
