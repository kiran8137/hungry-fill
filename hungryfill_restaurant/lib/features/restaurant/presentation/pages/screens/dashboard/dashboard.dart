import 'package:flutter/material.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dashboard/widgets/revenue_card_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/widgets/page_heading_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key, this.index});

  final int? index;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? url;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body : LayoutBuilder(
        builder: (context, constraints) => 
        constraints.maxWidth > 600 ?
         SingleChildScrollView(
          scrollDirection: Axis.horizontal,
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () async {},
                    child: const PageHeading(
                      title: "DASHBOARD",
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
                      title: 'Dishes',
                      amount: '${value.totalDishes}',
                      image: 'assets/fried-rice.png',
                    ),
                    const SizedBox(width: 20),
                    RevenueCardWidget(
                      title: 'Orders',
                      amount: '${value.totalOrders}',
                      image: 'assets/delivery.png',
                    ),
                    const SizedBox(width: 20),
                    RevenueCardWidget(
                      title: 'Total earnings',
                      amount: '${value.totalEarnings}',
                      image: 'assets/wallet.png',
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ],
                   ),
         ): SingleChildScrollView(
          child: Column(
            children: [
               Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () async {},
                  child: const PageHeading(
                    title: "DASHBOARD",
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
              builder: (context, value, child) => Column(
                children: [
                  RevenueCardWidget(
                    title: 'Todays Revenue',
                    amount: '${value.todaysRevenue}',
                    image: 'assets/salary.png',
                  ),
                  const SizedBox(height: 20),
                  RevenueCardWidget(
                    title: 'Dishes',
                    amount: '${value.totalDishes}',
                    image: 'assets/fried-rice.png',
                  ),
                  const SizedBox(height: 20),
                  RevenueCardWidget(
                    title: 'Orders',
                    amount: '${value.totalOrders}',
                    image: 'assets/delivery.png',
                  ),
                  const SizedBox(height: 20),
                  RevenueCardWidget(
                    title: 'Total earnings',
                    amount: '${value.totalEarnings}',
                    image: 'assets/wallet.png',
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            ],
          ),
        )
      ),
    );
  }
}
