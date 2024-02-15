import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/DetailedView/Views/DetailedView.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/OfferModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:sizer/sizer.dart';

class OfferCard extends StatelessWidget {
  OfferModel offerData;
  OfferCard({super.key, required this.offerData});
  HomeController hctrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  Get.to(() => DetailedView());
        hctrl.selectedOfferModel = offerData;
        hctrl.update();
      },
      child: Container(
        width: 39.4.w,
        height: 26.11.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  offerData.thumbnail!.url!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
                bottom: 1.8.h,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  height: 5.3.h,
                  color: Colors.white.withOpacity(.83),
                  child: Row(
                    children: [
                      Container(
                        width: 13.77.w,
                        height: 4.39.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black, width: 1)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            offerData.logo!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        width: 14.9.w,
                        height: 2.9.h,
                        alignment: Alignment.center,
                        child: Text(
                          "${offerData.pages!.length} Pages",
                          style: GoogleFonts.poppins(
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Appc.PrimaryColor,
                            borderRadius: BorderRadius.circular(20)),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}