import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:show_my_deals/main.dart';
import 'package:show_my_deals/src/SMDappBar.dart';
import 'package:sizer/sizer.dart';

class EditProfileBottomSheet extends StatefulWidget {
  EditProfileBottomSheet({super.key});

  @override
  State<EditProfileBottomSheet> createState() => _EditProfileBottomSheetState();
}

class _EditProfileBottomSheetState extends State<EditProfileBottomSheet> {
  String? seletedDistrict;

  HomeController hcrtl = Get.put(HomeController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seletedDistrict = hcrtl.selectedDistrict;
    nameController.text = hcrtl.name;
  }

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CappBar(isBack: true),
      body: Container(
        width: 100.w,
        padding: EdgeInsets.all(5.2.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: GetBuilder<HomeController>(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.w,
              ),
              Text(
                "Enter Your Name",
                style: GoogleFonts.poppins(
                    fontSize: 13.33.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                  width: 88.68.w,
                  height: 4.8.h,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Appc.LightGery)),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        hintText: "Enter Your Name",
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            color: Appc.TLightGrey)),
                  )),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Select Your District",
                style: GoogleFonts.poppins(
                    fontSize: 13.33.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                  width: 88.68.w,
                  height: 4.8.h,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Appc.LightGery)),
                  child: DropdownButton(
                    value: seletedDistrict, //authctrl.SelectedDistrict,
                    items: DistrictList.map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.toString().capitalize.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 11.33.sp, fontWeight: FontWeight.w600),
                        ))).toList(),
                    isExpanded: true,
                    underline: Container(),
                    onChanged: (v) {},
                  )),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      hcrtl.editProfileDetails(nameController.text);
                      hcrtl.editProfile = false;
                      hcrtl.update();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.8.w),
                      height: 4.5.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Appc.PrimaryColor),
                      child: (hcrtl.editProfile)
                          ? LoadingAnimationWidget.staggeredDotsWave(
                              color: Colors.white, size: 26)
                          : Text(
                              "Update",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 12.66.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.8.w),
                      height: 4.5.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Appc.PrimaryColor),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Text(
                        "Cancel",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Appc.PrimaryColor,
                            fontSize: 12.66.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
