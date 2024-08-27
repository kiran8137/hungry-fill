import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry_fill_admin/data/models/restaurant_model.dart';

class RestaurantDetailWidget extends StatelessWidget {
  const RestaurantDetailWidget({
    super.key,
    required this.restaurant,
  });

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: [
            const SizedBox(width: 10),
            SizedBox(
              width: 80,
              child: Text(
                restaurant.restaurantname!,
                style: const TextStyle(
                    fontWeight:
                        FontWeight.w700),
              ),
            ),
            const SizedBox(width: 195),
            SizedBox(
              width: 150,
              child: Text(
                  "${restaurant.restaurantplace!}, ${restaurant.restaurantdistrict}"),
            ),
            const SizedBox(width: 135),
            Text(restaurant
                .restaurantmobileNo!),
            const SizedBox(width: 230),
            const Text('active'),
            // const SizedBox(width: 150),
          ],
        ));
  }
}
