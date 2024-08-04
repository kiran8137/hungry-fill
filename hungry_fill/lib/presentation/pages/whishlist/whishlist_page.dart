import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/data/repository/restaurant_repo_impl/restaurant_repo_imp.dart';
import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:hungry_fill/presentation/pages/restaurant/restuarant_screen.dart';
import 'package:hungry_fill/presentation/pages/whishlist/widgets/wishlist_widget.dart';
 

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: Colors.white,
        title: Text(
          'WishList',
          style: GoogleFonts.rubik(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (context, state) {
          if (state is GetRestaurantsInWishListInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
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
                                          resuerid: wishlistrestaurant.userid,
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
                                  child: Dismissible(
                                    key: Key(index.toString()),
                                    onDismissed: (_){
                                      removeRestaurantWishList(restaurantid: wishlistrestaurant.userid!);
                                    },
                                    child: WishlistWidget(
                                      restaurantname: wishlistrestaurant.restaurantname,
                                      restaurantplace: wishlistrestaurant.restaurantplace,
                                      restaurantdistrict:
                                          wishlistrestaurant.restaurantdistrict,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 5),
                  itemCount: state.wishlistrestaurant.length),
            );
          }

          if (state is GetRestaurantsInWishListErrorState) {
            return const Center(
              child: Text("No Restaurants in wishlist"),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )),
    );
  }
}
