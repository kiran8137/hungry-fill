import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/daily_order/widgets/daily_order_detail_dialog.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/daily_order/widgets/daily_orders_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/widgets/page_heading_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/provider/order_provider.dart';
import 'package:provider/provider.dart';

Container dailyOrdersBar() {
  return Container(
    width: double.infinity,
    height: 60,
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Daily Orders List',
            style:
                GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Row(
            children: [
              const Text('Filtes'),
              const SizedBox(width: 10),
              Consumer<OrderProvider>(
                  builder: (context, value, child) => Container(
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
          ),
        ],
      ),
    ),
  );
}

AppBar appBar() {
  return AppBar(
      backgroundColor: Colors.white,
      title: const PageHeading(title: 'Daily Orders'));
}

ListView dailyOrdersWidget(OrderProvider value) {
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
            child: DailyOrdersWidget(order: order));
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: value.ordersList.length);
}
