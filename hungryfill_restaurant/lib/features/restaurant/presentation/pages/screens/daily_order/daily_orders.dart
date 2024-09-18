import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/order/order_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/daily_order/components/daily_order_component.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/daily_order/responsive_views/components.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/daily_order/widgets/daily_order_mobile_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/widgets/components.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/provider/order_provider.dart';
import 'package:provider/provider.dart';

class DailyOrders extends StatelessWidget {
  DailyOrders({super.key, this.index});

  final int? index;

  final tablecontents = ["", "Date", "Customer Name", "Total", "Order Status"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 239, 239, 239),
        appBar: appBar(),
        body: Consumer<OrderProvider>(
          builder: (context, value, child) => Column(children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: dailyOrdersBar(),
            ),
            const SizedBox(height: 5),
            Expanded(child: LayoutBuilder(
              builder: (context, constraints) {
                double maxWidth = constraints.maxWidth;
                if (maxWidth > 600) {
                  return ordersListWebView(value, tablecontents);
                } else {
                  return ordersListMobileView(value);
                }
              },
            ))
          ]),
        ));
  }

  
}

