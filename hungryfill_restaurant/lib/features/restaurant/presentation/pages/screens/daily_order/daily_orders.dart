import 'package:flutter/material.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/daily_order/components/daily_order_component.dart';
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
        body: Column(
          children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: dailyOrdersBar(),
          ),
          const SizedBox(height: 5),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      width: double.infinity,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            dishDetailTable(tablecontents),
                            const Divider(),
                            SizedBox(
                              height: 450,
                              width: double.infinity,
                              child: Consumer<OrderProvider>(
                                builder: (context, value, child) {
                                  return value.ordersList.isEmpty
                                      ? const Center(
                                          child: Text('No orders found'),
                                        )
                                      : dailyOrdersWidget(value);
                                },
                              ),
                            ),
                          ]
                          )
                          )
                          )
                          )
        ]));
  }

 
}
