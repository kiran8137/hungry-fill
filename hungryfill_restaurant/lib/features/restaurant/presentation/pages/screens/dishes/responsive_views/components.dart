import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/widgets/dish_detail_mobile_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/widgets/dish_detail_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/widgets/components.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/provider/dish_provider.dart';

Padding dishListWebView(DishProvider value , List<String> tablecontents) {
    return Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      // width: 1000,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 30,
                              width: 1000,
                              // color: Colors.blue,
                              child: dishDetailTable(
                                tablecontents,
                              ),
                            ),
                          ),
                          const Divider(),
                          value.dishes.isEmpty
                              ? Center(
                                  child: Text(
                                  "No dishes added....!",
                                  style: GoogleFonts.adamina(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ))
                              : SizedBox(
                                  height: 450,
                                  width: double.infinity,
                                  
                                  child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        final dishes = value.dishes[index];
                                        return DishDetailWidget(
                                            dishes: dishes);
                                      },
                                      separatorBuilder: (context, index) =>
                                          const Divider(),
                                      itemCount: value.dishes.length),
                                ),
                        ],
                      ),
                    ),
                  );
  }



 Padding dishListMobileView(DishProvider value) {
    return Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      // color: Colors.white,
                      width: double.infinity,
                      height: 620,
                      child: value.dishes.isEmpty
                          ? const Center(
                              child: Center(
                                child: Text('No orders found'),
                              ),
                            )
                          : GridView.builder(
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 8.0,
                                      crossAxisSpacing: 8.0),
                              itemCount: value.dishes.length,
                              itemBuilder: (context, index) {
                                final dish = value.dishes[index];
                                return DishDetailWidgetMobile(dish: dish);
                              }
                              ),
                    ),
                  );
  }