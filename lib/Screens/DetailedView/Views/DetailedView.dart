import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:show_my_deals/Screens/DetailedView/Model/OfferDataModel.dart';
import 'package:show_my_deals/Screens/DetailedView/Service/Controller.dart';

class DetailedView extends StatelessWidget {
  DetailedView({super.key});
  OfferController ofctrl = Get.put(OfferController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfferController>(builder: (_) {
      OfferDataModel offerData = _.offerData!;
      return Column(
        children: [],
      );
    });
  }
}
