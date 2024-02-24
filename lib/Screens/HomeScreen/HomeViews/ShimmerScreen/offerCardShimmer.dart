import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OfferCardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 39.4.w,
        height: 23.11.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  color: Colors.grey[300],
                ),
              ),
            ),
            Positioned(
              bottom: 1.8.h,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 5.3.h,
                color: Colors.grey[300],
                child: Row(
                  children: [
                    Container(
                      width: 13.77.w,
                      height: 4.39.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      width: 14.9.w,
                      height: 2.9.h,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
