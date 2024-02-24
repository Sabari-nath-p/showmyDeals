import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/GroupCard.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/ShopDetailedPage.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/GroupModel.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:show_my_deals/appConfig.dart';
import 'package:show_my_deals/src/SMDappBar.dart';
import 'package:sizer/sizer.dart';

class GrouOfferScreen extends StatefulWidget {
  String id;
  String thumbnail;
  String name;
  GrouOfferScreen(
      {super.key,
      required this.id,
      required this.thumbnail,
      required this.name});

  @override
  State<GrouOfferScreen> createState() => _GrouOfferScreenState();
}

class _GrouOfferScreenState extends State<GrouOfferScreen> {
  GroupModel? gModel;
  FetchGroupOffer() async {
    final Response = await get(Uri.parse(
        AppConfig.endpoint + hctrl.selectedDistrict! + "/group/${widget.id}"));

    if (Response.statusCode == 200) {
      gModel = GroupModel.fromJson(json.decode(Response.body));
      print(widget.id);
      setState(() {});
      print(gModel!.group!.groupMembers!.length);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchGroupOffer();
  }

  HomeController hctrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CappBar(isBack: true),
      body: (gModel == null)
          ? Container()
          : Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 100.w,
                  height: 10.h,
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Image.network(
                    widget.thumbnail,
                  ),
                  //color: Colors.white,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  width: 100.w,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(vertical: 4.2.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          widget.name,
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        for (GroupMembers data in gModel!.group!.groupMembers!)
                          InkWell(
                            onTap: () {
                              Get.to(() => ShopDetailedPage(shopid: data.id!),
                                  transition: Transition.rightToLeft);
                            },
                            child: GroupCard(
                              members: data,
                            ),
                          )
                      ],
                    ),
                  ),
                ))
              ],
            ),
    );
  }
}
