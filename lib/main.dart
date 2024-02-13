import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart';
import 'package:show_my_deals/Screens/AuthenticationScreen/AuthenticationScreenMain.dart';
import 'package:show_my_deals/appConfig.dart';
import 'package:show_my_deals/src/InitialiseData.dart';
import 'package:sizer/sizer.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
List DistrictList = [];
void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  final Response = await get(Uri.parse(AppConfig.endpoint + "districts"));
  if (Response.statusCode == 200) {
    var data = json.decode(Response.body);
    DistrictList = data["districts"];
  }
  print(DistrictList);
  runApp(ShowMyDeals());
}

class ShowMyDeals extends StatelessWidget {
  ShowMyDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, DeviceType) => GetMaterialApp(
              navigatorKey: navigatorKey,
              title: "ShowMyDeals",
              home: AuthenticationScreen(),
            ));
  }
}
