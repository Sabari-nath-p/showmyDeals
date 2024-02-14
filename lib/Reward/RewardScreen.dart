import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/appConfig.dart';
import 'package:sizer/sizer.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
                leadingWidth: 20.w,
                backgroundColor: Colors.white,
                shape: Border(
                    bottom: BorderSide(
                        width: 0.01.w, color: Colors.white.withOpacity(0.01))),
                leading: Row(
                  children: [
                    SizedBox(
                      width: 1.w,
                    ),
                    Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                    Text(
                      "Back",
                      style: GoogleFonts.poppins(color: Colors.black),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                actions: [
                 
                  Container(
                    width: 29.w,
                    height: 0.001.h,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 1.w,
                        ),
                        Image.asset("lib/Base/Assets/Images/Loc.png"),
                        Text(
                          "Kozhikode",
                          style: GoogleFonts.poppins(
                              fontSize: 12.5.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Image.asset("lib/Base/Assets/Images/arrowdown.png"),
                      ],
                    ),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(11.5.h)),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                ],
              ),
              body: Container(
                  width: 100.w,
                  height: 100.h,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.w,right: 4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4.h,),
                       Align(
                        alignment: Alignment.center,
                        child: Text("My Rewards",style: GoogleFonts.poppins(color: Appc.PrimaryColor,fontWeight: FontWeight.w500,fontSize: 16.6.sp),),
                       ),
                       Container(
                       
                        height: 0.1.h,
                        color: Color(0xff000000).withOpacity(.28),

                       ),
                       SizedBox(height: 4.h,),
                         Padding(
                           padding:  EdgeInsets.only(left: 12.w),
                           child: Align(
                            alignment: Alignment.center,
                            child: Stack(
                              
                                    children: [
                                             Image.asset("lib/Base/Assets/Images/rewardcard.png"),
                                             Container(
                                                padding: EdgeInsets.only(left: 5.w,top: 3.h),
                                               child: Row(
                                                 children: [
                                                   Image.asset("lib/Base/Assets/Images/clock.png"),
                                                   SizedBox(width: 1.w,),
                                                Text("Valid till 28 Aug 01:00 pm",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 8.3.sp,color: Colors.white),textAlign: TextAlign.start,)
                                                                                     
                                                 ],
                                               )),
                                             
                                             Container(
                                               padding: EdgeInsets.only(left: 5.w,top: 5.2.h),
                                               child: Row(
                                                children: [
                                                  SizedBox(
                                                         width: 19.w,
                                                         height: 14.w,
                                                         child: Text("Buy Get 1",style: GoogleFonts.baloo2(fontWeight: FontWeight.w400,fontSize: 16.6.sp.sp,color: Colors.white,),)
                                                                                 
                                                  ),
                                                  Image.asset("lib/Base/Assets/Images/Adcard.png")
                                                ],
                                               ),
                                             ),
                                          
                                             Container(
                                              padding: EdgeInsets.only(left: 5.w,top: 19.h),
                                              
                                              child: Text(" *Terms and Conditions apply",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 11.3.sp,color: Colors.white),textAlign: TextAlign.start,))
                                              
                         
                                    ],
                            )),
                         )
                  
                  
                  
                      ],
                    ),
                  ),


              ),

    );
  }
}