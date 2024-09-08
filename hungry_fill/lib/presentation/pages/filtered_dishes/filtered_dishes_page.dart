import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';
import 'package:hungry_fill/presentation/bloc/filter_homepage/filter_bloc.dart';
import 'package:hungry_fill/presentation/pages/restaurant/restuarant_screen.dart';

class FilteredDishesPage extends StatelessWidget {
  const FilteredDishesPage(
      {super.key,
      required this.dishCategoryId,
      required this.dishCategoryName});

  final String dishCategoryId;
  final String dishCategoryName;
 
 

 
  @override
  Widget build(BuildContext context) {
     context.read<FilterBloc>().add(GetFilteredDishes(dishCategoryId: dishCategoryId));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Showing Result for "${dishCategoryName}"',
                style: GoogleFonts.archivo(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 25),
              BlocBuilder<FilterBloc, FilterState>(
                builder: (context, state) {
                  if (state is FilterDishesInitial) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is FilterDishesEmpty) {
                    return Center(
                      child: Text('No dishes found'),
                    );
                  }
                  if (state is FilterDishesError) {
                    return Center(
                      child: Text(
                          "Something went wrong..! We are working on it..!"),
                    );
                  }
                  if (state is FilteredDishesSuccess) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.filtereddish.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final filterDish = state.filtereddish[index];
                        return Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.20),
                                    spreadRadius: 0,
                                    blurRadius: 8,
                                    offset: const Offset(0, 5))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 5, bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${filterDish.restaurant.restaurantname}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 160,
                                  width: double.infinity,
                                  //color: Colors.blue,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: 160,
                                          width: 334,
                                          decoration: BoxDecoration(
                                            // color: dish.dishstock == 'IN'
                                            //     ? const Color.fromARGB(255, 246, 245, 245)
                                            //     : const Color.fromARGB(255, 165, 164, 164),
                                            color: Colors.white,
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 231, 231, 231)),

                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 120,
                                                  width: 129,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              filterDish
                                                                  .dishes[index]
                                                                  .image1!))),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: 165,
                                                        child: Text(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          "${filterDish.dishes[index].dishname}",
                                                          style: GoogleFonts.rubik(
                                                              // color: dish.dishstock == 'IN'
                                                              //     ? Colors.black
                                                              //     : const Color.fromARGB(
                                                              //         255, 93, 92, 92),\
                                                              color: Colors.black,
                                                              fontSize: 23,
                                                              fontWeight: FontWeight.w600),
                                                        ),
                                                      ),
                                                      Text(
                                                        // "₹{dish.dishprice!}"
                                                        "₹${filterDish.dishes[index].dishprice}",
                                                        style: GoogleFonts.aBeeZee(
                                                            // color: dish.dishstock == 'IN'
                                                            //     ? Colors.black
                                                            //     : const Color.fromARGB(
                                                            //         255, 93, 92, 92),
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(
                                                        "${filterDish.dishes[index].dishprice} serve",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    114,
                                                                    114,
                                                                    114)),
                                                      ),
                                                      const SizedBox(
                                                        height: 4,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          CartModel cartmodel = CartModel(
                                                              userid: FirebaseAuth
                                                                  .instance.currentUser?.uid,
                                                              dishid: filterDish.dishes[index].dishid,
                                                              restaurantid: filterDish.restaurant.restaurantuserid,
                                                              dishquantity: 1,
                                                              priceperquantity:
                                                                  int.parse(filterDish.dishes[index].dishprice!),
                                                              dishname: filterDish.dishes[index].dishname,
                                                              dishimage:filterDish.dishes[index].image1);
                                                          //createcart();
                                                          BlocProvider.of<DishBloc>(context)
                                                              .add(AddDishToCartEvent(
                                                                  cart: cartmodel));
                                                        },
                                                        child: Container(
                                                          height: 45,
                                                          width: 155,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: primarycolor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              // dish.dishstock == 'IN'
                                                              //     ? "ADD"
                                                              //     : 'Out of stock',
                                                              'ADD',
                                                              style: GoogleFonts
                                                                  .abrilFatface(
                                                                // color: dish.dishstock == 'IN'
                                                                //     ? Colors.white
                                                                //     : const Color.fromARGB(
                                                                //         255, 204, 203, 203),
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                            width: 10,
                                          ),
                                      itemCount: filterDish.dishes.length),
                                ),
                                const Divider(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RestuarantScreen(
                                                  resuerid: filterDish.restaurant.restaurantuserid,
                                                  restaurantname: filterDish.restaurant.restaurantname,
                                                  restaurantdistrict: filterDish.restaurant.restaurantdistrict,
                                                  restaurantplace: filterDish.restaurant.restaurantplace,
                                                )));
                                  },
                                  child: SizedBox(
                                    child: Row(
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'View Full Menu',
                                          style: GoogleFonts.montserrat(),
                                        ),
                                        const SizedBox(width: 5),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text(
                          "Something went wrong..! We are working on it..!"),
                    );
                  }
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
