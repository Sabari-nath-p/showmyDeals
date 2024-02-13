import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/main.dart';
import 'package:sizer/sizer.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
          
          leadingWidth: 36.51.w,
          
          backgroundColor: Colors.white,
          toolbarHeight: 9.h,
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
                width: 5.w,
                height: 5.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Appc.PrimaryColor,
                 
                ),
                child: Icon(Icons.close,size: 4.w,color: Colors.white,),
            ),
            SizedBox(
              width: 5.2.w,
              height: 6.h,
            ),
          ],),
          
          body:  Container(
            width: 100.w,
            height: 100.h,
            color: Colors.white,
           
            child: Padding(
              padding:EdgeInsets.only(left: 7.8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4.h,),
                  Row(
                    children: [
                      Container(
                        width: 7.6.w,
                        height: 7.6.w,
                       
                        decoration: BoxDecoration(shape: BoxShape.circle,
                      color: Appc.PrimaryColor.withOpacity(.08)) ,
                      child: Icon(Icons.person,size: 4.w,color: Appc.PrimaryColor,),
                      ),
                      SizedBox(width: 2.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        
                          Text("Aquibe",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize: 8.3333.sp ),),
                           Text("Edit Name, Phone Number",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize: 6.sp ,color: Color(0xffAAAAAA)),),
                        ],
                      ),
                       Expanded(child: Container()),
                            Icon(Icons.chevron_right,color: Appc.PrimaryColor,size: 4.h,),
                            SizedBox(width: 3.w,),
                    ],
                  ),
                  SizedBox(height: 5.5.h,),
                  Row(
                    children: [
                      
                      Container(
                        width: 39.4.w,
                        height: 5.2.h,
                        
                        decoration: BoxDecoration(color: Appc.PrimaryColor,borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(width: 3.w,),
                            SizedBox(height:6.8.w ,width: 6.8.w,
                            child: Image.asset("lib/Base/Assets/Images/coin.png"),),
                            SizedBox(width: 3.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 0.8.h,),
                                  Text("Reward Coins",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize: 5.sp ,color: Colors.white),),
                         SizedBox(height: 0.2.h,),  Text("1200 Collected",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize: 5.sp ,color: Color(0xffFBC93B)),),
                      
                              ],
                            ),
                            Expanded(child: Container()),
                            Icon(Icons.chevron_right,color: Colors.white,size: 4.h,),
                            SizedBox(width: 2.w,),
                          ],
                        ),
                      ),
                      SizedBox(width:6.w ,),
                       Container(
                        width: 39.4.w,
                        height: 5.2.h,
                        
                        decoration: BoxDecoration(color: Appc.PrimaryColor,borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(width: 3.w,),
                            SizedBox(height:6.8.w ,width: 6.8.w,
                            child: Image.asset("lib/Base/Assets/Images/gift.png"),),
                            SizedBox(width: 3.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 0.8.h,),
                                  Text("View all",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize: 5.sp ,color: Colors.white),),
                         SizedBox(height: 0.2.h,),  Text("Scratch Cards",style: GoogleFonts.poppins(fontWeight:FontWeight.w700,fontSize: 5.sp ,color: Colors.white),),
                      
                              ],
                            ),
                             Expanded(child: Container()),
                            Icon(Icons.chevron_right,color: Colors.white,size: 4.h,),
                            SizedBox(width: 2.w,),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h,),
                   Row(
                    children: [
                       Container(
                        width: 7.6.w,
                        height: 7.6.w,
                       
                        decoration: BoxDecoration(shape: BoxShape.circle,
                      color: Appc.PrimaryColor.withOpacity(.08)) ,
                      child: Image.asset("lib/Base/Assets/Images/store.png",color: Appc.PrimaryColor,)
                      ),
                      SizedBox(width: 2.w,)
                      ,Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                                 Text("Add your store",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize: 8.3333.sp ),),
                           Text("Create your store profile",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize: 6.sp ,color: Color(0xffAAAAAA)),),
                        
    
                        ],
                      ),
                      Expanded(child: Container()),
                       Icon(Icons.chevron_right,color: Appc.PrimaryColor,size: 4.h,),
                            SizedBox(width: 3.w,),
                    ],
                   ),
                   SizedBox(height: 5.h,),
                    Row(
                    children: [
                       Container(
                        width: 7.6.w,
                        height: 7.6.w,
                       
                        decoration: BoxDecoration(shape: BoxShape.circle,
                      color: Appc.PrimaryColor.withOpacity(.08)) ,
                      child: Image.asset("lib/Base/Assets/Images/help.png",color: Appc.PrimaryColor,)
                      ),
                      SizedBox(width: 2.w,)
                      ,Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                                 Text("Help",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize: 8.3333.sp ),),
                           Text("Get Help from Us",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize: 6.sp ,color: Color(0xffAAAAAA)),),
                        
    
                        ],
                      ),
                      Expanded(child: Container()),
                       Icon(Icons.chevron_right,color: Appc.PrimaryColor,size: 4.h,),
                            SizedBox(width: 3.w,),
                    ],
                   ),
                   SizedBox(height: 5.h,),
                    Row(
                    children: [
                       Container(
                        width: 7.6.w,
                        height: 7.6.w,
                       
                        decoration: BoxDecoration(shape: BoxShape.circle,
                      color: Appc.PrimaryColor.withOpacity(.08)) ,
                      child: Image.asset("lib/Base/Assets/Images/setting.png",color: Appc.PrimaryColor,)
                      ),
                      SizedBox(width: 2.w,)
                      ,Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                                 Text("Settings",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize: 8.3333.sp ),),
                           Text("Edit Preferences,Delete Account",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize: 6.sp ,color: Color(0xffAAAAAA)),),
                        
    
                        ],
                      ),
                      Expanded(child: Container()),
                       Icon(Icons.chevron_right,color: Appc.PrimaryColor,size: 4.h,),
                            SizedBox(width: 3.w,),
                    ],
                   ),
                   SizedBox(height: 6.h,),
                   Container(
                    width: 85.w,
                    height: 0.2.h,
                    color: Color(0xffAAAAAA).withOpacity(0.6),
                   ),
                   SizedBox(height: 3.5.h,),
                    Text("FAQ",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize: 8.sp ),),
                    SizedBox(height: 0.7.h,),    Text("ABOUT US",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize: 8.sp ),),
                      SizedBox(height: 0.7.h,),     Text("CONTACT US",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize: 8.sp ),),
                      SizedBox(height: 0.7.h,),     Text("TERMS OF USE",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize: 8.sp ),),
                     SizedBox(height: 0.7.h,),      Text("PRIVACY POLICY",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize: 8.sp ),),
                        SizedBox(height: 2.h,), 
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 60.7.w,
                          height: 4.5.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Appc.PrimaryColor,borderRadius: BorderRadius.circular(17.3)),
                        child: Text("Log out",style: GoogleFonts.poppins(fontSize: 11.3.sp,fontWeight: FontWeight.w400,color: Colors.white),),
                        ),
                        
                      ) ,
                      SizedBox(height: 2.h,) ,
       Align(
      alignment: Alignment.center,
      child: Text("App version 1.2.2",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize: 6.sp ,color: Colors.black))),
                        
                ],
              ),
            ),
          ) ,
      ),
    );
  }
}