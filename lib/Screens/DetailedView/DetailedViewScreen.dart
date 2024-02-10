import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/DetailedView/Service/Controller.dart';
import 'package:show_my_deals/Screens/DetailedView/Views/DetailedView.dart';
import 'package:show_my_deals/src/SMDappBar.dart';

class DetailedViewScreen extends StatelessWidget {
  DetailedViewScreen({super.key});
  //OfferController ofctrl = Get.put(OfferController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          //  appBar: SMDAppBar(title: "AppBar"),
          body: DetailedView()),
    );
  }
}
