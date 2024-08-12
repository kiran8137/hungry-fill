import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';
 
import 'package:hungry_fill/presentation/pages/cart_page/cart_page.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
  //  BlocProvider.of<RestaurantBloc>(context).add(GetRestaurantsEvent());
  BlocProvider.of<DishBloc>(context).add(GetRestaurantsInCart());
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
          title: const Text("Cart"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: BlocBuilder<DishBloc, DishState>(
              builder: (context, state) {

            if(state is GetRestaurantsInCartIsEmpty){
              return const Center(child: Text("No cart Added ", style: TextStyle(color: Colors.black),));
            }
            if (state is GetRestaurantsInCartSuccess) {
              debugPrint('${state.runtimeType}');
              return  
              ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemCount: state.restaurantsincart.length,
                  itemBuilder: (context, index) {
                    final restaurants = state.restaurantsincart[index];
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, (MaterialPageRoute(builder: (context)=> CartPage(restaurantid: restaurants.restaurantuserid, restaurantname: restaurants.restaurantname,))));
                      },
                      child: Container(
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
                                  const Icon(Icons.arrow_forward_ios,
                                  size: 15,
                                  
                              
                                  )
                                ],
                              ),
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
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        )));
  }
}
