import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';
 
import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:hungry_fill/presentation/pages/restaurant/restuarant_screen.dart';
 

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
          
            Navigator.push(context, MaterialPageRoute(builder: (context)=>   RestuarantScreen(
              resuerid: restaurant.userid,
              restaurantname: restaurant.restaurantname,
              restaurantdistrict: restaurant.restaurantdistrict,
              restaurantplace: restaurant.restaurantplace,
              ))).then((_)=>
                BlocProvider.of<DishBloc>(context).add(DishGetEvent(resuserid: restaurant.userid))
                

              ).then((_)=>
              BlocProvider.of<DishBloc>(context).add(GetCategories(resuerid: restaurant.userid))
              );
          },
          child: Container(
            height: 315,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                  image: AssetImage("assets/food-dosa.jpeg"), fit: BoxFit.fill),
            ),
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 68,
              width: 250,
              decoration: const BoxDecoration(
                color: Color.fromARGB(86, 0, 0, 0),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.restaurantname!,
                    style:
                        GoogleFonts.roboto(color: const Color.fromARGB(255, 255, 255, 255), fontSize: 30),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
