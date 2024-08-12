import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/presentation/bloc/category_bloc/category_bloc.dart';
 
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';
 
import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:hungry_fill/presentation/pages/restaurant/restuarant_screen.dart';
import 'package:hungry_fill/presentation/pages/widgets/recommended_res_widget.dart';
 

//dishItems

ListView dishItems() {
  return ListView.separated(
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
                    image: AssetImage("assets/food.jpg"), fit: BoxFit.fill)),
          ));
}


//Recommended Restaurants 

ListView recommendedRestaurans(GetRestaurantSuccessState? state) {
  return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
      scrollDirection: Axis.horizontal,
      itemCount: state!.restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = state.restaurants[index];
        print(restaurant);

        return GestureDetector(
          onTap: () {
          
            Navigator.push(context, MaterialPageRoute(builder: (context)=> 
              RestuarantScreen(
              resuerid: restaurant.restaurantuserid,
              restaurantname: restaurant.restaurantname,
              restaurantdistrict: restaurant.restaurantdistrict,
              restaurantplace: restaurant.restaurantplace,
              ))).then((_)=>
                BlocProvider.of<DishBloc>(context).add(DishGetEvent(resuserid: restaurant.restaurantuserid))
                

              ).then((_)=>
              BlocProvider.of<CategoryBloc>(context).add(GetCategories(resuerid: restaurant.restaurantuserid))
              );
          },
          child: RecommendRestaurant(restaurant: restaurant),
        );
      });
}



 ListView restaurants(GetRestaurantSuccessState state) {
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
                                              resuerid: restaurant.restaurantuserid,
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
  }
