

//Dishlist bar
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/widgets/add_dish_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/category/category_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/dish_category/dish_category_bloc.dart';

Container dishListBar(BuildContext context) {
    return Container(
            width: double.infinity,
            height: 60,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dishes List',
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 34,
                        width: 250,
                        //color: Colors.red,
                        child: TextFormField(
                          style: const TextStyle(height: 1.3),
                          decoration: InputDecoration(
                              hintText: 'Search Restaurants',
                              hintStyle: const TextStyle(fontSize: 11),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      const Icon(
                        Icons.search,
                        size: 30,
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                           BlocProvider.of<CategoryBloc>(context)
                              .add(GetCategoriesEvent());
                         
                           BlocProvider.of<DishCategoryBloc>(context)
                              .add(GetDishCategoriesEvent());
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return const AddDish();
                              });
                        },
                        child: Container(
                          height: 34,
                          width: 120,
                          decoration: BoxDecoration(
                              color: primarycolor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                              Text(
                                'Dish',
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }




   