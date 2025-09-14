 

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';
import 'package:hungry_fill/presentation/pages/dish_detail/components/dish_detail_components.dart';
import 'package:hungry_fill/presentation/pages/widgets/common_components.dart';
import 'package:hungry_fill/widgets/custom_text.dart';

 

class DishDetail extends StatelessWidget {
  const DishDetail({super.key, required this.images, required this.dish, required this.restuaurantid});
  //final PageController _pagecontroller = PageController();
  final List<String> images;
  final DishModel dish;
  final String restuaurantid;

  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    debugPrint(screenHeight.toString());
    return Scaffold(
       //floatingActionButton: floatingActionButton(context),
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   leading: GestureDetector(
        //     onTap: (){
        //       Navigator.pop(context);
        //     },
        //     child: const Icon(Icons.arrow_back_ios_new)),
        // ),
        body: LayoutBuilder(
          builder: (context, constraints) => 
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 
                children: [
                  Stack(
                    children: [
                      dishImagesSlider(images),
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.arrow_back_ios_new)),
                            ),
                              // GestureDetector(
                              //   onTap: () {
                              //       BlocProvider.of<RestaurantBloc>(context)
                              //                     .add(AddRestaurantToWishList(
                              //                         restaurantid:
                              //                             widget.resuerid!));
                              //   },
                              //   child: CircleAvatar(
                              //     backgroundColor: Colors.transparent,
                              //     child: Icon(
                              //                             Icons.favorite_border,
                              //                             color: Colors.white,
                              //                           ),
                              //   ),
                              // )
                          ],
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                                          CustomText(
                        text: dish.dishname.toString(),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(24, 28, 46, 1),
                        ),
                        
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                         
                        CustomText(
                            text:  "${ dish.dishserve!} serve",
                            fontSize: 15.sp,
                            
                            color: const Color.fromRGBO(24, 28, 46, 1),
                            ),
                         
                                            ],
                                          ),
                        
                                          
                                   SizedBox(height: 20.h,),
                                         SizedBox(
                                         
                                          height: constraints.maxHeight > 700 ? 300:200,
                                          // screenHeight * 0.26,
                                          //200,
                                          width: double.infinity,
                                          //color: Colors.grey,
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: dishDescription(dish),
                                          ),
                                         ),
                          ],
                        ),
                      ),
                    )
                    ),
                  
                  
                  
                //  const SizedBox(height: 30),
                        
                 
                 
                        
                 //const SizedBox(height: 25),
                 Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  height: 120.h,
                  width: double.infinity,
                   decoration: const BoxDecoration(
                    color: Color.fromRGBO(240, 245, 250, 1),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(15))
                   ),
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          CustomText(
                           text:  '₹${dish.dishprice}',
                          fontSize: 28.sp,
                          color: const Color.fromRGBO(24, 28, 46, 1),
                          ),
                        ],
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
                           
                            height: 50.h,
                            // 40,
                            
                            //140,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius:
                                  BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: CustomText(
                                text:  "ADD TO CART" ,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ),
                       ),
                    ],
                  ),
                 ),
                  
                ],
              ),
          ),
        ),
        );
  }

 



  
}
