import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_fill/widgets/custom_text.dart';
import 'package:shimmer/shimmer.dart';

class RestaurantShimmerWidget extends StatelessWidget {
  const RestaurantShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 110.h,
      width: double.infinity,
      decoration: BoxDecoration(
         
        
      ),
      child: Shimmer.fromColors(
        baseColor: Color.fromARGB(255, 32, 32, 32),
        highlightColor: Color.fromARGB(255, 51, 47, 47),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                      BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage(
                        "assets/biriyani_image.jpg"),
                    fit: BoxFit.fill,
                  )),
            ),
              SizedBox(
              height: 5.h,
            ),
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 140.w,
                  child: CustomText(
                    fontSize: 20.sp,
                    text:  '',
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(24, 28, 46, 1),
                  ),
                ),
                CustomText(
                  text: 'Burger - Chiken - Riche - Wings ',
                  fontSize: 14.sp,
                  color: Color.fromRGBO(160, 165, 186, 1),
                  )
              ],
            )
          ],
        ),
      ),
    );;
  }
}