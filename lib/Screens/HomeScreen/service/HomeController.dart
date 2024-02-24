import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:lit_relative_date_time/controller/relative_date_format.dart';
import 'package:lit_relative_date_time/model/relative_date_time.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/JobModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/OfferModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/OutletModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/TagModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/TagModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/hiveDataModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/shopDetailedModel.dart';
import 'package:show_my_deals/appConfig.dart';

class HomeController extends GetxController {
  int TopMenu = 0;
  String? selectedDistrict;
  List<TagModel> tgModelList = [];
  List<OfferModel> offerList = [];
  List<JobModel> jobList = [];
  List<OutletModel> outletList = [];
  ContentModel? contentModel;
  TagModel? selectedTag;
  Box? CardDb;
  List<CartDataModel> CartList = [];
  String bottomSelected = "homeIcon.png";
  String selectedStoreTag = "";
  OfferModel? selectedOfferModel;
  OutletModel? selectOutletModel;
  OutletDetailedModel? outlet;
  JobModel? selectedJobModel;
  String name = "";
  String id = "";

  var header = {
    'Accept': 'application/json',
    // "Content-Type": "application/json",
    // "Authorization": "Token $token",
    //  "Vary": "Accept"
  };

  loadTags() async {
    tgModelList.clear();
    final Respose = await get(
        Uri.parse(AppConfig.endpoint + "$selectedDistrict/content"),
        headers: header);

    log("Request -->" +
        AppConfig.endpoint +
        "$selectedDistrict/content --> ${Respose.statusCode}");

    if (Respose.statusCode == 200) {
      print(Respose.body);
      var data = json.decode(Respose.body);
      contentModel = ContentModel.fromJson(data);
      for (var data in json.decode(Respose.body)["tags"]) {
        tgModelList.add(TagModel.fromJson(data));
      }

      update();
    }
  }

  loadOffers() async {
    offerList.clear();
    String temTag = selectedTag == null ? "" : "?tag=${selectedTag!.tag}";
    final Respose = await get(
        Uri.parse(AppConfig.endpoint + "$selectedDistrict/offers" + temTag),
        headers: header);

    log("Request -->" +
        AppConfig.endpoint +
        "$selectedDistrict/offers" +
        temTag +
        " --> ${Respose.statusCode}");

    if (Respose.statusCode == 200) {
      print(Respose.body);
      for (var data in json.decode(Respose.body)["offers"]) {
        offerList.add(OfferModel.fromJson(data));
      }

      update();
    }
  }

  loadShopes() async {
    outletList.clear();
    final Respose = await get(
        Uri.parse(AppConfig.endpoint + "$selectedDistrict/outlets"),
        headers: header);

    log("Request -->" +
        AppConfig.endpoint +
        "$selectedDistrict/outlets" +
        " --> ${Respose.statusCode}");

    if (Respose.statusCode == 200) {
      for (var data in json.decode(Respose.body)["stores"]) {
        outletList.add(OutletModel.fromJson(data));
      }

      update();
    }
  }

  loadJobs() async {
    jobList.clear();
    final Respose = await get(
        Uri.parse(AppConfig.endpoint + "$selectedDistrict/jobs"),
        headers: header);

    log("Request -->" +
        AppConfig.endpoint +
        "$selectedDistrict/offers" +
        " --> ${Respose.statusCode}");

    if (Respose.statusCode == 200) {
      print(Respose.body);
      for (var data in json.decode(Respose.body)["jobs"]) {
        jobList.add(JobModel.fromJson(data));
      }

      update();
    }
  }

  RefreshData({isTag = false}) {
    if (isTag) {
      loadTags();
    }

    loadOffers();
  }

  inilisalize() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    CardDb = await Hive.openBox("CART");
    selectedDistrict = preferences.getString("DISTRICT");
    name = preferences.getString("NAME").toString();
    id = preferences.getString("ID").toString();
    if (selectedDistrict == "") update();

    loadTags();
    loadOffers();
    loadJobs();
    loadShopes();
    loadCart();
  }

  returnBack() {
    if (selectedOfferModel != null) {
      selectedOfferModel = null;
    } else if (selectOutletModel != null) {
      selectOutletModel = null;
    } else if (selectedJobModel != null) {
      selectedJobModel != null;
    }
    update();
  }

  loadShopDetails() async {
    // String tempBase= (selectOutletModel.isGroup!) ?"group/${selectOutletModel.g}" :
    final Respose = await get(
        Uri.parse(AppConfig.endpoint +
            "$selectedDistrict/outlet/${selectOutletModel!.id}"),
        headers: header);
    log("Request -->" +
        AppConfig.endpoint +
        "$selectedDistrict/outlet/${selectOutletModel!.id}" +
        " --> ${Respose.statusCode}");
    print(Respose.body);

    if (Respose.statusCode == 200) {
      outlet = OutletDetailedModel.fromJson(json.decode(Respose.body));
      update();
    }
  }

  loadOfferDetails() async {}

  String CAppformat(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat("yyyy-MMM-dd").format(dateTime);
    return (formattedDate); // Output: 2023-08-10
  }

  String CAppformat2(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat("dd MMM").format(dateTime);
    return (formattedDate); // Output: 2023-08-10
  }

  String CAppRelative(String dateString, BuildContext context) {
    DateTime dateTime = DateTime.parse(dateString);
    RelativeDateTime _relativeDateTime =
        RelativeDateTime(dateTime: dateTime, other: DateTime.now());

    RelativeDateFormat _relativeDateFormatter = RelativeDateFormat(
      Localizations.localeOf(context),
    );
    return _relativeDateFormatter
        .format(_relativeDateTime); // Output: 2023-08-10
  }

  String formatCount(int count) {
    if (count < 1000) {
      return count.toString();
    } else if (count < 1000000) {
      double result = count / 1000;
      return result
              .toStringAsFixed(result.truncateToDouble() == result ? 0 : 1) +
          'k';
    } else if (count < 1000000000) {
      double result = count / 1000000;
      return result
              .toStringAsFixed(result.truncateToDouble() == result ? 0 : 1) +
          'M';
    } else {
      double result = count / 1000000000;
      return result
              .toStringAsFixed(result.truncateToDouble() == result ? 0 : 1) +
          'B';
    }
  }

  loadCart() {
    CartList.clear();
    for (var data in CardDb!.keys) {
      CartList.add(CardDb!.get(data));
    }
  }

  addToCard(String id, String name, String image, OfferModel offer) {
    CartDataModel model = CartDataModel(
      itemID: id,
      itemName: name,
      ImageUrl: image,
      offerName: offer.name,
      offerID: offer.id.toString(),
      from: offer.from.toString(),
      to: offer.from.toString(),
    );

    CardDb!.put(id, model);
    CartList.add(model);
    update();
  }

  removeFromCart(String id) {
    CartDataModel model = CardDb!.get(id);
    CartList.remove(model);
    CardDb!.delete(id);
    update();
  }

  bool editProfile = false;

  editProfileDetails(String n) async {
    final Response = await post(Uri.parse(AppConfig.endpoint + "user/details"),
        body: json.encode({"id": id, " district": selectedDistrict, "name": n}),
        headers: {
          "Content-Type": "application/json",
        });
    print(Response.body);
    print(Response.statusCode);
    editProfile = false;
    update();
    if (Response.statusCode == 200) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("NAME", n);
      pref.setString("DISTRICT", selectedDistrict!);
      pref.setString("LOGIN", "IN");
      name = n;
      update();
      Get.back();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    TopMenu = 0;
    inilisalize();
  }
}
