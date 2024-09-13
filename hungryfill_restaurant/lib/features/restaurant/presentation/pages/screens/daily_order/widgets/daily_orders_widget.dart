

 
import 'package:flutter/material.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/order/order_model.dart';
 

class DailyOrdersWidget extends StatelessWidget {
      DailyOrdersWidget({
    super.key, required this.order,  
  });
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: double.infinity,
        color: Colors.white,
        child:     Row(
          children: [
            const SizedBox(width: 10),
            const SizedBox(
              width: 80,
              child: Text(
                "-",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(width: 95),
              SizedBox(
              width: 150,
              child: Text('${order.orderdate}',
              style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(width: 100),
            SizedBox(
           
              width: 150,
              child: Text('${order.username}', style: const TextStyle(fontWeight: FontWeight.w600))),
            const SizedBox(width: 135),
            SizedBox(
            
              width: 85,
              child: Text('${order.grandtotal}', style: const TextStyle(fontWeight: FontWeight.w600))),
            const SizedBox(width: 140),
            SizedBox(
              width: 150,
              child: Text("${order.orderstatus}"),
            ),

            const SizedBox(
              width: 100,
            ),
            const Icon(Icons.arrow_forward_ios , size: 15)
          ],
        ));
  }
}
