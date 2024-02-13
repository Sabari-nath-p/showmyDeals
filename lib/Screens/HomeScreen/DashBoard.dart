import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:show_my_deals/Screens/HomeScreen/views/HomeScreen.dart';
import 'package:show_my_deals/main.dart';
import 'package:sizer/sizer.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});
  HomeController hctrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 36.51.w,
        leading: Row(
          children: [
            SizedBox(
              width: 5.2.w,
            ),
            Expanded(
                child: Image.asset("lib/Base/Assets/Images/badgelogo.png")),
          ],
        ),
        actions: [
          Container(
            width: 35.21.w,
            height: 3.11.h,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Appc.LightGery)),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Appc.PrimaryColor,
                  size: 4.w,
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: DropdownButton(
                    value: "kannur",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400),
                    items: DistrictList.map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.toString().capitalize.toString(),
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w300),
                        ))).toList(),
                    isExpanded: true,
                    underline: Container(),
                    onChanged: (v) {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 5.2.w,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Expanded(child: HomeScreen())],
      ),
    );
  }
}
