import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';

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
      options: CarouselOptions(height: 210, enlargeCenterPage: true));
}



ListView dishDescription(DishModel dish) {
  return ListView(
    children: [
      Text(dish.dishdescription!,
          style: GoogleFonts.roboto(
              fontSize: 16, color: const Color.fromARGB(255, 84, 84, 84)))
    ],
  );
}
