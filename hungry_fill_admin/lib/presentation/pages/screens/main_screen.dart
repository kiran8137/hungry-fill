import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/core/theme/color.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/dashboard_screen/dashboard.dart';

import 'package:hungry_fill_admin/presentation/pages/screens/restaurants_screen/restaurants.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/widgets/sidebar_items_widget.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/restaurant_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> sidebaritems = [
    // "Dashboard",
    // "Orders",
    // "Customers",
    "Restaurants",
  ];

  //int selectedindex = 2;
  //RestaurantModel? currentrestaurantinfo;

  String selectedRoute = '/Dashboard';

  @override
  void initState() {
    Provider.of<RestaurantProvider>(context, listen: false).getRestaurants();
     Provider.of<RestaurantProvider>(context,listen: false).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        appBar: AppBar(
          title: Text(
            "Admin Panel",
            style: GoogleFonts.radioCanada(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: Text(
            "Admin Panel",
            style: GoogleFonts.radioCanada(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
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
              title: 'Orders',
              // icon: Icons.shopping_cart,
              route: '/orders',
            ),
            AdminMenuItem(
              title: 'Restaurants',
              // icon: Icons.restaurant,
              route: '/restaurants',
            ),
            AdminMenuItem(
              title: 'Customers',
              // icon: Icons.people,
              route: '/customers',
            ),
          ],
          selectedRoute: selectedRoute,
          onSelected: (item) {
            setState(() {
              selectedRoute = item.route!;
            });
          },
        ),
        body: getSelectedpage(selectedroute: selectedRoute)
        // Row(
        //   children: [
        //     Expanded(
        //       flex: 2,
        //       child: Container(
        //         decoration: BoxDecoration(color: Colors.white,
        //          boxShadow: [
        //           BoxShadow(
        //               color: Colors.black.withOpacity(0.20),
        //               spreadRadius: -5,
        //               blurRadius: 9,
        //               offset: const Offset(10, 0))
        //         ]
        //         ),
        //         child: SizedBox(
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
        //             child: ListView.builder(
        //                 itemCount: sidebaritems.length,
        //                 itemBuilder: (context, index) => Padding(
        //                       padding: const EdgeInsets.all(5.0),
        //                       child: SideBarItem(
        //                           sidebaritem: sidebaritems,
        //                           index: index,
        //                           selectedindex: selectedindex,
        //                           itemselected: (int index) {
        //                             setState(() {
        //                               selectedindex = index;
        //                             });
        //                           }),
        //                     )),
        //           ),
        //         ),
        //       ),
        //     ),

        //     Expanded(
        //         flex: 12,
        //         child:

        //           getSelectedpage(
        //                 index: selectedindex,

        //                 )

        //         )
        //   ],
        // )

        );
  }
}

Widget getSelectedpage({
  required String selectedroute,
}) {
  switch (selectedroute) {
    case '/dashboard':
    // return   Dashboard();
    // return  RestaurantsScreen();

    // case '/orders':
    //return   DailyOrders();
    case '/restaurants':
    // return   RestaurantsScreen();
    case '/customers':
    //return ProfileScreen();
    default:
      return RestaurantsScreen();
  }
}

class DailyOrders {
  const DailyOrders();
}
