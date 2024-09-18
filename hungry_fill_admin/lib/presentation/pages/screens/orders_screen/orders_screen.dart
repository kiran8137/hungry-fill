import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/data/models/orders_model.dart';
import 'package:hungry_fill_admin/presentation/pages/common_widget_component/components/components.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/orders_screen/components/components.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/orders_screen/responsive_views/components.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/orders_screen/widget/order_detail_widget_mobile.dart';
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
          Expanded(child: LayoutBuilder(
            builder: (context, constraints) {
              double maxWidth = constraints.maxWidth;
              if (maxWidth > 600) {
                return orderListWebView(tablecontents);
              } else {
                return orderListMobileView(value);
              }
            },
          ))
        ]),
      ),
    );
  }

  

 
}

