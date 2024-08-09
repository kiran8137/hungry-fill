import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/data/repository/cart_repo_imp/cart_repo_impl.dart';
import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:hungry_fill/presentation/pages/cart_restaurants/cart_restauants.dart';
 
import 'package:hungry_fill/presentation/pages/main_pages/home_page/components_home_page/components.dart';

import 'package:hungry_fill/presentation/pages/main_pages/widgets/search_widget.dart';
import 'package:hungry_fill/presentation/pages/restaurant/restuarant_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RestaurantBloc>(context).add(GetRestaurantsEvent());

    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            label: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            backgroundColor: primarycolor,
            onPressed: () {
             //  adddish();
               Navigator.push(context, MaterialPageRoute(builder: (context)=> const Cart()));
            }),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchWidget(searchcontroller: searchcontroller),
                  const SizedBox(height: 35),
                  SizedBox(
                    height: 70,
                    child: dishItems(),
                  ),
                  const SizedBox(height: 35),
                  Text(
                    "Recommended Restaurants",
                    style: GoogleFonts.abhayaLibre(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  BlocBuilder<RestaurantBloc, RestaurantState>(
                    builder: (context, state) {
                      if (state is GetRestaurantSuccessState) {
                        return SizedBox(
                            height: 160, child: recommendedRestaurans(state));
                      } else {
                        return Center(
                          child: LoadingAnimationWidget.horizontalRotatingDots(
                              color: primarycolor, size: 20),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Restaurants",
                    style: GoogleFonts.abhayaLibre(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                            //color: Colors.red,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            "Low To High",
                            style: GoogleFonts.alef(),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                            //color: Colors.red,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            "High To Low",
                            style: GoogleFonts.alef(),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                            //color: Colors.red,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            "Rating 4+",
                            style: GoogleFonts.alef(),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<RestaurantBloc, RestaurantState>(
                    builder: (context, state) {
                      if (state is GetRestaurantSuccessState) {
                        return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.restaurants.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 10,
                                ),
                            itemBuilder: (context, index) {
                              final restaurant = state.restaurants[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RestuarantScreen(
                                                resuerid: restaurant.userid,
                                                restaurantname:
                                                    restaurant.restaurantname,
                                                restaurantdistrict: restaurant
                                                    .restaurantdistrict,
                                                restaurantplace:
                                                    restaurant.restaurantplace,
                                              )));
                                },
                                child: Container(
                                  height: 135,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 245, 245, 245),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 135,
                                          width: 165,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    "assets/biriyani.jpg"),
                                                fit: BoxFit.fill,
                                              )),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 140,
                                              child: Text(
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                restaurant.restaurantname!,
                                                style: GoogleFonts.amaranth(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Text(
                                              restaurant.restaurantplace!,
                                              style: GoogleFonts.abhayaLibre(
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return const Text("no restaurant");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
