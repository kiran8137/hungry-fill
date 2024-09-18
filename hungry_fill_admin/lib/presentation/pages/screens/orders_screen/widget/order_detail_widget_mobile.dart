import 'package:flutter/material.dart';
import 'package:hungry_fill_admin/data/models/orders_model.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/orders_screen/components/components.dart';

class OrderDetailWidgetMobile extends StatelessWidget {
  const OrderDetailWidgetMobile({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.40),
                spreadRadius: -9,
                blurRadius: 9,
                offset: const Offset(5, 15))
          ]),
      height: 200,
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          orderDetailText(text: order.addressSelected!.username!),
          orderDetailText(text: order.orderdate!),
          orderDetailText(text: order.grandtotal!),
          orderDetailText(text: order.orderstatus!)
          //  Text('15/10/2002'),
          //  Text('₹ 250'),
          //  Text('delivered')
        ],
      ),
    );
  }
}
