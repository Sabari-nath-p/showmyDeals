import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_my_deals/Screens/AuthenticationScreen/AuthenticationScreenMain.dart';
import 'package:show_my_deals/Screens/HomeScreen/DashBoard.dart';
import 'package:show_my_deals/Screens/HomeScreen/Models/hiveDataModel.dart';
import 'package:show_my_deals/firebase_options.dart';
import 'package:sizer/sizer.dart';
//import 'package:uni_links/uni_links.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
List DistrictList = [
  "kozhikode",
  "malappuram",
  "kannur",
  "wayanad",
  "ernakulam",
  "kasaragod",
  "thrissur",
  "palakkad",
  "alappuzha",
  "idukki",
  "pathanamthitta",
  "kottayam",
  "kollam",
  "thiruvananthapuram"
];
String login = "";
FirebaseMessaging messaging = FirebaseMessaging.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await messaging.requestPermission();
  SharedPreferences pref = await SharedPreferences.getInstance();

  login = pref.get("LOGIN").toString();
  await Hive.initFlutter();
  // initUniLinks();
  if (!Hive.isAdapterRegistered(CartDataModelAdapter().typeId)) {
    Hive.registerAdapter(CartDataModelAdapter());
  }
  // final Response = await get(Uri.parse(AppConfig.endpoint + "districts"));
  // if (Response.statusCode == 200) {
  //   var data = json.decode(Response.body);
  //   DistrictList = data["districts"];
  // }
  // print(DistrictList);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
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
              home:
                  (login == "IN") ? DashBoardScreen() : AuthenticationScreen(),
            ));
  }
}

// Future<void> initUniLinks() async {
//   // Platform messages may fail, so we use a try/catch PlatformException.
//   try {
//     final initialLink = await getInitialLink();

//     print(initialLink);
//     // Parse the link and warn the user, if it is not correct,
//     // but keep in mind it could be `null`.
//   } on PlatformException {
//     // Handle exception by warning the user their action did not succeed
//     // return?
//   }
// }
