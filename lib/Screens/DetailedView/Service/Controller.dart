import 'package:get/get.dart';
import 'package:show_my_deals/Screens/DetailedView/Model/OfferDataModel.dart';
import 'package:show_my_deals/appConfig.dart';
import 'package:show_my_deals/src/ServerRequest.dart';

class OfferController extends GetxController {
  OfferDataModel? offerData = null;

  loadOffer() async {
    ResponseData apiData = await GFetch(
        "http://showmydealsdev.ap-1.evennode.com/api/v2/kozhikode/offer/1707545412250");
    if (apiData.isSucess) {
      offerData = apiData.data["offer"];
      update();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadOffer();
  }
}
