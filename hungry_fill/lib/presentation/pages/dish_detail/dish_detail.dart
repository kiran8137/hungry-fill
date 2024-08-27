 

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';
import 'package:hungry_fill/presentation/pages/dish_detail/components/dish_detail_components.dart';
import 'package:hungry_fill/presentation/pages/widgets/common_components.dart';

 

class DishDetail extends StatelessWidget {
  const DishDetail({super.key, required this.images, required this.dish, required this.restuaurantid});
  //final PageController _pagecontroller = PageController();
  final List<String> images;
  final DishModel dish;
  final String restuaurantid;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: floatingActionButton(context),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dishImagesSlider(images),
             
              const SizedBox(height: 30),
              Text(
                dish.dishname!,
                style: GoogleFonts.rubik(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                   "${ dish.dishserve!} serve",
                    style: GoogleFonts.rubik(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 128, 128, 128),
                    ),
                  ),
                   Text(
                    ' ',//serve
                    style: GoogleFonts.rubik(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 128, 128, 128),
                    ),
                  ),
                ],
              ),
             const SizedBox(height: 30),

             Text("About Dish",
              style: GoogleFonts.rubik(
                fontSize: 18,
               // fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 44, 44, 44)

              ),
             ),
             SizedBox(
              height: 200,
              width: double.infinity,
              //color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: dishDescription(dish),
              ),
             ),

             const SizedBox(height: 25),
              Row(
                 
                children: [
                  Text('₹100',
                  style: GoogleFonts.anekDevanagari(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                  ),

                  const SizedBox(width: 6,),
                   GestureDetector(
                    onTap: (){
                       CartModel cartmodel = CartModel(
                         
                          userid: FirebaseAuth.instance.currentUser?.uid,
                         dishid: dish.dishid, 
                         restaurantid: restuaurantid, 
                         dishquantity: 1, 
                         priceperquantity: int.parse(dish.dishprice!),
                         dishname: dish.dishname,
                         dishimage: dish.image1
                         );
                      //createcart();
                      BlocProvider.of<DishBloc>(context).add(
                        AddDishToCartEvent( 
                          cart: cartmodel
                        ));
                    },
                     child: Container(
                      margin: const EdgeInsets.only(),
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                          color: primarycolor,
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                             "ADD" ,
                            style: GoogleFonts.abrilFatface(
                                color:  Colors.white ,
                                fontSize: 20,
                                fontWeight:
                                    FontWeight.w400,
                                    ),
                          ),
                        ),
                      ),
                   ),
                ],
              )
            ],
          ),
        ),
        ),
        );
  }

 



  
}
