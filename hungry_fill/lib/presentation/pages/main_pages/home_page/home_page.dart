import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';

import 'package:hungry_fill/presentation/pages/main_pages/widgets/search_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 10,
                            ),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => Container(
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  //color: Colors.green,
                                  image: DecorationImage(
                                      image: AssetImage("assets/food.jpg"),
                                      fit: BoxFit.fill)),
                            )),
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
                          height: 160,
                          child: BlocBuilder<RestaurantBloc, RestaurantState>(
                            builder: (context, state) {
                              if (state is GetRestaurantSuccessState) {
                                return ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          width: 10,
                                        ),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.restaurants.length,
                                    itemBuilder: (context, index) {
                                      final restaurant =
                                          state.restaurants[index];

                                      return Container(
                                        height: 315,
                                        width: 250,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/food-dosa.jpeg"),
                                              fit: BoxFit.fill),
                                        ),
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height: 68,
                                          width: 250,
                                          decoration: const BoxDecoration(
                                            color: Color.fromARGB(86, 0, 0, 0),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(16),
                                                bottomRight:
                                                    Radius.circular(16)),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                restaurant.restaurantname!,
                                                style: GoogleFonts.amaranth(
                                                    color: Colors.white,
                                                    fontSize: 30),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              } else {
                                return Text("not restaurants");
                              }
                            },
                          ),
                        );
                      } else {
                        return Text("no restaurant found");
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

                      if(state is GetRestaurantSuccessState){


                        return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.restaurants.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (context, index) {

                          final restaurant = state.restaurants[index];
                          return 
                        
                        Container(
                          height: 135,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 245, 245, 245),
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
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                        image:
                                            AssetImage("assets/biriyani.jpg"),
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                    restaurant.restaurantname!,
                                      style: GoogleFonts.amaranth(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      restaurant.restaurantplace!,
                                      style:
                                          GoogleFonts.abhayaLibre(fontSize: 15),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                        }
                      );
                      }else{
                        return Text("no restaurant");
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
