import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/appConfig.dart';
import 'package:show_my_deals/src/SMDappBar.dart';
import 'package:sizer/sizer.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CappBar(isBack: true),
      body: Container(
        width: 100.w,
        height: 100.h,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 4.w, right: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "My Rewards",
                  style: GoogleFonts.poppins(
                      color: Appc.PrimaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.6.sp),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 0.1.h,
                color: Color(0xff000000).withOpacity(.28),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                  width: 92.1.w,
                  height: 21.05.h,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Image.asset(
                              "lib/Base/Assets/Images/rewardcard.png")),
                      Positioned(
                          top: 2.3.h,
                          left: 9.3.w,
                          child: Row(
                            children: [
                              Image.asset("lib/Base/Assets/Images/clock.png"),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                "Valid till 28 Aug 01:00 pm",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 8.3.sp,
                                    color: Colors.white),
                                textAlign: TextAlign.start,
                              )
                            ],
                          )),
                      Positioned(
                        top: 6.3.h,
                        left: 9.3.w,
                        child: Row(
                          children: [
                            SizedBox(
                                child: Text(
                              "Buy\n Get 1",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.6.sp.sp,
                                color: Colors.white,
                              ),
                            )),
                            Image.asset("lib/Base/Assets/Images/Adcard.png")
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 5.w, top: 19.h),
                          child: Text(
                            " *Terms and Conditions apply",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 11.3.sp,
                                color: Colors.white),
                            textAlign: TextAlign.start,
                          ))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
