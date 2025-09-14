import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/core/constants/assets.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';
import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:hungry_fill/presentation/pages/cart_page/cart_restauants.dart';
import 'package:hungry_fill/presentation/pages/dish_detail/dish_detail.dart';

import 'package:hungry_fill/presentation/pages/main_pages/widgets/search_widget.dart';
import 'package:hungry_fill/presentation/pages/restaurant/components/res_components.dart';
import 'package:hungry_fill/presentation/pages/restaurant/widgets/dish_widget.dart';
import 'package:hungry_fill/presentation/pages/widgets/common_components.dart';
import 'package:hungry_fill/widgets/custom_text.dart';

import '../../bloc/category_bloc/category_bloc.dart';

class RestuarantScreen extends StatefulWidget {
  const RestuarantScreen(
      {super.key,
      this.resuerid,
      this.restaurantname,
      this.restaurantdistrict,
      this.restaurantImg,
      this.restaurantplace});

  final String? resuerid;
  final String? restaurantname;
  final String? restaurantdistrict;
  final String? restaurantplace;
  final String? restaurantImg;

  @override
  State<RestuarantScreen> createState() => _RestuarantScreenState();
}

class _RestuarantScreenState extends State<RestuarantScreen> {
  final TextEditingController searchcontroller = TextEditingController();
  late DishModel dish;
  List<String> selectedcatories = [];
  bool isfav = false;

