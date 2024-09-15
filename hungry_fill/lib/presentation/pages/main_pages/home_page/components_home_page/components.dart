import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/data/model/dish_category_model/dish_category_model.dart';
 
 
import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:hungry_fill/presentation/pages/filtered_dishes/filtered_dishes_page.dart';
import 'package:hungry_fill/presentation/pages/restaurant/restuarant_screen.dart';
import 'package:hungry_fill/presentation/pages/widgets/recommended_res_widget.dart';
 

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
        return Column(
        children: [
          GestureDetector(
            onTap: () async{
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>   FilteredDishesPage(dishCategoryId: filteroption.dishcategoryid! , dishCategoryName: filteroption.dishcategoryname!,)));
               
            },
            child: Container(
                  height: 65.h,
                  width: 65.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                       
                      image: DecorationImage(
                          image: NetworkImage(filteroption.dishcategoryimgeurl!), fit: BoxFit.fill)),
                ),
          ),
                Text(filteroption.dishcategoryname!,
                style: const TextStyle(fontWeight: FontWeight.bold),
                )
        ],
      );
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



 ListView restaurants(GetRestaurantSuccessState state) {
    return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.restaurants.length,
                          separatorBuilder: (context, index) =>
                                SizedBox(
                                height: 10.h,
                              ),
                          itemBuilder: (context, index) {
                            final restaurant = state.restaurants[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RestuarantScreen(
                                              resuerid: restaurant.restaurantuserid,
                                              restaurantname:
                                                  restaurant.restaurantname,
                                              restaurantdistrict: restaurant
                                                  .restaurantdistrict,
                                              restaurantplace:
                                                  restaurant.restaurantplace,
                                            )));
                              },
                              child: Container(
                                height: 110.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                      255, 245, 245, 245),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 135.h,
                                        width: 130.w,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/biriyani_image.jpg"),
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                        SizedBox(
                                        width: 10.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 140.w,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              restaurant.restaurantname!,
                                              style: GoogleFonts.amaranth(
                                                  fontSize: 25.sp,
                                                  fontWeight:
                                                      FontWeight.bold),
                                            ),
                                          ),
                                          Text(
                                            restaurant.restaurantplace!,
                                            style: GoogleFonts.abhayaLibre(
                                              fontSize: 15.sp,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
  }
