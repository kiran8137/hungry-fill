import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/data/repository/order_repo/order_repo_impl.dart';
import 'package:hungry_fill_admin/presentation/pages/common_widget_component/components/components.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/orders_screen/widget/order_detail_widget.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/restaurants_screen/components/components.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/restaurants_screen/widgets/category_detail_widget.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Orders',
          style: GoogleFonts.radioCanada(
              fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
        const SizedBox(height: 20),
        Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Orders List',
                      style: GoogleFonts.roboto(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 34,
                          width: 250,
                          //color: Colors.red,
                          child: TextFormField(
                            style: const TextStyle(height: 1.3),
                            decoration: InputDecoration(
                                hintText: 'Search Order',
                                hintStyle: const TextStyle(fontSize: 11),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        const Icon(
                          Icons.search,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ),
            )

            //  restaurantBar(
            //     context: context, categorycontroller: categorycontroller , dishcategorycontroller: dishcategorycontroller),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 8, left: 15),
                            child: Container(
                              //  color: Colors.amber,
                              height: 30,
                              width: double.infinity,
                              child: restaurantDetailTable(tablecontents),
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                            height: 450,
                            width: double.infinity,
                            child: Consumer<OrderProvider>(
                              builder: (context, value, child) {
                                return ListView.separated(
                                    itemBuilder: (context, index) {
                                      final order = value.ordersList[index];
                                      return GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Dialog(
                                                    child: Container(
                                                      height: 500,
                                                      width: 500,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                              width: 1,
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  203,
                                                                  203,
                                                                  203)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7)),
                                                    ),
                                                  );
                                                });
                                          },
                                          child: OrderDetailWidget(
                                            orderDetail: order,
                                            index: index,
                                          ));
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                    itemCount: value.ordersList.length);
                              },
                            ),
                          ),
                          // child:
                          //  Consumer<RestaurantProvider>(
                          //   builder: (context, value, child) =>
                          //       ListView.separated(
                          //           itemBuilder:
                          //               (context, index) {
                          //             final restaurant = value
                          //                 .restaurants[index];
                          //             return RestaurantDetailWidget(
                          //                 restaurant: restaurant);
                          //           },
                          //           separatorBuilder:
                          //               (context, index) =>
                          //                   const Divider(),
                          //           itemCount:
                          //               value.restaurants.length),
                          // ),
                        ]))))
      ]
      ),
    );
  }
}
