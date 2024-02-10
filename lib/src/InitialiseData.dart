import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/appConfig.dart';
import 'package:show_my_deals/src/ServerRequest.dart';

List<String> Districtlist = [];

class initalizeData {
  loadDistrict() async {
    ResponseData apiRequest = await GFetch(AppConfig.endpoint + "districts");

    if (apiRequest.isSucess) {
      Districtlist = apiRequest.data["districts"];
    } else {}
  }
}
