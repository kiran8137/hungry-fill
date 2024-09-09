import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/core/theme/color.dart';
 
import 'package:hungry_fill_admin/presentation/pages/screens/dashboard_screen/dashboard.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/orders_screen/orders_screen.dart';

import 'package:hungry_fill_admin/presentation/pages/screens/restaurants_screen/restaurants.dart';
import 'package:hungry_fill_admin/presentation/pages/common_widget_component/widgets/sidebar_items_widget.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/users_screen/users_screen.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/order_provider.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/restaurant_provider.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/user_provider.dart';
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
    Provider.of<RestaurantProvider>(context,listen: false).getDishCategories();
    Provider.of<OrderProvider>(context,listen: false).getOrdersList();
     Provider.of<UserProvider>(context,listen: false).getUsersDetail();
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
              color: Colors.white
            ),
          ),
          // leading: Text(
          //   "Admin Panel",
          //   style: GoogleFonts.radioCanada(
          //     fontSize: 25,
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
          backgroundColor: primarycolor
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
              title: 'Users',
              // icon: Icons.people,
              route: '/users',
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
         
        );
  }
}

Widget getSelectedpage({
  required String selectedroute,
}) {
  switch (selectedroute) {
    case '/dashboard':
     return   Dashboard();
     

     case '/orders':
    return  OrdersScreen();
    case '/restaurants':
     return   RestaurantsScreen();
    case '/users':
     return UsersScreen();
    default:
      return Dashboard();
  }
}

class DailyOrders {
  const DailyOrders();
}
