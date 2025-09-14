
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/core/constants/assets.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
 
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';
import 'package:hungry_fill/widgets/custom_text.dart';
 

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
                                  //height: 100.h, 
                                  decoration: BoxDecoration(
                                    color:  Color.fromRGBO(240, 245, 250, 1),
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(image: NetworkImage(dish.image1.toString()),alignment: Alignment.topCenter)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                     // Image.network(dish.image1.toString(),fit: BoxFit.contain,),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                             
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                               CustomText(
                                            text: dish.dishname.toString(),
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(50, 52, 62, 1),
                                            ),
                                          CustomText(
                                            text: 'serve : ${dish.dishserve}',
                                            fontSize: 13.sp, 
                                            color: Color.fromRGBO(100, 105, 130, 1),
                                            ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                    text: "₹${dish.dishprice!}",
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: dish.dishstock ==
                                                                'IN'
                                                            ? Color.fromRGBO(24, 28, 46, 1)
                                                            : const Color
                                                                .fromARGB(
                                                                255, 93, 92, 92),
                                                    
                                                  ),
                                              GestureDetector(
                                                onTap: () {
                                                     CartModel cartmodel = CartModel(
                         
                          userid: FirebaseAuth.instance.currentUser?.uid,
                         dishid: dish.dishid, 
                         restaurantid: restaurantid, 
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
                                                child: CircleAvatar(
                                                  radius: 12.h,
                                                  backgroundColor: AppColors.primaryColor,
                                                  child: Image.asset(Assets().plusIcon,color: Colors.white,),
                                                ),
                                              )
                                            ],
                                          )
                                            ],
                                          ),
                                        ),
                                      )
                                     
                                    ],
                                  ),
                                 );
    //  Container(
    //   height: 150.h,
    //   width: double.infinity,
    //   decoration: BoxDecoration(
    //       color:

    //         dish.dishstock == 'IN' ? const Color.fromARGB(255, 246, 245, 245): const Color.fromARGB(255, 165, 164, 164),
    //       borderRadius: BorderRadius.circular(20)),
    //   child: Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child: Row(
    //       children: [
    //         Container(
    //           height: 120.h,
    //           width: 130.w,
    //           decoration: BoxDecoration(
                 
    //               borderRadius:
    //                   BorderRadius.circular(20),
    //                   image: DecorationImage(
    //                     fit: BoxFit.cover,
    //                   image: NetworkImage(
    //                     dish.image1!)
    //                     )
    //                   ),
    //                  // child: Image.network(dish.dishimage!,fit: BoxFit.cover),
    //         ),
    //           SizedBox(
    //           width: 10.w,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(4.0),
    //           child: Column(
    //             crossAxisAlignment:
    //                 CrossAxisAlignment.start,
    //             children: [
    //               SizedBox(
    //                 width: 165.w,
    //                 child: Text(
    //                   overflow: TextOverflow.ellipsis,
    //                   dish.dishname!,
    //                   style: GoogleFonts.rubik(
    //                     color: dish.dishstock == 'IN'? Colors.black: const Color.fromARGB(255, 93, 92, 92),
    //                       fontSize: 23.sp,
    //                       fontWeight: FontWeight.w600),
    //                 ),
    //               ),
    //               Text(
    //                 "₹${dish.dishprice!}",
    //                 style: GoogleFonts.aBeeZee(
    //                   color: dish.dishstock == 'IN'? Colors.black: const Color.fromARGB(255, 93, 92, 92),
    //                     fontSize: 15.sp,
    //                     fontWeight: FontWeight.bold),
    //               ),
    //               Text(
    //                 "${dish.dishserve} serve",
    //                 style:   TextStyle(
    //                     fontSize: 15.sp,
    //                     color: Color.fromARGB(
    //                         255, 114, 114, 114)),
    //               ),
    //                 SizedBox(
    //                 height: 10.h,
    //               ),
    //               GestureDetector(
    //                 onTap: () {
    //                    CartModel cartmodel = CartModel(
                         
    //                       userid: FirebaseAuth.instance.currentUser?.uid,
    //                      dishid: dish.dishid, 
    //                      restaurantid: restaurantid, 
    //                      dishquantity: 1, 
    //                      priceperquantity: int.parse(dish.dishprice!),
    //                      dishname: dish.dishname,
    //                      dishimage: dish.image1
    //                      );
    //                   //createcart();
    //                   BlocProvider.of<DishBloc>(context).add(
    //                     AddDishToCartEvent( 
    //                       cart: cartmodel
    //                     ));
                       
                     
                      
    //                 },
                    
    //                 child: Container(
    //                   height: 40.h,
    //                   width: 155.w,
    //                   decoration: BoxDecoration(
    //                     color: AppColors.primaryColor,
    //                     borderRadius:
    //                         BorderRadius.circular(10),
    //                   ),
    //                   child: Center(
    //                     child: Text(
    //                      dish.dishstock == 'IN'? "ADD": 'Out of stock',
    //                       style: GoogleFonts.abrilFatface(
    //                           color:  dish.dishstock == 'IN'?Colors.white:const Color.fromARGB(255, 204, 203, 203),
    //                           fontSize: 20.sp,
    //                           fontWeight:
    //                               FontWeight.w400,
    //                               ),
    //                     ),
    //                   ),
    //                 ),
    //               )
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
