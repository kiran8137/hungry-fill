import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/dashboard_screen/widgets/revenue_cart_widget.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';

class WebView extends StatelessWidget {
  const WebView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
     scrollDirection: Axis.horizontal,
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         const SizedBox(
           height: 25,
         ),
              
         const SizedBox(
           height: 10,
         ),
              
         Row(
           children: [
             const SizedBox(
               width: 20,
             ),
             GestureDetector(
               onTap: () {},
               child: Text(
                 "DASHBOARD",
                 style: GoogleFonts.inriaSans(
                     fontWeight: FontWeight.bold, fontSize: 30),
               ),
             ),
           ],
         ),
              
         const Divider(),
         const SizedBox(
           height: 45,
         ),
              
         const SizedBox(
           height: 5,
         ),
              
         Consumer<DashboardProvider>(
           builder: (context, value, child) => Row(
             children: [
               RevenueCardWidget(
                 title: 'Todays Revenue',
                 amount: '${value.todaysRevenue}',
                 image: 'assets/salary.png',
               ),
               const SizedBox(width: 20),
               RevenueCardWidget(
                 title: 'Users',
                 amount: '${value.totalUsers}',
                 image: 'assets/user.png',
               ),
               const SizedBox(
                 width: 20,
               ),
               RevenueCardWidget(
                 title: 'Orders',
                 amount: '${value.totalOrders}',
                 image: 'assets/delivery.png',
               ),
               const SizedBox(
                 width: 20,
               ),
               RevenueCardWidget(
                 title: 'Restaurants',
                 amount: '${value.totalRestaurant}',
                 image: 'assets/restaurant.png',
               ),
               const SizedBox(
                 width: 20,
               ),
             ],
           ),
         ),
         const SizedBox(height: 10),
         Consumer<DashboardProvider>(
             builder: (context, value, child) => RevenueCardWidget(
                   title: 'One Month Earning',
                   amount: '${value.totalEarnings}',
                   image: 'assets/wallet.png',
                 )),
              
          
       ],
              ),
    );
  }
}



class MobileView extends StatelessWidget {
  const MobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 25,
        ),
    
        const SizedBox(
          height: 10,
        ),
    
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "DASHBOARD",
                style: GoogleFonts.inriaSans(
                    fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ],
        ),
    
        const Divider(),
        const SizedBox(
          height: 45,
        ),
    
        const SizedBox(
          height: 5,
        ),
    
        Consumer<DashboardProvider>(
          builder: (context, value, child) => Center(
            child: Column(
              children: [
                RevenueCardWidget(
                  title: 'Todays Revenue',
                  amount: '${value.todaysRevenue}',
                  image: 'assets/salary.png',
                ),
                const SizedBox(height: 20),
                RevenueCardWidget(
                  title: 'Users',
                  amount: '${value.totalUsers}',
                  image: 'assets/user.png',
                ),
                const SizedBox(
                  height: 20,
                ),
                RevenueCardWidget(
                  title: 'Orders',
                  amount: '${value.totalOrders}',
                  image: 'assets/delivery.png',
                ),
                const SizedBox(
                  height: 20,
                ),
                RevenueCardWidget(
                  title: 'Restaurants',
                  amount: '${value.totalRestaurant}',
                  image: 'assets/restaurant.png',
                ),
                const SizedBox(
                 height: 20,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Consumer<DashboardProvider>(
            builder: (context, value, child) => Center(
              child: RevenueCardWidget(
                    title: 'One Month Earning',
                    amount: '${value.totalEarnings}',
                    image: 'assets/wallet.png',
                  ),
            )),
    
         
      ],
    ),
    );
  }
}

