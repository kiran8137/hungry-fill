import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/data/model/order_model/order_model.dart';
import 'package:hungry_fill/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:hungry_fill/presentation/pages/cart_page/widgets/bill_details_widgets.dart';

//appbar
PreferredSize preferredSizedAppBar(BuildContext context,
    {required OrderModel orderdetail}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: AppBar(
      backgroundColor: Colors.white,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order ID : ${orderdetail.orderid}",
              style: GoogleFonts.nunitoSans(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600)),
          Text("12:00 PM | 09/12/2000",
              style: GoogleFonts.nunitoSans(
                  color: const Color.fromARGB(255, 120, 120, 120),
                  fontSize: 12,
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
    height: 100,
    width: double.infinity,
    decoration: BoxDecoration(
        color: const Color.fromARGB(155, 248, 248, 248),
        borderRadius: BorderRadius.circular(10)),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                    orderdetail.cartdata[index].dishimage!,
                  ),
                  fit: BoxFit.cover)),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 90,
              child: Text(
                // cartdish.dishname!,
                '${orderdetail.cartdata[index].dishname}',
                maxLines: 2,
                style: GoogleFonts.roboto(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              //"₹ ${cartdish.priceperquantity.toString()}",
              "₹ ${orderdetail.cartdata[index].priceperquantity}",
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            )
          ],
        ),
        const SizedBox(
          width: 40,
        ),
        const SizedBox(width: 30),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${orderdetail.cartdata[index].dishquantity}',
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 23,
                  fontWeight: FontWeight.w500),
            ),
          ],
        )
      ],
    ),
  );
}
