import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_fill/data/model/address_model/address_model.dart';
import 'package:hungry_fill/data/model/order_model/order_model.dart';
import 'package:hungry_fill/presentation/pages/main_pages/recent_orders_page/components/components_recentorders.dart';
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
                child: orderStatus(orderdetail: orderdetail),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, bottom: 5),
                        child: dishDetailRecentOrder(
                            index: index, orderdetail: orderdetail),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(),
                    itemCount: orderdetail.cartdata.length),
              ),
              const SizedBox(height: 10),
              restaurantName(),
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
                child: orderCancelButton(context, orderdetail),
              ),
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