  @override
  void initState() {
     context.read<RestaurantBloc>().add(GetRestaurantsInWishList());
    BlocProvider.of<DishBloc>(context)
        .add(DishGetEvent(resuserid: widget.resuerid));
    BlocProvider.of<CategoryBloc>(context)
        .add(GetCategories(resuerid: widget.resuerid));
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) => context.read<RestaurantBloc>().add(GetRestaurantsEvent()),
      child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
              label: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>   Cart()));
              }),
          backgroundColor: Colors.white,
           
          body: SafeArea(
              child: Column(
            children: [
              Container(
                height: 200.h,
                decoration: const BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage("assets/biriyani_image.jpg"),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.arrow_back_ios_new)),
                          ),
                          BlocBuilder<RestaurantBloc, RestaurantState>(
                            buildWhen: (previous, current) => current is GetRestaurantsInWishListSucces || current is RemoveRestaurantsInWishListSucces || current is GetRestaurantsInWishListEmtyState,
                            
                            builder: (context, state) {
                              // if(state is! GetRestaurantsInWishListSucces){
                              //   return CircularProgressIndicator();
                              // }
                              if(state is GetRestaurantsInWishListEmtyState){
                                return GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<RestaurantBloc>(context).add(
                                      AddRestaurantToWishList(
                                          restaurantid: widget.resuerid!));
                                  context.read<RestaurantBloc>().add(GetRestaurantsInWishList());
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: Icon(
                                       Icons.favorite_border,
                                      color:   Colors.white,
                                    ),
                                  ),
                                );
                              }
                              if(state is GetRestaurantsInWishListSucces){
                               // final wishListRestaurants = state.wishlistrestaurant;
                             // final isInWishList = wishListRestaurants.any((element) => element.restaurantuserid == widget.resuerid);
                              return GestureDetector(
                                onTap: () {
                                   context.read<RestaurantBloc>().add(RemoveRestaurantInWishList(restaurantid: widget.resuerid ?? ""));
                                   context.read<RestaurantBloc>().add(GetRestaurantsInWishList());
                                  
                                },
                                child: CircleAvatar(
                                  backgroundColor:   Colors.white,
                                  child: Icon(
                                     Icons.favorite,
                                    color:  AppColors.primaryColor,
                                  ),
                                ),
                              );
                              }else{
                                return SizedBox();
                              }
                              
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: widget.restaurantname.toString(),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(24, 28, 46, 1),
                        ),
                        Row(
                          spacing: 2.w,
                          children: [
                            CustomText(
                              text: widget.restaurantplace.toString(),
                              fontSize: 15.sp,
                              color: Color.fromRGBO(24, 28, 46, 1),
                            ),
                            const Icon(Icons.fiber_manual_record,
                                size: 10,
                                color: Color.fromRGBO(160, 165, 186, 1)),
                            CustomText(
                              text: widget.restaurantdistrict.toString(),
                              fontSize: 15.sp,
                              color: Color.fromRGBO(24, 28, 46, 1),
                            ),
                          ],
                        ),
                         
                        SizedBox(
                          height: 10.h,
                        ),
      
                        SearchWidget(
                          searchcontroller: searchcontroller,
                          resuserid: widget.resuerid,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        BlocConsumer<CategoryBloc, CategoryState>(
                          builder: (context, state) {
                            debugPrint(state.runtimeType.toString());
      
                            if (state is GetCategoriesSuccesState) {
                              return filterChip(state, context, widget.resuerid!);
                            } else {
                              return const Text("somethign went wrong");
                            }
                          },
                          listener:
                              (BuildContext context, CategoryState state) {},
                        ),
                        // Row(
                        //   children: [
                        //     const Expanded(
                        //         child: Divider(
                        //       color: Colors.grey,
                        //     )),
                        //       SizedBox(
                        //       width: 8.w,
                        //     ),
                        //     Text(
                        //       "Dishes",
                        //       style: GoogleFonts.amita(),
                        //     ),
                        //       SizedBox(
                        //       width: 8.w,
                        //     ),
                        //     const Expanded(
                        //         child: Divider(
                        //       color: Colors.grey,
                        //     ))
                        //   ],
                        // ),
                        SizedBox(
                          height: 20.h,
                        ),
                        BlocConsumer<DishBloc, DishState>(
                          listener: (BuildContext context, DishState state) {
                            if (state is AddDishToCartSuccesState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  scaffoldMessenger(
                                      color: Colors.green,
                                      message: "Successfully Added to cart"));
                              BlocProvider.of<DishBloc>(context)
                                  .add(DishGetEvent(resuserid: widget.resuerid));
                            }
                            // if(state is AddDishToCartSuccesState){
                            //    Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage(restaurantid: widget.resuerid, restaurantname: widget.restaurantname,)));
                            // }
                          },
                          builder: (context, state) {
                            debugPrint(
                                'in list dish ${state.runtimeType.toString()}');
                            if (state is DishInitial) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
      
                            if (state is DishEmpty) {
                              return const Center(
                                child: Text(
                                  "😞Oops, no dish available",
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }
      
                            if (state is SearchDishEmptyState) {
                              return Center(
                                child: Text(
                                  "😞Oops, no result found for '${searchcontroller.text}'",
                                  style: GoogleFonts.abel(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            }
      
                            if (state is CategoryDisheseEmptyState) {
                              return Center(
                                child: Text(
                                  "😞Oops, no dishes found ",
                                  style: GoogleFonts.abel(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            }
      
                            if (state is DishSuccesEvent ||
                                state is SearchDishSuccessState ||
                                state is CategoryDishesSuccesState) {
                              debugPrint(state.runtimeType.toString());
                              final dishes = state is DishSuccesEvent
                                  ? state.dish
                                  : state is CategoryDishesSuccesState
                                      ? state.categorydishes
                                      : (state as SearchDishSuccessState).dishes;
                              return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 2.w,
                                        mainAxisSpacing: 2.h,
                                        crossAxisCount: 2,
                                        childAspectRatio: .9),
                                itemCount: dishes.length,
                                itemBuilder: (context, index) {
                                  final dish = dishes[index];
                                  return GestureDetector(
                                      onTap: () {
                                        final List<String> imagesurl = [];
                                        for (var i in dishes) {
                                          imagesurl.add(i.image1!);
                                          imagesurl.add(i.image2!);
                                          imagesurl.add(i.image3!);
                                          imagesurl.add(i.image4!);
                                        }
                                        Navigator.push(
                                            context,
                                            (MaterialPageRoute(
                                                builder: (context) => DishDetail(
                                                      restuaurantid:
                                                          widget.resuerid!,
                                                      images: imagesurl,
                                                      dish: dishes[index],
                                                    ))));
                                      },
                                      child: Dishwidget(
                                          dish: dish,
                                          restaurantid:
                                              widget.resuerid.toString(),
                                          restaurantname:
                                              widget.restaurantname.toString(),
                                          ctx: context));
                                },
                              );
                              // ListView.separated(
                              //     shrinkWrap: true,
                              //     physics: const NeverScrollableScrollPhysics(),
                              //     itemBuilder: (context, index) {
      
                              //       return GestureDetector(
                              //         onTap: () {
                              //           final List<String> imagesurl = [];
                              //           for (var i in dishes) {
                              //             imagesurl.add(i.image1!);
                              //             imagesurl.add(i.image2!);
                              //             imagesurl.add(i.image3!);
                              //             imagesurl.add(i.image4!);
                              //           }
      
                              //           Navigator.push(
                              //               context,
                              //               MaterialPageRoute(
                              //                   builder: (context) =>
                              //                       DishDetail(
                              //                         restuaurantid : widget.resuerid!,
                              //                         images: imagesurl,
                              //                         dish: dishes[index],
                              //                       )
                              //                       )
                              //                       );
                              //         },
                              //         child: Align(
                              //           alignment: Alignment.centerLeft,
                              //           child: Container(
                              //             height: 150.h,
                              //             color: Colors.green,
                              //             width: MediaQuery.of(context).size.width * 0.5,
                              //           ),
                              //         )
                              //         // Dishwidget(
                              //         //   restaurantid: widget.resuerid!,
                              //         //   dish: dishes[index],
                              //         //   restaurantname: widget.restaurantname!,
                              //         //   ctx: context,
                              //         // ),
                              //       );
                              //     },
                              //     separatorBuilder: (context, index) =>
                              //         const SizedBox(height: 10),
                              //     itemCount: dishes.length);
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ))),
    );
  }
}
