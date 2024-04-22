import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/Reward/Components/RewardCard.dart';
import 'package:show_my_deals/Screens/Game/controller.dart';
import 'package:show_my_deals/appConfig.dart';
import 'package:show_my_deals/src/SMDappBar.dart';
import 'package:sizer/sizer.dart';

class RewardScreen extends StatelessWidget {
  RewardScreen({super.key});

  GameController gctrl = Get.put(GameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CappBar(isBack: true),
      body: GetBuilder<GameController>(builder: (context) {
        return Container(
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
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      if (!gctrl.voucherList.isEmpty)
                        for (var data in gctrl.voucherList)
                          RewardCard(Voucher: data)
                      else
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 22.h,
                              ),
                              Image.asset(
                                "lib/Base/Assets/Images/rewards.png",
                                color: Appc.PrimaryColor,
                              ),
                              Text(
                                "No Rewards",
                                style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                ))
              ],
            ),
          ),
        );
      }),
    );
  }
}
