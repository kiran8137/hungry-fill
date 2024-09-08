import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/core/constants/constant.dart';

import 'package:hungry_fill/core/functions/functions.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';
import 'package:hungry_fill/presentation/pages/cart_page/cart_components/cart_components.dart';
import 'package:hungry_fill/presentation/pages/checkout_page/checkout_page.dart';

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
  String? carttotalprice ;

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
         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 330,
        height: 40,
        child: FloatingActionButton.extended(
          backgroundColor: primarycolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () async {
             Navigator.push(context, MaterialPageRoute(builder: (context)=> CheckoutPage(restaurantname : widget.restaurantname! , restaurantid: widget.restaurantid!,userid: FirebaseAuth.instance.currentUser!.uid, carttotalprice: carttotalprice!,)));
          },
          label:  
              Text(
                'Procced to Check out',
                style: GoogleFonts.breeSerif(color: Colors.white, fontSize: 18),
              ),
           
        ),
      ),
        // floatingActionButton: GestureDetector(
        //   onTap: () {
        //     //carttotal(dishids: dishids);
        //   },
        //   child: cartFloatingActionButton(),
        // ),
        
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
                          stream: getCartInStream(restaurantid: widget.restaurantid!),
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
                        if(snapshot.hasData){
                          carttotalprice = (snapshot.data! + packagingcharge + deliveycharge).toString();
                          debugPrint(" cart total $carttotalprice");
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
