import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hungry_fill/core/functions/functions.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';
import 'package:hungry_fill/presentation/pages/cart_page/cart_components/cart_components.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, this.restaurantid, this.restaurantname});

  final String? restaurantid;
  final String? restaurantname;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<String> dishids = [];
  int? carttotal = 0;

  @override
  void initState() {
    // BlocProvider.of<DishBloc>(context).add(GetCartEvent(restaurantid: widget.restaurantid));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context , widget.restaurantname!),
        backgroundColor: Colors.white,
        floatingActionButton: GestureDetector(
          onTap: () {
            //carttotal(dishids: dishids);
          },
          child: cartFloatingActionButton(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: BlocBuilder<DishBloc, DishState>(builder: (context, state) {
          if (state is GetCartInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  SizedBox(
                      height: 310,
                      width: double.infinity,
                      child: StreamBuilder<List<CartModel>>(
                          stream: getCart(restaurantid: widget.restaurantid!),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return cartDishDetail(snapshot);
                          })),


                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 245, 245, 245),
                  ),
                  const SizedBox(
                    height: 30,
                  ),


                  StreamBuilder<int>(
                      stream: getcarttotal(
                        userid: FirebaseAuth.instance.currentUser?.uid,
                        restaurantid: widget.restaurantid,
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Container(

                        decoration: BoxDecoration(
                           color: const Color.fromARGB(155, 248, 248, 248),
                           borderRadius: BorderRadius.circular(10)
                        ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: billDetails(snapshot),
                          ));
                      })
                ],
              ),
            ),
          );
        }));
  }

 
  

  
}
