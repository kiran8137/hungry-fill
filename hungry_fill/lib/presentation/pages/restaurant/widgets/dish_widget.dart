
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
 
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';
 

class Dishwidget extends StatelessWidget {
  const Dishwidget({
    super.key,
    required this.dish,
    required this.restaurantid,
    required this.restaurantname,
    required this.ctx
  });

  final DishModel dish;
  final String restaurantid;
  final String restaurantname;
  final BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
          color:
              const Color.fromARGB(255, 246, 245, 245),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 130,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                      BorderRadius.circular(20)),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    dish.dishname!,
                    style: GoogleFonts.abhayaLibre(
                        fontSize: 23,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "₹${dish.dishprice!}",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${dish.dishserve} serve",
                    style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(
                            255, 114, 114, 114)),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                       CartModel cartmodel = CartModel(
                         
                          userid: FirebaseAuth.instance.currentUser?.uid,
                         dishid: dish.dishid, 
                         restaurantid: restaurantid, 
                         dishquantity: 1, 
                         priceperquantity: int.parse(dish.dishprice!),
                         dishname: dish.dishname
                         );
                      //createcart();
                      BlocProvider.of<DishBloc>(context).add(
                        AddDishToCartEvent( 
                          cart: cartmodel
                        ));
                      //BlocProvider.of<DishBloc>(context).add(GetDishInCartEvent(restaurantid: restaurantid));
                    // addDish();

                    // context.read<DishBloc>().stream.listen((state){
                    //   if(state is AddDishToCartSuccesState){
                    //      Navigator.push(ctx, MaterialPageRoute(builder: (context)=> CartPage(restaurantid: restaurantid, restaurantname: restaurantname,)));
                    //   }
                    // });
                     
                      
                    },
                    
                    child: Container(
                      height: 45,
                      width: 155,
                      decoration: BoxDecoration(
                        color: primarycolor,
                        borderRadius:
                            BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "ADD",
                          style: GoogleFonts.abrilFatface(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.w400),
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
  }
}
