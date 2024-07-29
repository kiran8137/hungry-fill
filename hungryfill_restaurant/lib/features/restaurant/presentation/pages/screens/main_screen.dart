import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/category/category_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/res_user/res_user_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/daily_order/daily_orders.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dashboard/dashboard.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/dishes.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/profile/profile_screen.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/widgets/sidebar_item_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/dish/dish_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/restaurant_user/restaurant_user_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> sidebaritems = [
    "Dashboard",
    "Daily Orders",
    "Dishes",
    "Profile",
     
  ];

  

  int selectedindex = 0;
  RestaurantModel? currentrestaurantinfo;

  @override
  void initState() {
    BlocProvider.of<RestaurantUserBloc>(context)
        .add(GetRestaurantDetailEvent());
    BlocProvider.of<DishBloc>(context).add(GetDishesEvent());

   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.20),
                      spreadRadius: -5,
                      blurRadius: 9,
                      offset: const Offset(10, 0))
                ]),
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
                    child: ListView.builder(
                        itemCount: sidebaritems.length,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SideBarItem(
                                  sidebaritem: sidebaritems,
                                  index: index,
                                  selectedindex: selectedindex,
                                  itemselected: (int index) {
                                    setState(() {
                                      selectedindex = index;
                                    });
                                  }),
                            )),
                  ),
                ),
              ),
            ),
            // NavigationRail(
            //   backgroundColor: Colors.white,
            //   elevation: 8,
            //   minWidth: 180,
            //   indicatorColor: primarycolor,

            //   onDestinationSelected: (index){
            //     setState(() {
            //       selectedindex = index;
            //     });
            //   },
            //   destinations:[
            //     NavigationRailDestination(icon: Icon(Icons.home), label: Text("Dashboard",style: TextStyle(color: Colors.black),)),
            //      NavigationRailDestination(icon: Icon(Icons.home), label: Text("Daily Order")),
            //       NavigationRailDestination(icon: Icon(Icons.home), label: Text("Dishes"))
            //   ],
            //   selectedIndex: selectedindex,
            //   ),

            Expanded(
                flex: 12,
                child: BlocConsumer<RestaurantUserBloc, RestaurantUserState>(
                  listener: (context, state) {
                    
                  },
                  builder: (context, state) {
                    if (state is RestaurantDetailLoaded) {
                      currentrestaurantinfo = state.restaurantmodel;
                    }
                    return getSelectedpage(
                        index: selectedindex,
                        currentrestaurantinfo: currentrestaurantinfo);
                  },
                ))
          ],
        )

        // SafeArea(
        //   child: Row(
        //     children: [
        //         Expanded(
        //         flex: 2,
        //         child: Container(

        //           decoration: BoxDecoration(
        //             color: Colors.white,

        //            boxShadow: [
        //       BoxShadow(
        //         color: Colors.black.withOpacity(0.20),
        //         spreadRadius: -9,
        //         //blurRadius: 10,
        //         offset: const Offset(10, 0)
        //       )
        //    ]
        //           ) ,
        //           child:   SidebarWidget(),

        //         )
        //         ),

        //         Expanded(
        //           flex: 12,
        //           child: Container(
        //             child: Dashboard(),
        //           )
        //           )
        //     ],
        //   )
        //   ),
        );
  }
}

Widget getSelectedpage(
    {required int index, RestaurantModel? currentrestaurantinfo}) {
  switch (index) {
    case 0:
      return const Dashboard();
    case 1:
      return const DailyOrders();
    case 2:
      return const DishScreen();
    case 3:
      return ProfileScreen(
        restaurantname: currentrestaurantinfo?.restaurantname,
        restaurantmobileNo: currentrestaurantinfo?.restaurantmobileNo,
        restaurantstate: currentrestaurantinfo?.restaurantstate,
        restaurantdistrict: currentrestaurantinfo?.restaurantdistrict,
        restaurantplace: currentrestaurantinfo?.restaurantplace,
      );
    default:
      return const Text("no page found");
  }
}
