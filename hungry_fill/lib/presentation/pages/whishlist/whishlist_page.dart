import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:hungry_fill/presentation/pages/restaurant/restuarant_screen.dart';
import 'package:hungry_fill/presentation/pages/whishlist/widgets/wishlist_widget.dart';

class WishListPage extends StatelessWidget {
   const WishListPage({super.key});

  final bool isfav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.white,
        title: Text(
          'WishList',
          style: GoogleFonts.rubik(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocConsumer<RestaurantBloc, RestaurantState>(
        listener:(context, state) {
           if (state is GetRestaurantsInWishListInitial) {
              const Center(
              child: CircularProgressIndicator(),
            );
          }else{
            if(state is RemoveRestaurantsInWishListSucces){
              context.read<RestaurantBloc>().add(GetRestaurantsInWishList());
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 38, 0),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                          style: GoogleFonts.aBeeZee(fontSize: 15),
                          "Remove Successfully"),
                    ),
                  ),
                ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ));
          }
          }
          
        },
        builder: (context, state) {
          log(state.runtimeType.toString());
         

         
          if (state is GetRestaurantsInWishListSucces) {
            return AnimationLimiter(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final wishlistrestaurant = state.wishlistrestaurant[index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RestuarantScreen(
                                        resuerid: wishlistrestaurant.restaurantuserid,
                                        restaurantname:
                                            wishlistrestaurant.restaurantname,
                                        restaurantdistrict: wishlistrestaurant
                                            .restaurantdistrict,
                                        restaurantplace: wishlistrestaurant
                                            .restaurantplace)));
                          },
                          // child: RecommendRestaurant(restaurant: wishlistrestaurant)
                          child: AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 900),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child:
                                    
                                   Dismissible(
                                    direction: DismissDirection.endToStart,
                                    background: const Icon(CupertinoIcons.delete),
                                    onDismissed: (direction){
                                      context.read<RestaurantBloc>().add(RemoveRestaurantInWishList(restaurantid: wishlistrestaurant.restaurantuserid!));

                                    },
                                    key: Key(wishlistrestaurant.restaurantuserid!),
                                     child: WishlistWidget(
                                      restaurantname:
                                          wishlistrestaurant.restaurantname,
                                      restaurantplace:
                                          wishlistrestaurant.restaurantplace,
                                      restaurantdistrict:
                                          wishlistrestaurant.restaurantdistrict,
                                       ),
                                   ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 5),
                  itemCount: state.wishlistrestaurant.length),
            );
          }

          if (state is GetRestaurantsInWishListErrorState) {
            return const Center(
              child: Text("No Restaurants in wishlist"),
            );
          } else {
            log('else coming');
            return const Center(child: CircularProgressIndicator());
          }
        },
      )),
    );
  }
}
