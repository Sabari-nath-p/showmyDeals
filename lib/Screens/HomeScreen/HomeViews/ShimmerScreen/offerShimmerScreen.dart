import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

Widget offerShimmerEffect() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 1.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.2.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Container()),
                    Container(
                      width: 18.1.w,
                      height: 2.9.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(11.5),
                      ),
                    ),
                    SizedBox(width: 1.w),
                    Container(
                      width: 18.1.w,
                      height: 2.9.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(11.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Container(
                  width: 92.w,
                  height: 42.82.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(height: 2.h),
                Container(
                  width: 92.w,
                  height: 5.5.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(9.7),
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 12.sp,
                        color: Colors.grey[300],
                      ),
                    ),
                    SizedBox(width: 1.w),
                    Container(
                      width: 30.w,
                      height: 3.5.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(9.7),
                      ),
                    ),
                    SizedBox(width: 1.w),
                  ],
                ),
                SizedBox(height: 2.w),
                Container(
                  height: 8.sp,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 1.w),
                Container(
                  height: 8.sp,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 2.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Stores where this offer is available",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Container(
                  width: 100.w,
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    runSpacing: 10,
                    spacing: 2,
                    runAlignment: WrapAlignment.start,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      Container(
                        width: 29.5.w,
                        height: 6.2.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.3.w),
                          color: Colors.grey[300],
                        ),
                      ),
                      Container(
                        width: 29.5.w,
                        height: 6.2.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.3.w),
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
