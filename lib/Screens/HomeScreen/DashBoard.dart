import 'package:blur/blur.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/Bags/AddBagScreen.dart';
import 'package:show_my_deals/Screens/DetailedView/Views/DetailedView.dart';
import 'package:show_my_deals/Screens/Game/GameMainScreen.dart';
import 'package:show_my_deals/Screens/Game/controller.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/FeedScreen.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/ProfileSettings.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/HomeScreen.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/JobDetailedScreen.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/OfferView.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/ShopDetailedPage.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/offerDetailedView.dart';
import 'package:show_my_deals/Screens/quitShowmodelsheet.dart';
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

  HomeController hctrl = Get.put(HomeController());
  GameController ctrl = Get.put(GameController());

  @override
  Widget build(BuildContext context) {
    print(DistrictList);
    return Scaffold(
      appBar: hctrl.bottomSelected == listIcon[3] ? null : CappBar(),
      body: GetBuilder<HomeController>(builder: (_) {
        print(hctrl.selectedDistrict);
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            showModalBottomSheet(
                context: context, builder: (ctx) => QuitModelsheet());
          },
          child: Stack(
            children: [
              if (hctrl.bottomSelected == listIcon[0])
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: HomeScreen(),
                ),
              if (hctrl.bottomSelected == listIcon[1])
                Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: AddBagScreen()),
              if (hctrl.bottomSelected == listIcon[2])
                Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: GameSpinningView()),
              if (hctrl.bottomSelected == listIcon[3])
                Positioned(
                    top: 4.h,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: FeedScreen()),
              if (hctrl.bottomSelected == listIcon[4])
                Positioned(child: ProfileSettingScreen()),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  height: 7.7.h,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (var data in listIcon)
                            InkWell(
                              onTap: () {
                                setState(() {
                                  hctrl.bottomSelected = data;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 6.1.w),
                                width: 7.8.w,
                                height: 10.8.w,
                                child: Image.asset(
                                  "lib/Base/Assets/Images/$data",
                                  //fit: BoxFit.fill,
                                  color: (hctrl.bottomSelected == data)
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
          ),
        );
      }),
    );
  }
}
