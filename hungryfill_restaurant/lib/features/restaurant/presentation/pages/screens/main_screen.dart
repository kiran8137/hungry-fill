import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(color: Colors.white,
                 boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.20),
                      spreadRadius: -5,
                      blurRadius: 9,
                      offset: const Offset(10, 0))
                ]
                ),
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

        
        );
  }
}

Widget getSelectedpage(
    {required int index, RestaurantModel? currentrestaurantinfo}) {
  switch (index) {
    case 0:
      return   Dashboard();
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
