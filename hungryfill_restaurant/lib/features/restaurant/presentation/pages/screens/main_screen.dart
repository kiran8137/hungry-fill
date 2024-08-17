import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/res_user/res_user_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/daily_order/daily_orders.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dashboard/dashboard.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/dishes.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/profile/profile_screen.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/widgets/sidebar_item_widget.dart';
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
    //BlocProvider.of<DishBloc>(context).add(GetDishesEvent());

   
    super.initState();
  }

   String selectedRoute = '/Dashboard';

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        appBar: AppBar(
          title: 
          Text(
            "Hungry Fill",
            style: GoogleFonts.radioCanada(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            Icon(Icons.logout),
            SizedBox(width: 20,)
          ],
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        sideBar: SideBar(
          activeBackgroundColor: primarycolor,
          backgroundColor: Colors.white,
          borderColor: Colors.grey,
          iconColor: Colors.black,
          textStyle: const TextStyle(color: Colors.black),
          activeTextStyle: const TextStyle(color: Colors.white),
          items: const [
            AdminMenuItem(
              title: 'Dashboard',
              //icon: Icons.dashboard,
              route: '/dashboard',
            ),
            AdminMenuItem(
              title: 'Daily Orders',
              // icon: Icons.shopping_cart,
              route: '/Daily Orders',
            ),
            AdminMenuItem(
              title: 'Dishes',
              // icon: Icons.restaurant,
              route: '/Dishes',
            ),
            AdminMenuItem(
              title: 'Profile',
              // icon: Icons.people,
              route: '/Profile',
            ),
          ],
          selectedRoute: selectedRoute,
          onSelected: (item) {
            setState(() {
              selectedRoute = item.route!;
            });
          },
        ),
        body:  BlocConsumer<RestaurantUserBloc, RestaurantUserState>(
                  listener: (context, state) {
                    
                  },
                  builder: (context, state) {
                    if (state is RestaurantDetailLoaded) {
                      currentrestaurantinfo = state.restaurantmodel;
                    }
                    return getSelectedpage(
                         selectedroute: selectedRoute,
                        currentrestaurantinfo: currentrestaurantinfo);
                  },
                )
                );
      //     ],
      //   )

        
      //  );
      //   //getSelectedpage(selectedroute: selectedRoute)
         
      //   );
    // Scaffold(
    //     backgroundColor: Colors.white,
    //     body: Row(
    //       children: [
    //         Expanded(
    //           flex: 2,
    //           child: Container(
    //             decoration: BoxDecoration(color: Colors.white,
    //              boxShadow: [
    //               BoxShadow(
    //                   color: Colors.black.withOpacity(0.20),
    //                   spreadRadius: -5,
    //                   blurRadius: 9,
    //                   offset: const Offset(10, 0))
    //             ]
    //             ),
    //             child: SizedBox(
    //               child: Padding(
    //                 padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
    //                 child: ListView.builder(
    //                     itemCount: sidebaritems.length,
    //                     itemBuilder: (context, index) => Padding(
    //                           padding: const EdgeInsets.all(5.0),
    //                           child: SideBarItem(
    //                               sidebaritem: sidebaritems,
    //                               index: index,
    //                               selectedindex: selectedindex,
    //                               itemselected: (int index) {
    //                                 setState(() {
    //                                   selectedindex = index;
    //                                 });
    //                               }),
    //                         )),
    //               ),
    //             ),
    //           ),
    //         ),
            

    //         Expanded(
    //             flex: 12,
    //             child: 
    // BlocConsumer<RestaurantUserBloc, RestaurantUserState>(
    //               listener: (context, state) {
                    
    //               },
    //               builder: (context, state) {
    //                 if (state is RestaurantDetailLoaded) {
    //                   currentrestaurantinfo = state.restaurantmodel;
    //                 }
    //                 return getSelectedpage(
    //                     index: selectedindex,
    //                     currentrestaurantinfo: currentrestaurantinfo);
    //               },
    //             ))
    //       ],
    //     )

        
    //    );
  }
}

Widget getSelectedpage(
    {required String selectedroute ,  RestaurantModel? currentrestaurantinfo}) {
  switch (selectedroute) {
    case '/dashboard':
     // return   Dashboard();
    case '/Daily Orders':
      //return const DailyOrders();
    case '/Dishes':
     // return const DishScreen();
    case '/Profile':
      // return ProfileScreen(
      //   restaurantname: currentrestaurantinfo?.restaurantname,
      //   restaurantmobileNo: currentrestaurantinfo?.restaurantmobileNo,
      //   restaurantstate: currentrestaurantinfo?.restaurantstate,
      //   restaurantdistrict: currentrestaurantinfo?.restaurantdistrict,
      //   restaurantplace: currentrestaurantinfo?.restaurantplace,
      // );
    default:
      //return Dashboard();
      return DishScreen();
  }
}
