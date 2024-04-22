import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:neumorphic_button/neumorphic_button.dart';
import 'package:odometer/odometer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/Reward/RewardScreen.dart';
import 'package:show_my_deals/Screens/Game/views/coinGenerator.dart';
import 'package:show_my_deals/Screens/Game/controller.dart';
import 'package:show_my_deals/Screens/Game/views/customFunction.dart';
import 'package:show_my_deals/appConfig.dart';
import 'package:show_my_deals/src/FlashMessage.dart';
import 'package:sizer/sizer.dart';

class GameSpinningView extends StatefulWidget {
  GameSpinningView({super.key});

  @override
  State<GameSpinningView> createState() => _GameSpinningViewState();
}

class _GameSpinningViewState extends State<GameSpinningView> {
  List cColorList = [
    Color(0xffF8B214),
    Color(0xffBD14F8),
    Color(0xffF84B25),
    Color(0xff00376E),
    Color(0xffFA912C),
    Color(0xff00B88F),
  ];
  final ScrollController scrollController = ScrollController();
  StreamController<int> spinController = StreamController<int>();

  GameController gctrl = Get.put(GameController());
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    gctrl.fetchData();
    return GetBuilder<GameController>(builder: (_) {
      return SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100.w,
              height: 6.23.h,
              padding: EdgeInsets.symmetric(horizontal: 4.2.w),
              decoration: BoxDecoration(color: Appc.PrimaryColor),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Collect your free coins as daily reward",
                      style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      scrollController.animateTo(
                        scrollController.position.maxScrollExtent,
                        duration: Duration(milliseconds: 800),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                    child: SizedBox(
                      width: 21.05.w,
                      child:
                          Image.asset("lib/Base/Assets/Images/collectCoin.png"),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 3.5.h,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 20,
                        child: Image.asset("lib/Base/Assets/Images/coin.png"),
                      ),
                      AnimatedSlideOdometerNumber(
                        //  numberTextStyle: TextStyle(fontSize: 15),
                        odometerNumber: OdometerNumber(gctrl.coin),
                        duration: Duration(seconds: 1),
                        numberTextStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Appc.PrimaryColor,
                            fontSize: 10.sp),
                        groupSeparator: Text(
                          ",",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Appc.PrimaryColor,
                              fontSize: 15.sp),
                        ),
                        letterWidth: 2.4.w,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Appc.PrimaryColor)),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    // if (gctrl.voucherList.length > 0)
                    gctrl.loadUserVoucher();
                    Get.to(() => RewardScreen(),
                        transition: Transition.rightToLeft);
                    // else {
                    //   FlashMessage(
                    //       "No Reward avalible", "Currently no reward avalible");
                    // }
                  },
                  child: Container(
                    height: 3.5.h,
                    width: 34.31.w,
                    alignment: Alignment.center,
                    child: Text(
                      "My Rewards",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Appc.PrimaryColor,
                        border: Border.all(color: Appc.PrimaryColor)),
                  ),
                ),
                SizedBox(
                  width: 4.2.w,
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            if (gctrl.spinItem != null)
              SizedBox(
                width: 92.1.w,
                height: (1.h * 100 > 860) ? 60.03.h : 52.h,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: 92.1.w,
                          height: 51.03.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffF6F8FF)),
                        )),
                    Positioned(
                        //  top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: 92.1.w,
                          height: 31.41.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffD30E49)),
                        )),
                    Positioned(
                      bottom: 10.98.h,
                      width: 50.69.w,
                      height: 12.23.h,
                      left: 20.7.w,
                      child: Image.asset(
                        "lib/Base/Assets/Images/spinstand.png",
                        fit: BoxFit.fill,
                      ),
                    ),

                    Positioned(
                        bottom: 17.00.h,
                        left: 15.57.w,
                        right: 15.57.w,
                        top: .2.h,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 68.68.w,
                            height: 68.68.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: .3,
                                      color: Colors.black12,
                                      offset: Offset(0, 0),
                                      blurRadius: 2)
                                ],
                                //  borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    color: Colors.white, width: 3.w)),
                          ),
                        )),

                    Positioned(
                        bottom: 19.29.h,
                        left: 16.57.w,
                        height: 58.68.w,
                        right: 16.57.w,
                        child: Container(
                          width: 58.68.w,
                          height: 58.68.w,
                          child: (gctrl.spinItem == null)
                              ? Container()
                              : FortuneWheel(
                                  rotationCount: 15,
                                  styleStrategy: AlternatingStyleStrategy(),
                                  duration: Duration(seconds: 7),
                                  animateFirst: false,
                                  selected: spinController.stream,
                                  hapticImpact: HapticImpact.heavy,
                                  onAnimationEnd: () async {
                                    gctrl.ctrl.play();

                                    gctrl.update();
                                    gctrl.spinnerLoading = false;
                                    //gctrl.coin = gctrl.coin - 1000;
                                    gctrl.loadUserCoin();
                                    gctrl.loadUserVoucher();
                                    gctrl.update();
                                    dialog(context, selectedIndex);
                                    await Future.delayed(Duration(seconds: 2));
                                    gctrl.ctrl.stop();

                                    gctrl.update();
                                  },
                                  items: [
                                    for (var data
                                        in gctrl.spinItem!.spinContent!.items!)
                                      FortuneItem(
                                        style: FortuneItemStyle(
                                            color: cColorList[gctrl
                                                .spinItem!.spinContent!.items!
                                                .indexOf(data)],
                                            borderColor: Colors.transparent),
                                        child: Text(
                                          data.smallText
                                              .toString()
                                              .toUpperCase(),
                                          style: GoogleFonts.lexend(
                                              fontSize: 7.sp),
                                        ),
                                      ),
                                  ],
                                ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              //  borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: Appc.PrimaryColor, width: 3.w)),
                        )),

                    if (false)
                      Positioned(
                          top: 17.82.h,
                          //bottom: 0,
                          right: 0,
                          left: 0,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(-.5, 1),
                                        color: Colors.black54,
                                        spreadRadius: .4,
                                        blurRadius: 1)
                                  ],
                                  color: Colors.white),
                            ),
                          )),
                    Positioned(
                        bottom: 19.29.h,
                        left: 16.57.w,
                        right: 16.57.w,
                        child: Container(
                          width: 58.68.w,
                          height: 58.68.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: .2,
                                    color: Colors.black.withOpacity(.02),
                                    offset: Offset(0, 0),
                                    blurRadius: 2)
                              ],
                              //  borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: Appc.PrimaryColor, width: 3.w)),
                        )),
                    // SizedBox(
                    //   width: 56.84.w,
                    //   height: 50.h,
                    //   child:
                    // ),

                    Positioned(
                        left: 24.7.w,
                        right: 24.7.w,
                        bottom: 4.3.h,
                        child: NeumorphicButton(
                            width: 42.1.w,
                            height: 4.2.h,
                            child: Align(
                              alignment: Alignment.center,
                              child: (gctrl.spinnerLoading)
                                  ? LoadingAnimationWidget.staggeredDotsWave(
                                      color: Colors.black, size: 25)
                                  : Text(
                                      "Spin Now",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                            ),
                            bottomRightShadowBlurRadius: .3,
                            padding: EdgeInsets.zero,
                            bottomRightShadowSpreadRadius: 3,
                            backgroundColor: (gctrl.coin < 1000)
                                ? Appc.LightGery
                                : Color(0xffF8E114),
                            bottomRightShadowColor: (gctrl.coin < 1000)
                                ? Appc.LightGery
                                : Color(0xffF8E114),
                            topLeftShadowColor: Colors.black12,
                            onTap: () async {
                              if (gctrl.coin > 1000) {
                                gctrl.spinnerLoading = true;
                                gctrl.update();
                                final Response = await post(
                                    Uri.parse(
                                      AppConfig.endpoint + "user/spin",
                                    ),
                                    headers: {
                                      "Content-Type": "application/json",
                                    },
                                    body: json.encode({
                                      "id": gctrl.id,
                                      "secret": gctrl.sid,
                                      "spinid": gctrl.spinItem!.spinContent!.id
                                          .toString()
                                    }));
                                print(Response.body);
                                print(Response.statusCode);
                                print(
                                    gctrl.spinItem!.spinContent!.id.toString());
                                if (Response.statusCode == 200 ||
                                    Response.statusCode == 201) {
                                  var js = json.decode(Response.body);
                                  print(js);
                                  for (var data
                                      in gctrl.spinItem!.spinContent!.items!) {
                                    print(data.toJson());
                                    if (data.id.toString() ==
                                        js["reward"]["id"]) {
                                      spinController.add(gctrl
                                          .spinItem!.spinContent!.items!
                                          .indexOf(data));
                                      selectedIndex = gctrl
                                          .spinItem!.spinContent!.items!
                                          .indexOf(data);
                                      setState(() {});

                                      break;
                                    }
                                  }
                                }
                              } else {
                                // dialog(context, 1);
                                FlashMessage("Insufficient Coins",
                                    "Minimum 1000 coin is required to spin. Claim coin by daily reward");
                              }
                            })),

                    Positioned(
                        bottom: 1.h,
                        left: 10,
                        right: 10,
                        child: Text(
                          "1000 coins / spin",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 8.sp),
                        )),
                    Positioned(
                        top: 10,
                        left: 10,
                        right: 10,
                        child: ConfettiWidget(
                          confettiController: gctrl.ctrl,
                          numberOfParticles: 50,
                          maxBlastForce: 4,
                          minBlastForce: 2,
                          blastDirection: pi / 3,
                        )),
                    Positioned(
                        top: 10,
                        //left: 10,
                        right: 10,
                        child: ConfettiWidget(
                          confettiController: gctrl.ctrl,
                          numberOfParticles: 50,
                          maxBlastForce: 10,
                          minBlastForce: 2,
                          blastDirection: pi / 1.8,
                        )),
                  ],
                ),
              ),
            CoinGenerator()
          ],
        ),
      );
    });
  }
}
