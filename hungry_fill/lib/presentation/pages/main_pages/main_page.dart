import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/core/constants/assets.dart';
import 'package:hungry_fill/core/functions/fcm.dart';
import 'package:hungry_fill/data/model/user_model/user_model.dart';

import 'package:hungry_fill/presentation/bloc/filter_homepage/filter_bloc.dart';
import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:hungry_fill/presentation/bloc/user_bloc/users_bloc.dart';
import 'package:hungry_fill/presentation/pages/address/addresses_page.dart';
import 'package:hungry_fill/presentation/pages/cart_page/cart_restauants.dart';
import 'package:hungry_fill/presentation/pages/main_pages/components_main_page/components.dart';
import 'package:hungry_fill/presentation/pages/main_pages/home/components_home_page/components.dart';
import 'package:hungry_fill/presentation/pages/main_pages/home/home_screen.dart';
import 'package:hungry_fill/presentation/pages/main_pages/recent_orders_page/recent_orders.dart';

import 'package:hungry_fill/presentation/pages/main_pages/reciepe_page/reciepe.dart';
import 'package:hungry_fill/presentation/pages/main_pages/search_screen/search_screen.dart';
import 'package:hungry_fill/presentation/pages/main_pages/user_profile/user_profile.dart';
import 'package:hungry_fill/presentation/pages/main_pages/widgets/search_widget.dart';
import 'package:hungry_fill/presentation/pages/restaurant/restuarant_screen.dart';
import 'package:hungry_fill/presentation/pages/widgets/restaurant_card_widget.dart';
import 'package:hungry_fill/presentation/pages/widgets/text_form_field.dart';
import 'package:hungry_fill/widgets/custom_text.dart';
import 'package:hungry_fill/widgets/shimmers/restaurant_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final icons = const [
    ImageIcon(
      AssetImage("assets/home.png"),
      color: Colors.white,
    ),
    // ImageIcon(AssetImage("assets/recipe-book.png"),color: Colors.white,),

    ImageIcon(
      AssetImage("assets/paper-bag.png"),
      color: Colors.white,
    ),

    ImageIcon(
      AssetImage("assets/person.png"),
      color: Colors.white,
    )
  ];
  int currentpageindex = 0;

  UserModel? currentuserinfo;
  final TextEditingController searchcontroller = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<UsersBloc>(context).add(UserGetEvent());
    BlocProvider.of<RestaurantBloc>(context).add(GetRestaurantsEvent());
    BlocProvider.of<FilterBloc>(context).add(GetDishesCategoryFilterOptions());
    context.read<RestaurantBloc>().add(GetRestaurantsInWishList());
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: appBarMain(context: context),

        // bottomNavigationBar: CurvedNavigationBar(
        //   height: 48.h,
        //   items: icons,
        //   index: currentpageindex,
        //   animationDuration: const Duration(milliseconds: 200),
        //    backgroundColor: Colors.white,
        //   color: AppColors.primaryColor,
        //    onTap: (currentindex){
        //     setState(() {
        //       currentpageindex = currentindex;
        //     });
        //    },
        //   ),

        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // CircleAvatar(
                  //   radius: 25,
                  //   child: AssetImage(assetName),
                  //   )
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<UsersBloc>().add(UserGetEvent());
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => UserProfileScreen()));
                        },
                        child: Container(
                          height: 45.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(236, 240, 244, 1),
                              shape: BoxShape.circle),
                          child: Image.asset(Assets().sideMenuIcon),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddressPage())),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'DELIVER TO',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: 'home addressss',
                                  fontSize: 14.sp,
                                  color: Color.fromRGBO(103, 103, 103, 1),
                                ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Cart()));
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
                    },
                    child: Container(
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(24, 28, 46, 1),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.local_mall,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: ()async {
                       // await NotificationService().showNotificationo(title: 'Hungryfill', body: 'testing');
                        },
                        child: CustomText(
                          text: 'hey kiran, good morning',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(30, 29, 29, 1),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SearchWidget(searchcontroller: searchcontroller),
                          //  CustomTextFormWidget(
                          //  // onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen())),
                          //   controller: searchcontroller, hinttext: 'Search dishes, restaurants',readOnly: true,),
                          const SizedBox(height: 35),
                          BlocBuilder<FilterBloc, FilterState>(
                            builder: (context, state) {
                              debugPrint(state.runtimeType.toString());
                              if (state is DishesCategoryFilterOptionSuccess) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                            text: 'All Categories',
                                            fontSize: 20.sp,
                                            color:
                                                Color.fromRGBO(50, 52, 62, 1)),
                                        CustomText(
                                            text: 'See All',
                                            fontSize: 16.sp,
                                            color:
                                                Color.fromRGBO(50, 52, 62, 1)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                      child: dishItems(
                                          filteroptions: state.filteroptions),
                                    ),
                                  ],
                                );
                              } else {
                                return SizedBox(height: 100.h);
                              }
                            },
                          ),
                          SizedBox(height: 30.h),
                          // Text(
                          //   "Recommended Restaurants",
                          //   style: GoogleFonts.abhayaLibre(
                          //       fontSize: 22.sp, fontWeight: FontWeight.bold),
                          // ),
                          //   SizedBox(
                          //   height: 25.h,
                          // ),
                          // BlocBuilder<RestaurantBloc, RestaurantState>(
                          //   builder: (context, state) {
                          //     if (state is GetRestaurantSuccessState) {
                          //       return SizedBox(
                          //           height: 140.h, child: recommendedRestaurans(state));
                          //     } else {
                          //       return Center(
                          //         child: LoadingAnimationWidget.horizontalRotatingDots(
                          //             color: AppColors.primaryColor, size: 20),
                          //       );
                          //     }
                          //   },
                          // ),
                          // SizedBox(height: 10.h),
                          CustomText(
                            text: "Restaurants",
                            fontSize: 20.sp,
                            color: Color.fromRGBO(50, 52, 62, 1),
                          ),

                          SizedBox(
                            height: 20.h,
                          ),
                          BlocBuilder<RestaurantBloc, RestaurantState>(
                            builder: (context, state) {
                              
                              return BlocBuilder<RestaurantBloc,
                                  RestaurantState>(
                                buildWhen: (previous, current) => current is RestaurantInitial || current is GetRestaurantSuccessState,
                                builder: (context, state) {
                                  
                                  //final isInWishList = state is GetRestaurantsInWishListSucces ? state.wishlistrestaurant
                                  if(state is RestaurantInitial){
                                      return Center(child: CircularProgressIndicator(),);
                              //       return ListView.separated(
                              //         itemBuilder: (context, index) {
                              //           return RestaurantShimmerWidget();
                              //         },
                              //          separatorBuilder: (context, index) =>  SizedBox(
                              //   height: 24.h,
                              // ),
                              //           itemCount: 2);
                              
                                  }
                                  if(state is! GetRestaurantSuccessState) {
                                    return Center(child: CircularProgressIndicator(),);
                              //       return ListView.separated(
                              //         itemBuilder: (context, index) {
                              //           return RestaurantShimmerWidget();
                              //         },
                              //          separatorBuilder: (context, index) =>  SizedBox(
                              //   height: 24.h,
                              // ),
                              //           itemCount: 2);
                                  }
                                    return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.restaurants.length,
                          separatorBuilder: (context, index) =>
                                SizedBox(
                                height: 24.h,
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
                              child: RestaurantCardWidget(restaurant: restaurant),
                            );
                          });;
                                   
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ))
        //  BlocBuilder<UsersBloc , UsersState>(
        //   builder:(context,state){

        //     if(state is UserLoadedState){
        //         currentuserinfo = state.userdetails;

        //     }

        //     return   getSelectedScreen(index : currentpageindex , currentuserinfo: currentuserinfo);
        //   }
        //   )

        );
  }
}


// Widget getSelectedScreen({required int index ,  UserModel? currentuserinfo}){
//   Widget widget;

//   switch(index){
//     case 0 :
//      widget =   HomeScreen();
//      break;
//     //  case 1:
//     //  widget =   RecipeScreen();
//     //  break;
//      case 1:
//      widget = const RecentOrderScreen();
//      break;
//      case 2:
//      widget = UserProfileScreen(userinfo: currentuserinfo,);
//      break;
//      default :
//      widget =   HomeScreen();
//      break;
     

//   }
//   return widget;
// }