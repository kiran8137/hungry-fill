import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry_fill_admin/data/models/orders_model.dart';
import 'package:hungry_fill_admin/data/models/restaurant_model.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/order_provider.dart';
import 'package:provider/provider.dart';

class OrderDetailWidget extends StatelessWidget {
    OrderDetailWidget({
    super.key, required this.orderDetail, required this.index,
  });
final OrderModel orderDetail;
 int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: double.infinity,
        color: Colors.white,
        child:   Row(
          children: [
            SizedBox(width: 10),
            SizedBox(
              width: 80,
              child: Text(
                "${index+1}",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(width: 100),
            SizedBox(
              width: 150,
              child: Text("${orderDetail.orderdate}",
              style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(width: 105),
            Text('${orderDetail.addressSelected!.username}', style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(width: 220),
            Text('${orderDetail.grandtotal}', style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(width: 240),
            SizedBox(
              width: 150,
              child: Text("${orderDetail.orderstatus}"),
            ),

            // Consumer<OrderProvider>(
            //   builder: (context, value, child) => 
            //     Container(
            //     width: 100,
            //     height: 50,
            //     child: DropdownButton<String>(
            //       value: value.selectStatus,
            //       items: value.orderStatusList.map((item){
            //         return DropdownMenuItem<String>(
            //           value: item,
            //           child: Text(item)
            //           );
            //       }).toList(), 
            //       onChanged: (String? val){
            //         value.changeOrderStatus(val!);
            //       }),
            //   ),
            // )
          ],
        ));
  }
}
