import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/orders_screen/widget/order_detail_dialog.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/orders_screen/widget/order_detail_widget.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/order_provider.dart';
import 'package:provider/provider.dart';

ListView restaurantDetailTable(List<String> tablecontents) {
    return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 160),
                              scrollDirection: Axis.horizontal,
                              itemCount: tablecontents.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    SizedBox(
                                        height: 30,
                                        child: Center(
                                          child: Text(
                                            tablecontents[index],
                                            style: GoogleFonts.roboto(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromARGB(
                                                    255, 140, 140, 140)),
                                          ),
                                        )
                                        ),
                                    const Icon(
                                      Icons.keyboard_arrow_down,
                                      color:
                                          Color.fromARGB(255, 140, 140, 140),
                                    )
                                  ],
                                );
                              });
  }

   AppBar appBarCommon({required String title}) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: GoogleFonts.radioCanada(
            fontSize: 25, fontWeight: FontWeight.w600),
      ),
    );
  }


  Padding orderListHeader() {
    return Padding(
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
                        const Text('Filtes'),
                        const SizedBox(width: 10),
                        Consumer<OrderProvider>(
                            builder: (context, value, child) => SizedBox(
                                  width: 100,
                                  height: 40,
                                  child: DropdownButton<String>(
                                      value: value.selectedfilteroption,
                                      items: value.orderStatusList.map((item) {
                                        return DropdownMenuItem<String>(
                                            value: item, child: Text(item));
                                      }).toList(),
                                      onChanged: (String? val) {
                                        value.changeSelectedFilter(val!);
                                        value.filterOrder(filteroption: val);
                                      }),
                                )),
                      ],
                    )
                    
                  ],
                ),
              ),
            )

            //  restaurantBar(
            //     context: context, categorycontroller: categorycontroller , dishcategorycontroller: dishcategorycontroller),
            );
  }





  ListView orderDetail(OrderProvider value) {
    return ListView.separated(
                                    itemBuilder: (context, index) {
                                      final order = value.ordersList[index];
                                      return GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (context) {
                                                  return OrderDetailDialog(
                                                    order: order,
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
  }