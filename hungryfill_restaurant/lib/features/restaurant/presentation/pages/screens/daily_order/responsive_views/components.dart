import 'package:flutter/material.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/daily_order/components/daily_order_component.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/daily_order/widgets/daily_order_mobile_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/widgets/components.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/provider/order_provider.dart';

Padding ordersListWebView(OrderProvider value , List<String> tablecontents) {
    return Padding(
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
                                  height: 400,
                                  width: double.infinity,
                                  child: value.ordersList.isEmpty
                                      ? const Center(
                                          child: Text('No orders found'),
                                        )
                                      : dailyOrdersWidget(value)),
                            ])));
  }


Padding ordersListMobileView(OrderProvider value) {
    return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    // color: Colors.blue,
                    width: double.infinity,
                    height: 200,
                    child: value.ordersList.isEmpty
                        ? const Center(
                            child: Center(
                              child: Text('No orders found'),
                            ),
                          )
                        : GridView.builder(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 8.0,
                                    crossAxisSpacing: 8.0),
                            itemCount: value.ordersList.length,
                            itemBuilder: (context, index) {
                              final order = value.ordersList[index];
                              return OrderDetailWidgetMobile(order: order);
                            }),
                  ),
                );
  }