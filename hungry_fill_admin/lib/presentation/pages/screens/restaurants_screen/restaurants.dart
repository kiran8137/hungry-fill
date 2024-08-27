 
import 'package:flutter/material.dart';
 
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/restaurants_screen/components/components.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/restaurants_screen/widgets/category_detail_widget.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/restaurants_screen/widgets/dish_detail.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/restaurant_provider.dart';
import 'package:provider/provider.dart';

class RestaurantsScreen extends StatelessWidget {
  RestaurantsScreen({super.key});

  final tablecontents = [
    "Restaurant Name",
    "Address",
    "Phone number",
    "Active/InActive",
    "               "
  ];

 final TextEditingController categorycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Restaurants',
          style: GoogleFonts.radioCanada(
              fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: restaurantBar(
                context: context, categorycontroller: categorycontroller),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    width: 1000,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 30,
                            width: 1000,
                           
                            child: restaurantDetailTable(tablecontents),
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          height: 450,
                          width: 1000,
                       
                          child: Consumer<RestaurantProvider>(
                            builder: (context, value, child) =>
                                ListView.separated(
                                    itemBuilder: (context, index) {
                                      final restaurant =
                                          value.restaurants[index];
                                      return RestaurantDetailWidget(
                                          restaurant: restaurant);
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                    itemCount: value.restaurants.length),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Categories(),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
