import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/data/model/dish_category_model/dish_category_model.dart';
import 'package:hungry_fill/data/model/restaurant_model/restaurant_model.dart';
 
 
import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:hungry_fill/presentation/pages/filtered_dishes/filtered_dishes_page.dart';
import 'package:hungry_fill/presentation/pages/restaurant/restuarant_screen.dart';
import 'package:hungry_fill/presentation/pages/widgets/recommended_res_widget.dart';
import 'package:hungry_fill/presentation/pages/widgets/restaurant_card_widget.dart';
import 'package:hungry_fill/widgets/custom_text.dart';
 

//dishItems

ListView dishItems({required List<DishCategoryModel> filteroptions}) {
  return ListView.separated(
      separatorBuilder: (context, index) =>   SizedBox(
            width: 15.w,
          ),
      scrollDirection: Axis.horizontal,
      itemCount: filteroptions.length,
      itemBuilder: (context, index) {
        final filteroption = filteroptions[index];
        return  GestureDetector(
          onTap: () {
             Navigator.push(context, CupertinoPageRoute(builder: (context)=>   FilteredDishesPage(dishCategoryId: filteroption.dishcategoryid! , dishCategoryName: filteroption.dishcategoryname!,)));
          },
          child: Container(
            height: 25.h,
            width: 135.w,
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(118, 214, 212, 212),
              borderRadius: BorderRadius.circular(50),
              
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(filteroption.dishcategoryimgeurl ?? "", ),
                  // child:  Image.network(filteroption.dishcategoryimgeurl ?? "", fit: BoxFit.fill,),
                ),
                CustomText(
                  text: filteroption.dishcategoryname.toString(),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 52, 62, 1),
                  )
              ],
            ),
          ),
        );
      //    Column(
      //   children: [
      //     GestureDetector(
      //       onTap: () async{
      //         Navigator.push(context, CupertinoPageRoute(builder: (context)=>   FilteredDishesPage(dishCategoryId: filteroption.dishcategoryid! , dishCategoryName: filteroption.dishcategoryname!,)));
               
      //       },
      //       child:
      //        Container(
      //             height: 65.h,
      //             width: 65.w,
      //             decoration: BoxDecoration(
      //                 shape: BoxShape.circle,
                       
      //                 image: DecorationImage(
      //                     image: NetworkImage(filteroption.dishcategoryimgeurl!), fit: BoxFit.fill)),
      //           ),
      //     ),
      //           Text(filteroption.dishcategoryname!,
      //           style: const TextStyle(fontWeight: FontWeight.bold),
      //           )
      //   ],
      // );
      } 
      );
}


//Recommended Restaurants 

ListView recommendedRestaurans(GetRestaurantSuccessState? state) {
  return ListView.separated(
      separatorBuilder: (context, index) =>   SizedBox(
            width: 10.w,
          ),
      scrollDirection: Axis.horizontal,
      itemCount: state!.restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = state.restaurants[index];
        debugPrint(restaurant.toString());

        return GestureDetector(
          onTap: () {
          
            Navigator.push(context, MaterialPageRoute(builder: (context)=> 
              RestuarantScreen(
              resuerid: restaurant.restaurantuserid,
              restaurantname: restaurant.restaurantname,
              restaurantdistrict: restaurant.restaurantdistrict,
              restaurantplace: restaurant.restaurantplace,
             // isInWishList: false,
              )));
              // .then((_)=>
              //   BlocProvider.of<DishBloc>(context).add(DishGetEvent(resuserid: restaurant.restaurantuserid))
                

              // ).then((_)=>
              // BlocProvider.of<CategoryBloc>(context).add(GetCategories(resuerid: restaurant.restaurantuserid))
              // );
          },
          child: RecommendRestaurant(restaurant: restaurant),
        );
      });
}



//  ListView restaurants(GetRestaurantSuccessState state, bool isInWishList) {
//     return ListView.separated(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: state.restaurants.length,
//                           separatorBuilder: (context, index) =>
//                                 SizedBox(
//                                 height: 24.h,
//                               ),
//                           itemBuilder: (context, index) {
//                             final restaurant = state.restaurants[index];
//                             return GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             RestuarantScreen(
//                                               resuerid: restaurant.restaurantuserid,
//                                               restaurantname:
//                                                   restaurant.restaurantname,
//                                               restaurantdistrict: restaurant
//                                                   .restaurantdistrict,
//                                               restaurantplace:
//                                                   restaurant.restaurantplace,
                                               
//                                             )));
//                               },
//                               child: RestaurantCardWidget(restaurant: restaurant),
//                             );
//                           });
//   }

