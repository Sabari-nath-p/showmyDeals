import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/main.dart';
import 'package:sizer/sizer.dart';

class AddBagScreen extends StatelessWidget {
  const AddBagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: AppBar(
      //     backgroundColor: Colors.white,
      //   leadingWidth: 36.51.w,
      //   leading: Row(
      //     children: [
      //       SizedBox(
      //         width: 5.2.w,
      //       ),
      //       Expanded(
      //           child: Image.asset("lib/Base/Assets/Images/badgelogo.png")),
      //     ],
      //   ),
      //   actions: [
      //     Container(
      //       width: 35.21.w,
      //       height: 3.11.h,
      //       padding: EdgeInsets.symmetric(horizontal: 5),
      //       decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(10),
      //           border: Border.all(color: Appc.LightGery)),
      //       child: Row(
      //         children: [
      //           Icon(
      //             Icons.location_on,
      //             color: Appc.PrimaryColor,
      //             size: 4.w,
      //           ),
      //           SizedBox(
      //             width: 5,
      //           ),
      //           Expanded(
      //             child: DropdownButton(
      //               value: "kannur",
      //               style: GoogleFonts.poppins(
      //                   color: Colors.black,
      //                   fontSize: 10.sp,
      //                   fontWeight: FontWeight.w400),
      //               items: DistrictList.map((e) => DropdownMenuItem(
      //                   value: e,
      //                   child: Text(
      //                     e.toString().capitalize.toString(),
      //                     style: GoogleFonts.poppins(
      //                         color: Colors.black,
      //                         fontSize: 10.sp,
      //                         fontWeight: FontWeight.w300),
      //                   ))).toList(),
      //               isExpanded: true,
      //               underline: Container(),
      //               onChanged: (v) {},
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     SizedBox(
      //       width: 5.2.w,
      //     ),
      //   ],
      // ) ,
      body: Container(
        width: 100.w,
        height: 100.h,
        color: Colors.white,
        child: Padding(
          padding:  EdgeInsets.only(left: 2.4.w),
          child: Column(
            children: [
              SizedBox(height:1.753.h,),
                   Container(
                    width: 92.01.w,
                    height: 6.7.h,
                   color: Color(0xffF6F8FF
),
child: Row(
 
  children: [
    SizedBox(width: 2.w,),
    Container(
      width:16.8.w ,
      height: 4.7.h,
     decoration: BoxDecoration( color: Color(0xffD9D9D9D),borderRadius: BorderRadius.circular(8)),
    ),
    SizedBox(width: 2.w,),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
              Text("Nesto Hypermart",style: GoogleFonts.poppins(fontWeight:FontWeight.w700,fontSize:7.5.sp),),
                           Text("Daily Deals",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize: 7.sp ,color: Colors.black),),
          Row(
            children: [
               Text("Validity :",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize: 7.sp,color: Appc.PrimaryColor ),),
                           Text("10 Aug-12 Aug",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize: 7.sp ,color: Colors.black),),
        
            ],
          )             
      
      ],
    ),
    Expanded(child: Container()),
    Container(
      width: 13.4.w,
      height:3.3.h ,
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(29.w),color: Appc.PrimaryColor),
   child: SizedBox(
    height: 4.2.w,
    width: 4.2.w,
    
    child: Image.asset("lib/Base/Assets/Images/deleteicon.png")),
    ),
    SizedBox(width: 4.w,),
  
  ],
),
                   ),
                   SizedBox(height: 1.h,)


            ],
          ),
        ),
      ),
    );
  }
}