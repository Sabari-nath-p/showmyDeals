import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_my_deals/Screens/DetailedView/Model/OfferDataModel.dart';
import 'package:sizer/sizer.dart';

class GroupCard extends StatelessWidget {
  var members;
  GroupCard({super.key, required this.members});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 20.h,
      margin: EdgeInsets.symmetric(vertical: 2.3.w),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red.withOpacity(0.9),
          ),
          borderRadius: BorderRadius.circular(7)),
      child: Column(
        children: [
          SizedBox(
            height: 3.h,
          ),
          Icon(
            Icons.location_on,
            color: Colors.red.withOpacity(0.9),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            members.name!,
            style: GoogleFonts.poppins(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            members.address!,
            style: GoogleFonts.poppins(
                fontSize: 6.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
