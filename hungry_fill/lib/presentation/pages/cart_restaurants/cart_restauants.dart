import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:hungry_fill/presentation/pages/cart_page/cart_page.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    BlocProvider.of<RestaurantBloc>(context).add(GetRestaurantsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.white,
          title: Text("Cart"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: BlocBuilder<RestaurantBloc, RestaurantState>(
              builder: (context, state) {
            if (state is GetRestaurantSuccessState) {
              return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: state.restaurants.length,
                  itemBuilder: (context, index) {
                    final restaurants = state.restaurants[index];
                    return Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.20),
                                spreadRadius: 0,
                                blurRadius: 7,
                                offset: const Offset(0, 5))
                          ]),

                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(restaurants.restaurantname!,
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700
                                ),
                                ),
                                Icon(Icons.arrow_forward_ios,
                                size: 15,
                                
                            
                                )
                              ],
                            ),
                          ),
                    );
                    // ListTile(
                    //   onTap: (){
                    //     Navigator.push(context, (MaterialPageRoute(builder: (context)=> CartPage(restaurantid: restaurants.userid, restaurantname: restaurants.restaurantname,))));
                    //   },
                    //   title: Text(restaurants.restaurantname!),
                    // );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        )));
  }
}
