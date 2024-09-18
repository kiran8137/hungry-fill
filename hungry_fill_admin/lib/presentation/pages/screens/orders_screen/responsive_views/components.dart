 import 'package:flutter/material.dart';
import 'package:hungry_fill_admin/presentation/pages/common_widget_component/components/components.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/orders_screen/widget/order_detail_widget_mobile.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/order_provider.dart';
import 'package:provider/provider.dart';

Padding orderListWebView(List<String> tablecontents) {
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
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8, left: 15),
                              child: SizedBox(
                                //  color: Colors.amber,
                                height: 30,
                                width: double.infinity,
                                child: restaurantDetailTable(tablecontents),
                              ),
                            ),
                            const Divider(),

                            //order details
                            SizedBox(
                              height: 450,
                              width: double.infinity,
                              child: Consumer<OrderProvider>(
                                builder: (context, value, child) {
                                  return value.ordersList.isEmpty
                                      ? const Center(
                                          child: Text('No orders found'),
                                        )
                                      : orderDetail(value);
                                },
                              ),
                            ),
                          ])));
  }

Padding orderListMobileView(OrderProvider value) {
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