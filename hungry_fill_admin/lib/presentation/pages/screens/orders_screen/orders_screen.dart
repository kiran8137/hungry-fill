import 'package:flutter/material.dart';
import 'package:hungry_fill_admin/presentation/pages/common_widget_component/components/components.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/order_provider.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});
  final tablecontents = [
    "#",
    "Date",
    "Customer",
    "Order Total",
    "Order Status"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      appBar: appBarCommon(title: 'Orders'),
      body: Consumer<OrderProvider>(
        builder: (context, value, child) => Column(children: [
          const SizedBox(height: 20),

          orderListHeader(), //order page header with filter option

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
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 15),
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
                          ]))))
        ]),
      ),
    );
  }
}
