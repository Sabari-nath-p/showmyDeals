import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/offerDetailedView.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:show_my_deals/main.dart';
import 'package:show_my_deals/src/FlashMessage.dart';
import 'package:sizer/sizer.dart';

class AddBagScreen extends StatelessWidget {
  const AddBagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController hctrl = Get.put(HomeController());
    return Container(
      width: 100.w,
      height: 100.h,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: 2.4.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 1.753.h,
              ),
              for (var data in hctrl.CartList)
                InkWell(
                  onTap: () {
                    print(data.offerID);
                    if (data.to!.compareTo(DateTime.now().toString()) > 0)
                      Get.to(
                          () => OfferDetailedView(
                              offerID: data.offerID.toString()),
                          transition: Transition.rightToLeft);
                    else {
                      FlashMessage("Oops! Offer expired",
                          "Looks like the offer has zipped away!");
                      hctrl.removeFromCart(data.itemID!);
                    }
                  },
                  child: Container(
                    width: 92.01.w,
                    //    height: 6.7.h,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffF6F8FF)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                          width: 16.8.w,
                          height: 4.7.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              data.ImageUrl!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xffD9D9D9D),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              data.itemName!,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 7.5.sp),
                            ),
                            Text(
                              data.offerName!,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 7.sp,
                                  color: Colors.black),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Validity : ",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 7.sp,
                                      color: Appc.PrimaryColor),
                                ),
                                Text(
                                  "${hctrl.CAppformat2(data.from!)} - ${hctrl.CAppformat2(data.to!)}",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 7.sp,
                                      color: Colors.black),
                                ),
                              ],
                            )
                          ],
                        ),
                        Expanded(child: Container()),
                        InkWell(
                          onTap: () {
                            hctrl.removeFromCart(data.itemID!);
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
                                              "Removed from Bag",
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
                                                        BorderRadius.circular(
                                                            20),
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
                          },
                          child: Container(
                            width: 13.4.w,
                            height: 3.3.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(29.w),
                                color: Appc.PrimaryColor),
                            child: SizedBox(
                                height: 4.2.w,
                                width: 4.2.w,
                                child: Image.asset(
                                    "lib/Base/Assets/Images/deleteicon.png")),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                      ],
                    ),
                  ),
                ),
              if (hctrl.CartList.isEmpty)
                Container(
                    margin: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
                    child: Image.asset("lib/Base/Assets/Images/EmptyCart.png")),
              SizedBox(
                height: 1.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
