import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/core/theme/color.dart';
import 'package:hungry_fill_admin/data/models/orders_model.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/order_provider.dart';
import 'package:provider/provider.dart';

class OrderDetailDialog extends StatelessWidget {
  OrderDetailDialog({
    super.key,
    required this.order,
  });
  final OrderModel order;
  String? changedStatus;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 700,
        width: 700,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                width: 1, color: const Color.fromARGB(255, 203, 203, 203)),
            borderRadius: BorderRadius.circular(7)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Order Detail",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Text(
                'Order ID',
                style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: const Color.fromARGB(255, 175, 175, 175)),
              ),
              Text(
                '${order.orderid}',
                style: GoogleFonts.nunitoSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                width: double.infinity,
                //  color: Colors.grey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${order.restaurantname}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 90,
                      width: double.infinity,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 100,
                              width: 290,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(155, 248, 248, 248),
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
                                              order.cartdata[index].dishimage!,
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 85,
                                        child: Text(
                                          // cartdish.dishname!,
                                          '${order.cartdata[index].dishname}',
                                          maxLines: 2,
                                          style: GoogleFonts.roboto(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        //"₹ ${cartdish.priceperquantity.toString()}",
                                        "₹ ${order.cartdata[index].priceperquantity}",

                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey),
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
                                        '${order.cartdata[index].dishquantity}',
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
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 10,
                              ),
                          itemCount: order.cartdata.length),
                    )
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 10),
              const Text(
                "ADDRESS",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 160,
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.20),
                          spreadRadius: 0,
                          blurRadius: 7,
                          offset: const Offset(0, 5))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 150,
                          child: Text(
                            '${order.addressSelected!.street}',
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          )),
                      SizedBox(
                          width: 150,
                          child: Text(
                            '${order.addressSelected!.houseNo}, ${order.addressSelected!.district}, ${order.addressSelected!.state}',
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color:
                                    const Color.fromARGB(255, 139, 138, 138)),
                          )),
                      //const SizedBox(height: 5),
                      SizedBox(
                          width: 200,
                          child: Text(
                            'Phone No : ${order.addressSelected!.userMobileNumber}',
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          )),

                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Order Status : Order ${order.orderstatus}",
                style: GoogleFonts.nunitoSans(
                    color: order.orderstatus == 'placed'
                        ? const Color.fromARGB(255, 120, 120, 120)
                        : order.orderstatus == 'canceled'
                            ? Colors.red
                            : order.orderstatus == 'picked'
                                ? Colors.black
                                : order.orderstatus == 'delivered'
                                    ? Colors.green
                                    : Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              const Text(
                "Change Order Staus",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              Consumer<OrderProvider>(
                builder: (context, value, child) => Container(
                  width: 100,
                  height: 40,
                  child: DropdownButton<String>(
                      value: value.selectStatus,
                      items: value.orderStatusList.map((item) {
                        return DropdownMenuItem<String>(
                            value: item, child: Text(item));
                      }).toList(),
                      onChanged: (String? val) {
                        changedStatus = val;
                        debugPrint(changedStatus);
                        value.changeOrderStatus(val!);
                      }),
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Amount',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '₹ ${order.grandtotal}',
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  order.paymentType == 'Cash On Delivery'
                      ? Text('Cash On Delivery : ${order.grandtotal}',
                          style: GoogleFonts.nunitoSans(
                              color: const Color.fromARGB(255, 52, 52, 52),
                              fontSize: 16,
                              fontWeight: FontWeight.w600))
                      : Text('Paid : ${order.grandtotal}',
                          style: GoogleFonts.nunitoSans(
                              color: const Color.fromARGB(255, 52, 52, 52),
                              fontSize: 16,
                              fontWeight: FontWeight.w600))
                ],
              ),
              SizedBox(height: 30,),
              Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 20,
                      width: 100,
                      decoration: BoxDecoration(
                         color: primarycolor,
                         borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(
                        child: Text('Cancel',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                   GestureDetector(
                    onTap: ()async{
                      context.read<OrderProvider>().updateOrderStatus(orderId: order.orderid!, newStatus: changedStatus!);
                      Navigator.pop(context);
                    },
                     child: Container(
                      height: 20,
                      width: 100,
                      decoration: BoxDecoration(
                         color: primarycolor,
                         borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: Text('Save Changes',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                      ),
                                       ),
                   ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
