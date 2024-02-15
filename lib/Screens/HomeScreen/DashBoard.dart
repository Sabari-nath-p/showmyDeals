import 'package:blur/blur.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/DetailedView/Views/DetailedView.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/HomeScreen.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/JobDetailedScreen.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/OfferView.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/ShopDetailedPage.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/offerDetailedView.dart';
import 'package:show_my_deals/main.dart';
import 'package:show_my_deals/src/SMDappBar.dart';
import 'package:sizer/sizer.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<String> listIcon = [
    "homeIcon.png",
    "carticon.png",
    "gameicon.png",
    "feedIcon.png",
    "profileIcon.png"
  ];

  String bottomSelected = "homeIcon.png";

  HomeController hctrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CappBar(),
      body: GetBuilder<HomeController>(builder: (_) {
        return Stack(
          children: [
            if (bottomSelected == listIcon[0])
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (hctrl.selectedOfferModel != null)
                      Expanded(child: OfferDetailedView())
                    else if (hctrl.selectedJobModel != null)
                      Expanded(child: JobDetailedScreen())
                    else if (hctrl.selectOutletModel != null)
                      Expanded(child: ShopDetailedPage())
                    else
                      Expanded(child: HomeScreen())
                  ],
                ),
              ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (hctrl.selectedOfferModel != null)
                    Expanded(child: OfferDetailedView())
                  else if (hctrl.selectedJobModel != null)
                    Expanded(child: JobDetailedScreen())
                  else if (hctrl.selectOutletModel != null)
                    Expanded(child: ShopDetailedPage())
                  else
                    Expanded(child: HomeScreen())
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                height: 6.7.h,
                child: Blur(
                  blur: 1.2,
                  blurColor: Colors.black,
                  colorOpacity: .2,
                  child: Container(
                    color: Colors.white.withOpacity(.7),
                  ),
                )),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                height: 6.7.h,
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var data in listIcon)
                          InkWell(
                            onTap: () {
                              setState(() {
                                bottomSelected = data;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 6.1.w),
                              width: 7.8.w,
                              height: 10.8.w,
                              child: Image.asset(
                                "lib/Base/Assets/Images/$data",
                                //fit: BoxFit.fill,
                                color: (bottomSelected == data)
                                    ? Appc.PrimaryColor
                                    : Colors.white,
                              ),
                            ),
                          )
                      ],
                    ),
                  ],
                ))
          ],
        );
      }),
    );
  }
}
