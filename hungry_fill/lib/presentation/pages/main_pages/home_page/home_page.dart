import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/presentation/bloc/filter_homepage/filter_bloc.dart';
import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:hungry_fill/presentation/pages/cart_page/cart_restauants.dart';

import 'package:hungry_fill/presentation/pages/main_pages/home_page/components_home_page/components.dart';

import 'package:hungry_fill/presentation/pages/main_pages/widgets/search_widget.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchcontroller = TextEditingController();
 @override
  void initState() {
    BlocProvider.of<FilterBloc>(context).add(GetDishesCategoryFilterOptions());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RestaurantBloc>(context).add(GetRestaurantsEvent());
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            label: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            backgroundColor: primarycolor,
            onPressed: () {
              //  adddish();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Cart()));
            }),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchWidget(searchcontroller: searchcontroller),
                  const SizedBox(height: 35),
                  BlocBuilder<FilterBloc , FilterState>(
                    builder: (context, state) {
                      debugPrint(state.runtimeType.toString());
                      if(state is DishesCategoryFilterOptionSuccess){
                        return  SizedBox(
                        height: 100.h,
                        child: dishItems(filteroptions: state.filteroptions),
                      );
                      }else{
                        return   SizedBox(height: 100.h);
                      }
                      
                    },
                  ),
                    SizedBox(height: 35.h),
                  Text(
                    "Recommended Restaurants",
                    style: GoogleFonts.abhayaLibre(
                        fontSize: 22.sp, fontWeight: FontWeight.bold),
                  ),
                    SizedBox(
                    height: 25.h,
                  ),
                  BlocBuilder<RestaurantBloc, RestaurantState>(
                    builder: (context, state) {
                      if (state is GetRestaurantSuccessState) {
                        return SizedBox(
                            height: 140.h, child: recommendedRestaurans(state));
                      } else {
                        return Center(
                          child: LoadingAnimationWidget.horizontalRotatingDots(
                              color: primarycolor, size: 20),
                        );
                      }
                    },
                  ),
                    SizedBox(height: 10.h),
                  Text(
                    "Restaurants",
                    style: GoogleFonts.abhayaLibre(
                        fontSize: 28.sp, fontWeight: FontWeight.bold),
                  ),
                   
                    SizedBox(
                    height: 20.h,
                  ),
                  BlocBuilder<RestaurantBloc, RestaurantState>(
                    builder: (context, state) {
                      if (state is GetRestaurantSuccessState) {
                        return restaurants(state);
                      } else {
                        return const Text("no restaurant");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
