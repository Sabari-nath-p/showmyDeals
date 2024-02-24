import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShopDetailedPageShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: 100.w,
            height: 19.29.h,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _buildShimmerOfferView(),
        ],
      ),
    );
  }

  Widget _buildShimmerOfferView() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: 30,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 10),
        // Repeat this shimmer container for each offer item
        for (int i = 0; i < 5; i++)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
