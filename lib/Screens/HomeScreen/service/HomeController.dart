import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:lit_relative_date_time/controller/relative_date_format.dart';
import 'package:lit_relative_date_time/model/relative_date_time.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/Game/controller.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/JobDetailedScreen.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/offerDetailedView.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/JobModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/OfferModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/OutletModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/TagModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/TagModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/hiveDataModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/shopDetailedModel.dart';
import 'package:show_my_deals/appConfig.dart';
import 'package:show_my_deals/src/FlashMessage.dart';
import 'package:uni_links/uni_links.dart';

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
  bool OfferLoading = false;
  bool noNetwork = false;
  RefreshController refreshController = RefreshController();

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
    OfferLoading = true;
    update();
    String temTag = selectedTag == null ? "" : "?tag=${selectedTag!.tag}";
    final Respose = await get(
        Uri.parse(AppConfig.endpoint + "$selectedDistrict/offers" + temTag),
        headers: header);

    log("Request -->" +
        AppConfig.endpoint +
        "$selectedDistrict/offers" +
        temTag +
        " --> ${Respose.statusCode}");
    OfferLoading = false;
    update();
    if (Respose.statusCode == 200) {
      print(Respose.body);
      for (var data in json.decode(Respose.body)["offers"]) {
        offerList.add(OfferModel.fromJson(data));
      }
      try {
        final initialUri = await getInitialUri();
        print(initialUri);

        // Use the uri and warn the user, if it is not correct,
        // but keep in mind it could be `null`.

        if (initialUri != null) {
          print(initialUri);
          String value = initialUri.toString();
          List linkParms = value.split("/");
          print(linkParms[linkParms.length - 2]);
          if (linkParms[linkParms.length - 2] == "offer") {
            Get.to(
                () =>
                    OfferDetailedView(offerID: linkParms[linkParms.length - 1]),
                transition: Transition.rightToLeft);
          }
        }
      } on FormatException {
        // Handle exception by warning the user their action did not succeed
        // return?
      }

      update();
    }
  }

  loadShopes() async {
    outletList.clear();
    try {
      final Respose = await get(
          Uri.parse(AppConfig.endpoint + "$selectedDistrict/outlets"),
          headers: header);

      log("Request -->" +
          AppConfig.endpoint +
          "$selectedDistrict/outlets" +
          " --> ${Respose.statusCode}");
      noNetwork = false;
      update();
      if (Respose.statusCode == 200) {
        for (var data in json.decode(Respose.body)["stores"]) {
          outletList.add(OutletModel.fromJson(data));
        }

        update();
      }
    } catch (e) {
      print(e);
      noNetwork = true;
      update();
      FlashMessage(
          "No Internet Connection", "Please check your internet connection");
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

      try {
        final initialUri = await getInitialUri();
        print(initialUri);

        // Use the uri and warn the user, if it is not correct,
        // but keep in mind it could be `null`.

        if (initialUri != null) {
          print(initialUri);
          String value = initialUri.toString();
          List linkParms = value.split("/");
          print(linkParms[linkParms.length - 2]);
          if (linkParms[linkParms.length - 2] == "jobs") {
            for (var data in jobList) {
              if (data.id == linkParms[linkParms.length - 1]) {
                Get.to(() => JobDetailedScreen(model: data));
                break;
              }
            }
          }
        }
      } on FormatException {
        // Handle exception by warning the user their action did not succeed
        // return?
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
    try {
      loadTags();
      loadOffers();
      loadJobs();
      loadShopes();
      loadCart();
    } catch (e) {
      FlashMessage("No Internet Connection", "Please reconnect with internet");
    }
  }

  reloadData() {
    try {
      loadTags();
      loadOffers();
      loadJobs();
      loadShopes();
      loadCart();
      GameController ctrl = Get.put(GameController());
      ctrl.fetchData();
      refreshController.refreshCompleted();
    } catch (e) {
      print(e);
      FlashMessage("No Internet Connection", "Please reconnect with internet");
    }
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
      to: offer.to.toString(),
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
