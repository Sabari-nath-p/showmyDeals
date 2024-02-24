import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:show_my_deals/Base/AppColor.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/ShimmerScreen/offerCardShimmer.dart';
import 'package:show_my_deals/Screens/HomeScreen/HomeViews/ShimmerScreen/offerShimmerScreen.dart';
import 'package:sizer/sizer.dart';

class HomeScreenShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.2.w),
        color: Colors.white.withOpacity(.9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 21,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 92.1.w,
                height: 5.2.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.grey[100]),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 26.29.w,
                          height: .5.h,
                          margin: EdgeInsets.symmetric(horizontal: 7.89.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Appc.PrimaryColor,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 26.29.w,
                          height: .5.h,
                          margin: EdgeInsets.symmetric(horizontal: 7.89.w),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 92.1.w,
              height: 18.82.h,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 92.1.w,
                height: 5.2.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.grey[100]),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 26.29.w,
                          height: .5.h,
                          margin: EdgeInsets.symmetric(horizontal: 7.89.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Appc.PrimaryColor,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 26.29.w,
                          height: .5.h,
                          margin: EdgeInsets.symmetric(horizontal: 7.89.w),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              runSpacing: 15,
              spacing: 20,
              children: [
                OfferCardShimmer(),
                OfferCardShimmer(),
                OfferCardShimmer(),
                OfferCardShimmer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
