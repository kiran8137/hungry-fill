import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/data/model/order_model/order_model.dart';

class OrdersListWidget extends StatelessWidget {
  const OrdersListWidget({
    super.key,
    required this.order,
    required this.index,
  });

  final OrderModel order;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.20),
                spreadRadius: 0,
                blurRadius: 8,
                offset: const Offset(0, 5))
          ]
          ),
      child: Row(
        children: [
          
          Container(
            width: 85.h,
            height: 85.w,
            decoration: BoxDecoration(
                 
                borderRadius: BorderRadius.circular(5),
               // image: DecorationImage(image: NetworkImage("${order.cartdata[0]}"))
                ),
          ),
             SizedBox(width: 2.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 248.w,
                
                child: Text(
                  "Order ID : ${order.orderid}",
                  style: GoogleFonts.nunitoSans(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                "${order.cartdata.length} Items",
                style: GoogleFonts.nunitoSans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color:
                        const Color.fromARGB(255, 134, 134, 134)),
              ),
              Text(
                "Order ${order.orderstatus!}",
                style: GoogleFonts.nunitoSans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color:
                       // const Color.fromARGB(255, 134, 134, 134)
                        order.orderstatus == 'placed' ?
      const Color.fromARGB(255, 120, 120, 120):
    order.orderstatus == 'canceled' ? Colors.red : 
    order.orderstatus == 'picked' ? Colors.black :
    order.orderstatus == 'delivered' ? Colors.green :
    Colors.black,
                        ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
