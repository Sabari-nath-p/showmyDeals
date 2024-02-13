import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 39.4.w,
      height: 26.11.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                "http://res.cloudinary.com/djodvwkdf/image/upload/v1701776852/thumbs/cbrd8bsviufvjq6lwfva.jpg",
                fit: BoxFit.fill,
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
                color: Colors.white.withOpacity(.83),
                child: Row(
                  children: [
                    Container(
                      width: 13.77.w,
                      height: 4.39.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)),
                      child: Image.network(
                        "https://res.cloudinary.com/djodvwkdf/image/upload/v1680241181/logo/bismi_gauotb.png",
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
