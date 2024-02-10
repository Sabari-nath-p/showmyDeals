import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:show_my_deals/Screens/AuthenticationScreen/AuthenticationScreenMain.dart';
import 'package:sizer/sizer.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
void main() async {
  await WidgetsFlutterBinding.ensureInitialized();

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
