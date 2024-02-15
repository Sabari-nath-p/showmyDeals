import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/DetailedView/Model/OfferDataModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/OfferModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/shopDetailedModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/OfferCard.dart';
import 'package:sizer/sizer.dart';

class OfferView extends StatelessWidget {
  List<OfferModel>? OfferList = [];
  List<Offers>? offerList2 = [];
  String? title = "";
  OfferView({super.key, this.OfferList, this.offerList2, this.title = ""});
  HomeController hctrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if (title == "")
            GetBuilder<HomeController>(builder: (_) {
              return Container(
                height: 3.4.h,
                width: 90.2.w,
                padding: EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.withOpacity(.5))),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          hctrl.selectedTag = null;
                          hctrl.update();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(color: Appc.LightGery))),
                          child: Text(
                            "All",
                            style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: (hctrl.selectedTag == null)
                                    ? Appc.PrimaryColor
                                    : Color(0xffA8A8A8)),
                          ),
                        ),
                      ),
                      for (var data in hctrl.tgModelList)
                        InkWell(
                          onTap: () {
                            hctrl.selectedTag = data;
                            hctrl.update();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(color: Appc.LightGery))),
                            child: Text(
                              data.name!,
                              style: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: (hctrl.selectedTag == data)
                                      ? Appc.PrimaryColor
                                      : Color(0xffA8A8A8)),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 100.2.w,
            margin: EdgeInsets.symmetric(horizontal: 3.8.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffF6F8FF)),
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Appc.PrimaryColor),
                  child: Text(
                    (title != "")
                        ? "All  Deals  in $title"
                        : (hctrl.selectedTag == null)
                            ? "All  Deals  in Kozhikode"
                            : "${hctrl.selectedTag!.name!.toString().capitalizeFirst} in ${hctrl.selectedDistrict.toString().capitalizeFirst}",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 100.w,
                  alignment: Alignment.center,
                  child: Wrap(
                    spacing: 5.w,
                    runSpacing: 3.w,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runAlignment: WrapAlignment.start,
                    alignment: WrapAlignment.start,
                    children: [
                      if (title == "")
                        for (var data in OfferList!)
                          OfferCard(
                            offerData: data,
                          ),
                      if (title != "")
                        for (var data in offerList2!)
                          OfferCard(
                            offerData: OfferModel.fromJson(data.toJson()),
                          )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
