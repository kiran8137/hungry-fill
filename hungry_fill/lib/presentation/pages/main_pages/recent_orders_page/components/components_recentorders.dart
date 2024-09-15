import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/data/model/order_model/order_model.dart';
import 'package:hungry_fill/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:hungry_fill/presentation/pages/cart_page/widgets/bill_details_widgets.dart';
import 'package:hungry_fill/presentation/pages/main_pages/recent_orders_page/widgets/cancel_button.dart';

//appbar
PreferredSize preferredSizedAppBar(BuildContext context,
    {required OrderModel orderdetail}) {
  return PreferredSize(
    preferredSize:   Size.fromHeight(80),
    child: AppBar(
      backgroundColor: Colors.white,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order ID : ${orderdetail.orderid}",
              style: GoogleFonts.nunitoSans(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600)),
          Text("12:00 PM | 09/12/2000",
              style: GoogleFonts.nunitoSans(
                  color: const Color.fromARGB(255, 120, 120, 120),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600)),
        ],
      ),
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new)),
    ),
  );
}

//cancel Order dialog
Future<dynamic> cancelDialog(BuildContext context, OrderModel orderdetail) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure want to cancel'),
          actions: [
            TextButton(
                onPressed: () {
                  debugPrint('cancel');
                  Navigator.pop(context);
                },
                child: const Text('cancel')),
            TextButton(
                onPressed: () {
                  debugPrint('ok');
                  BlocProvider.of<OrderBloc>(context)
                      .add(CancelOrderEvent(orderId: orderdetail.orderid!));

                  Navigator.pop(context);
                },
                child: const Text('ok')),
          ],
        );
      });
}

//bill details
Container billDetailsRecentOrder({required OrderModel orderdetail}) {
  return Container(
    height: 100,
    width: double.infinity,
    decoration: BoxDecoration(
        color:
            // Colors.green,
            const Color.fromARGB(155, 248, 248, 248),
        borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          BillDetailswidget(
            detail: "Total Amount",
            amount: "${orderdetail.grandtotal}",
          ),
          const Divider(),
          Row(
            children: [
              orderdetail.paymentType == 'Cash On Delivery'
                  ? Text('Cash On Delivery : ${orderdetail.grandtotal}',
                      style: GoogleFonts.nunitoSans(
                          color: const Color.fromARGB(255, 52, 52, 52),
                          fontSize: 16,
                          fontWeight: FontWeight.w600))
                  : Text('Paid : ${orderdetail.grandtotal}',
                      style: GoogleFonts.nunitoSans(
                          color: const Color.fromARGB(255, 52, 52, 52),
                          fontSize: 16,
                          fontWeight: FontWeight.w600))
            ],
          )
        ],
      ),
    ),
  );
}

Container dishDetailRecentOrder(
    {required int index, required OrderModel orderdetail}) {
  return Container(
    height: 100.h,
    width: double.infinity,
    decoration: BoxDecoration(
        color: const Color.fromARGB(155, 248, 248, 248),
        borderRadius: BorderRadius.circular(10)),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15),
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
             // color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                    orderdetail.cartdata[index].dishimage!,
                  ),
                  fit: BoxFit.cover)),
        ),
          SizedBox(
          width: 10.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 90.w,
              child: Text(
                // cartdish.dishname!,
                '${orderdetail.cartdata[index].dishname}',
                maxLines: 2,
                style: GoogleFonts.roboto(
                    fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              //"₹ ${cartdish.priceperquantity.toString()}",
              "₹ ${orderdetail.cartdata[index].priceperquantity}",
              style:   TextStyle(fontSize: 14.sp, color: Colors.grey),
            )
          ],
        ),
          SizedBox(
          width: 40.w,
        ),
          SizedBox(width: 30.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${orderdetail.cartdata[index].dishquantity}',
              style:   TextStyle(
                  color: Colors.grey,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w500),
            ),
          ],
        )
      ],
    ),
  );
}


  Padding orderStatus({required OrderModel orderdetail}) {
    return Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "Order Status : Order ${orderdetail.orderstatus}",
                  style: GoogleFonts.nunitoSans(
                      color: orderdetail.orderstatus == 'placed'
                          ? const Color.fromARGB(255, 120, 120, 120)
                          : orderdetail.orderstatus == 'canceled'
                              ? Colors.red
                              : orderdetail.orderstatus == 'picked'
                                  ? Colors.black
                                  : orderdetail.orderstatus == 'delivered'
                                      ? Colors.green
                                      : Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                ),
              );
  }

   Container restaurantName() {
    return Container(
              height: 25,
              width: double.infinity,
              color: const Color.fromARGB(255, 250, 250, 250),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "Restaurant : 12333",
                  style: GoogleFonts.nunitoSans(
                      color: const Color.fromARGB(255, 120, 120, 120),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            );
  }


   Padding orderCancelButton(BuildContext context , OrderModel orderdetail) {
    return Padding(
                  padding:
                      const EdgeInsets.only(left: 8, right: 8, bottom: 5),
                  child: orderdetail.orderstatus == 'Placed'
                      ? GestureDetector(
                          onTap: () {
                            cancelDialog(context , orderdetail);
                          },
                          child: const CancelButton(buttontext: 'Cancel Order', buttoncolor: primarycolor, buttontextcolor: Colors.white ,),
                        )
                      : orderdetail.orderstatus == 'cancelled'
                          ? const CancelButton(buttontext: 'Order cancelled', buttoncolor: Colors.grey, buttontextcolor:  Colors.black )
                        
                           
                          : const SizedBox());
  }


  Text text(String text) {
    return   Text(text,
          style: const TextStyle(fontSize: 23,
          fontWeight: FontWeight.w500
          ),
          );
  }