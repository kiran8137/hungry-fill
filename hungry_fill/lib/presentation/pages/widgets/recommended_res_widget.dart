
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/data/model/restaurant_model/restaurant_model.dart';

class RecommendRestaurant extends StatelessWidget {
  const RecommendRestaurant({
    super.key,
    required this.restaurant,
  });

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 315.h,
      width: 250.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
            image: AssetImage("assets/burger.jpg"), fit: BoxFit.fill),
      ),
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 68.h,
        width: 250.w,
        decoration: const BoxDecoration(
          color: Color.fromARGB(138, 0, 0, 0),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.restaurantname!,
              style:
                  GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 255, 255, 255), fontSize: 30.sp),
            )
          ],
        ),
      ),
    );
  }
}
