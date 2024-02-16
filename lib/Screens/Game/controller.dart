import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:confetti/confetti.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_my_deals/Screens/Game/spinnerItem.dart';
import 'package:show_my_deals/appConfig.dart';
import 'package:show_my_deals/src/InitialiseData.dart';

class GameController extends GetxController {
  String id = "";
  String sid = "";
  String district = "";
  //int coinCount = 0;
  int coin = 0;
  DateTime? counterDuration;
  bool ClaimButton = false;
  bool ClaimLoading = false;
  bool spinnerLoading = false;

  SpinContentModel? spinItem;
  ConfettiController ctrl = ConfettiController();
  ConfettiController coinpop = ConfettiController();
  RefreshController refreshController = RefreshController();

  GenerateCoin() async {
    ClaimLoading = true;
    updatetime();
    update();
    //  coinCount.value = 0;
    final Response = await post(
        Uri.parse(
          AppConfig.endpoint + "user/coin",
        ),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(
            {"id": id, "secret": sid, "coin": Fortune.randomInt(50, 300)}));
    print(Response.body);
    if (Response.statusCode == 202 || Response.statusCode == 200) {
      loadUserCoin();
      getCurrentDateTime();

      ClaimButton = false;
      ClaimLoading = false;
      coinpop.play();
      update();
      await Future.delayed(Duration(seconds: 2));
      coinpop.stop();
      update();
    } else {
      ClaimButton = false;
      ClaimLoading = false;
      update();
    }
  }

  loadUserCoin() async {
    // coinCount.value = 0;
    final Response = await get(
      Uri.parse(
        AppConfig.endpoint + "user/coin?id=$id&secret=$sid",
      ),
    );
    log("Request --> " +
        AppConfig.endpoint +
        "user/coin?id=$id&secret=$sid" +
        " -->" +
        Response.statusCode.toString());

    if (Response.statusCode == 202) {
      var js = json.decode(Response.body);

      coin = js["coin"];
      print("updating");
      update();
    }
  }

  loadSpnningItem() async {
    final Response =
        await get(Uri.parse(AppConfig.endpoint + "$district/spinneritems"));
    log("Request --> " +
        AppConfig.endpoint +
        "$district/spinningitems" +
        " -->" +
        Response.statusCode.toString());

    if (Response.statusCode == 200) {
      spinItem = SpinContentModel.fromJson(json.decode(Response.body));
      update();
    }
  }

  updatetime() async {
    final Response = await get(Uri.parse(AppConfig.endpoint + "time"));

    if (Response.statusCode == 200) {
      var js = json.decode(Response.body);
      int current = js["time"];
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("LAST_SPIN", current.toString());
    }
  }

  fetchData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString("ID").toString();
    sid = pref.getString("SID").toString();
    district = pref.getString("DISTRICT").toString();
    update();
    loadSpnningItem();
    loadUserCoin();
    getCurrentDateTime();
    refreshController.refreshCompleted();
    update();
  }

  getCurrentDateTime() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String temp = pref.getString("LAST_SPIN").toString();
    counterDuration = null;
    if (temp != "null") {
      int lastSpin = int.parse(temp);
      final Response = await get(Uri.parse(AppConfig.endpoint + "time"));

      if (Response.statusCode == 200) {
        var js = json.decode(Response.body);
        int current = js["time"];
        if ((lastSpin + 20) < current) {
          // if ((lastSpin + 14400) < current) {
          ClaimButton = true;
          update();
        } else {
          ClaimButton = false;
          lastSpin = lastSpin + 10; //14400;
          counterDuration =
              DateTime.now().add(Duration(seconds: lastSpin - current));
          update();
        }
      }
    } else {
      ClaimButton = true;
      update();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }
}
