import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/res_user/res_user_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/daily_order/daily_orders.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dashboard/dashboard.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/dishes.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/profile/profile_screen.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/authentication/auth_bloc_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/restaurant_user/restaurant_user_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/provider/dashboard_provider.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/provider/order_provider.dart';
import 'package:provider/provider.dart';

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
    //  BlocProvider.of<OrdersBloc>(context)
    //     .add(GetOrdersList());
    //  Provider.of<DashboardProvider>(context,listen: false).getOrdersCount();
    context.read<DashboardProvider>().getDishesCount();
    context.read<DashboardProvider>().getOrdersCount();
    Provider.of<OrderProvider>(context,listen: false).getOrdersList();
    Provider.of<DashboardProvider>(context,listen: false).calculateTodaysRevenue();
    Provider.of<DashboardProvider>(context,listen: false).calculateTotalEarnings();
    
   
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
              color: Colors.white
            ),
          ),
          actions:   [
            GestureDetector(
              onTap: (){
                BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
              },
              child: const Icon(Icons.logout,
              color: Colors.white,
              ),
            ),
            const SizedBox(width: 20,)
          ],
          backgroundColor: primarycolor
        ),
        backgroundColor: Colors.white,
        sideBar: SideBar(
          activeBackgroundColor: primarycolor,
          backgroundColor: Colors.white,
          borderColor: Colors.grey,
          iconColor: Colors.white,
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
       
  }
}

Widget getSelectedpage(
    {required String selectedroute ,  RestaurantModel? currentrestaurantinfo}) {
  switch (selectedroute) {
    case '/dashboard':
      return   Dashboard();
    case '/Daily Orders':
      return   DailyOrders();
    case '/Dishes':
      return const DishScreen();
    case '/Profile':
       return ProfileScreen(
        restaurantname: currentrestaurantinfo?.restaurantname,
        restaurantmobileNo: currentrestaurantinfo?.restaurantmobileNo,
        restaurantstate: currentrestaurantinfo?.restaurantstate,
        restaurantdistrict: currentrestaurantinfo?.restaurantdistrict,
        restaurantplace: currentrestaurantinfo?.restaurantplace,
      );
    default:
      return Dashboard();
      
  }
}
