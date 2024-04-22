import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/Game/controller.dart';
import 'package:show_my_deals/Screens/Game/spinnerItem.dart';
import 'package:show_my_deals/src/SMDappBar.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class RewardDetailedCard extends StatefulWidget {
  Items voucher;
  RewardDetailedCard({super.key, required this.voucher});

  @override
  State<RewardDetailedCard> createState() => _RewardDetailedCardState();
}

class _RewardDetailedCardState extends State<RewardDetailedCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CappBar(isBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.2.w, vertical: 2.h),
        child: SingleChildScrollView(
          child: SizedBox(
            width: 100.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.voucher.heading!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Appc.PrimaryColor),
                ),
                SizedBox(height: 2.7.h),
                SizedBox(
                  width: 92.1.w,
                  height: 65.17.h,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        bottom: 0,
                        child: SizedBox(
                          width: 92.1.w,
                          height: 65.17.h,
                          child: Image.asset(
                            "lib/Base/Assets/Images/rewardFull.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 16.h,
                        left: 4.2.w,
                        right: 4.2.w,
                        height: 11.76.h,
                        child: Text(
                          "Congratulations\n" + widget.voucher.text!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                      if (widget.voucher.image != null &&
                          widget.voucher.image != "")
                        Positioned(
                            top: 27.h,
                            left: 4.2.w,
                            right: 4.2.w,
                            height: 6.76.h,
                            child: Image.network(widget.voucher.image!)),
                      Positioned(
                          top: 40.94.h,
                          left: 4.2.w,
                          right: 4.2.w,
                          child: Text(
                            "Valid till  ${widget.voucher.expiry!}",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.3.sp,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          )),
                      Positioned(
                          top: 45.94.h,
                          left: 4.2.w,
                          right: 4.2.w,
                          child: Text(
                            "Voucher",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 11.3.sp,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          )),
                      Positioned(
                          top: 49.94.h,
                          left: 10,
                          right: 10,
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                GameController ctrl = Get.put(GameController());
                                ctrl.loadUserVoucher();
                                if (widget.voucher.link != "" &&
                                    widget.voucher.link != null)
                                  launchUrl(Uri.parse(widget.voucher.link!));
                              },
                              child: Container(
                                width: 45.78.w,
                                height: 4.47.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              const Color.fromARGB(255, 0, 0, 0)
                                                  .withOpacity(.6),
                                          spreadRadius: .6,
                                          blurRadius: 3,
                                          offset: Offset(
                                            1,
                                            1,
                                          ))
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black),
                                child: Text(
                                  "Avail Now",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.3.sp,
                                      color: const Color.fromARGB(
                                          255, 206, 204, 204)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
