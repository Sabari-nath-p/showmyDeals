import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/OfferModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:sizer/sizer.dart';

class addToCartBottomSheet extends StatefulWidget {
  OfferModel offer;
  addToCartBottomSheet({super.key, required this.offer});

  @override
  State<addToCartBottomSheet> createState() => _addToCartBottomSheetState();
}

class _addToCartBottomSheetState extends State<addToCartBottomSheet> {
  HomeController hctrl = Get.put(HomeController());
  List<Items> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.11.h,
      padding: EdgeInsets.symmetric(horizontal: 7.8.w, vertical: 3.1.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          color: Colors.white),
      width: 100.w,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 5.2.w,
                height: 5.2.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Appc.PrimaryColor)),
                child: Icon(
                  Icons.close,
                  size: 15,
                  color: Appc.PrimaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 90.5.w,
            height: 2.8.h,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 4.2.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Appc.PrimaryColor),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Products",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),
                Text(
                  "Add",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
                SizedBox(
                  width: 8.9.w,
                )
              ],
            ),
          ),
          Container(
            height: 25.88.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Appc.LightGery,
                  ),
                  for (var data in widget.offer!.items!)
                    Container(
                      height: 5.88.h,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Appc.LightGery))),
                      //padding: EdgeInsets.symmetric(horizontal: 7.8.w),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 15.15.w,
                            height: 4.7.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                data.image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: Text(
                            data.itemname!,
                            style: GoogleFonts.poppins(
                                fontSize: 10.sp, fontWeight: FontWeight.w500),
                          )),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (!selectedItem.contains(data) &&
                                    !hctrl.CardDb!.containsKey(data.itemid))
                                  selectedItem.add(data);
                                ;
                              });
                            },
                            child: CircleAvatar(
                                backgroundColor: Appc.PrimaryColor,
                                child: (selectedItem.contains(data) ||
                                        hctrl.CardDb!.containsKey(data.itemid))
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      )),
                          ),
                          SizedBox(
                            width: 12.w,
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.5.h,
          ),
          InkWell(
            onTap: () {
              for (var data in selectedItem) {
                hctrl.addToCard(
                    data.itemid!, data.itemname!, data.image!, widget.offer);
              }
              print("Working");
              Get.back();
              if (selectedItem.isNotEmpty)
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
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                                border: Border.all(color: Appc.PrimaryColor)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                        borderRadius: BorderRadius.circular(20),
                                        color: Appc.PrimaryColor),
                                    child: Text("Back",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.sp,
                                            color: Colors.white)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )));

              //Get.back();
            },
            child: Container(
              width: 71.8.w,
              height: 4.5.h,
              decoration: BoxDecoration(
                  color: (selectedItem.isEmpty)
                      ? Appc.LightGery
                      : Appc.PrimaryColor,
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
          )
        ],
      ),
    );
  }
}
