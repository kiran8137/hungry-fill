import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';
import 'package:hungry_fill/widgets/custom_text.dart';

CarouselSlider dishImagesSlider(List<String> images) {
  return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (context, index, realIndex) {
        final image = images[index];
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 200.h, enlargeCenterPage: true,
        viewportFraction: 1
        ));
}



ListView dishDescription(DishModel dish) {
  return ListView(
    children: [
      CustomText(
        text : dish.dishdescription!,
        fontSize: 14.sp,
        color: Color.fromRGBO(160, 165, 186, 1),
        
         )
    ],
  );
}
