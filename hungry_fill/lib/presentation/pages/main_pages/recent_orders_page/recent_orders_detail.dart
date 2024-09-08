import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/data/model/address_model/address_model.dart';
import 'package:hungry_fill/data/model/order_model/order_model.dart';
import 'package:hungry_fill/presentation/pages/main_pages/recent_orders_page/components/components_recentorders.dart';
import 'package:hungry_fill/presentation/pages/main_pages/recent_orders_page/widgets/cancel_button.dart';
import 'package:hungry_fill/presentation/pages/widgets/common_address_widget.dart';
import 'package:hungry_fill/presentation/pages/widgets/common_components.dart';

import '../../../bloc/order_bloc/order_bloc.dart';

class RecentOrdersDetailScreen extends StatelessWidget {
  const RecentOrdersDetailScreen({super.key, required this.orderdetail});

  final OrderModel orderdetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: preferredSizedAppBar(context, orderdetail: orderdetail),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 25,
                width: double.infinity,
                // color: Color.fromARGB(255, 250, 250, 250),
                child: Padding(
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
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 200,
                width: double.infinity,
                //color: Colors.blue,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, bottom: 5),
                        child: dishDetailRecentOrder(index: index , orderdetail: orderdetail),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(),
                    itemCount: orderdetail.cartdata.length),
              ),
              const SizedBox(height: 10),
              Container(
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
              ),
              const SizedBox(height: 15),
              BlocListener<OrderBloc, OrderState>(
                listener: (context, state) {
                  if (state is CancelOrderInitial) {
                    const Center(child: CircularProgressIndicator());
                  }
                  if (state is CancelOrderSuccess) {
                    context.read<OrderBloc>().add(GetOrderDetailsEvent());
                    ScaffoldMessenger.of(context).showSnackBar(
                        scaffoldMessenger(
                            message: "Order Cancelled Successfully"));
                  }
                },
                child: Padding(
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
                          
                             
                            : const SizedBox()),
              ),
              // const SizedBox(height: 20),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(
                height: 10,
              ),

            
              headingText(text: 'Address'),
              CommonAddressWidget(
                addressSelected: AddressModel(
                    street: orderdetail.addressSelected?.street,
                    houseNo: orderdetail.addressSelected?.houseNo,
                    district: orderdetail.addressSelected?.district,
                    state: orderdetail.addressSelected?.state,
                    userMobileNumber:
                        orderdetail.addressSelected?.userMobileNumber),
              ),

              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              
              headingText(text: 'Bill Total'),
              const SizedBox(
                height: 10,
              ),
              billDetailsRecentOrder(orderdetail: orderdetail),
            ],
          ),
        ),
      )),
    );
  }

  
  
}


