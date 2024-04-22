import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:show_my_deals/appConfig.dart';
import 'package:show_my_deals/src/FlashMessage.dart';

Future<ResponseData> GFetch(String endpoint, {var header = null}) async {
  header ??= {
    'Accept': 'application/json',
    // "Content-Type": "application/json",
    // "Authorization": "Token $token",
    //  "Vary": "Accept"
  };
  print(header);
//  try {
  final Respose =
      await get(Uri.parse(AppConfig.endpoint + endpoint), headers: header);

  log("Request -- > $endpoint --> ${Respose.statusCode} ");
  print(Respose.body);
  if (Respose.statusCode == 200) {
    var data = json.decode(Respose.body);
    return ResponseData(isSucess: true, data: data);
  } else {
    FlashMessage("OTP limit reached", "Please try after some time");
    return ResponseData(isSucess: false);
  }
  // } catch (e) {
  //   print(e);
  //   FlashMessage("No Intenet Connection",
  //       "Please connect to a stable internet connection");
  //   return ResponseData(
  //     isSucess: false,
  //   );
  // }
}

Future<ResponseData> PFetch(String endpoint, var body,
    {var header = null}) async {
  header ??= {
    'Accept': 'application/json',
    // "Content-Type": "application/json",
    // "Authorization": "Token $token",
    "Vary": "Accept"
  };
  try {
    final Respose = await post(Uri.parse(AppConfig.endpoint + endpoint),
        headers: header, body: body);
    var data = json.decode(Respose.body);
    if (Respose.statusCode == 200) {
      return ResponseData(isSucess: true, data: data);
    } else {
      FlashMessage("Oops!", " We apologize for the inconvenience");
      return ResponseData(isSucess: false);
    }
  } catch (e) {
    FlashMessage("No Intenet Connection",
        "Please connect to a stable internet connection");
    return ResponseData(
      isSucess: false,
    );
  }
}

class ResponseData {
  bool isSucess = false;
  var data;
  ResponseData({required this.isSucess, this.data});
}
