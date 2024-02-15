import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/main.dart';
import 'package:show_my_deals/src/SMDappBar.dart';
import 'package:sizer/sizer.dart';

class JobDetailedScreen extends StatelessWidget {
  const JobDetailedScreen({super.key});

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
                Container(
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
                  left: 10.78.w, right: 10.78.w, top: 2.8.h, bottom: 4.8.h),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                    "http://res.cloudinary.com/djodvwkdf/image/upload/v1707036167/thumbs/luwkatltgmhnadcahu9d.jpg"),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffF6F8FF)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.26.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Show My Deals",
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
                  Row(
                    children: [
                      Text(
                        "Position :  ",
                        style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: Appc.PrimaryColor),
                      ),
                      Text(
                        "Sales Executive, Office Assistant",
                        style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Location :  ",
                        style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: Appc.PrimaryColor),
                      ),
                      Text(
                        "Ashokapuram",
                        style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.9.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 6.8.w),
                    height: 5.5.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Appc.PrimaryColor),
                    child: Text(
                      "Continue",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16.66.sp,
                          fontWeight: FontWeight.w600),
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
