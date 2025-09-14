import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_fill/data/model/address_model/address_model.dart';
import 'package:hungry_fill/data/model/order_model/order_model.dart';
import 'package:hungry_fill/presentation/pages/checkout_page/components/components_checkout.dart';
import 'package:hungry_fill/presentation/pages/main_pages/recent_orders_page/components/components_recentorders.dart';
import 'package:hungry_fill/presentation/pages/widgets/common_address_widget.dart';
import 'package:hungry_fill/presentation/pages/widgets/common_components.dart';
import 'package:hungry_fill/widgets/custom_text.dart';

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
                SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 25.h,
                width: double.infinity,
                child: orderStatus(orderdetail: orderdetail),
              ),
               // SizedBox(height: 30.h),
                
              // SizedBox(
              //   height: 200.h,
              //   width: double.infinity,
              //   child: ListView.separated(
              //       itemBuilder: (context, index) {
              //         return Padding(
              //           padding:
              //               const EdgeInsets.only(left: 8, right: 8, bottom: 5),
              //           child: dishDetailRecentOrder(
              //               index: index, orderdetail: orderdetail),
              //         );
              //       },
              //       separatorBuilder: (context, index) => const SizedBox(),
              //       itemCount: orderdetail.cartdata.length),
              // ),
              //  SizedBox(height: 10.h),
             // restaurantName(),
             
                SizedBox(height: 15.h),
              BlocListener<OrderBloc, OrderState>(
                listener: (context, state) {
                  if (state is CancelOrderInitial) {
                    const Center(child: CircularProgressIndicator());
                  }
                  if (state is CancelOrderSuccess) {
                    context.read<OrderBloc>().add(GetOrderDetailsEvent());
                    ScaffoldMessenger.of(context).showSnackBar(
                        scaffoldMessenger(
                          color: Colors.green,
                            message: "Order Cancelled Successfully"));
                  }
                },
                child: orderCancelButton(context, orderdetail),
              ),
             
            
              headingText(text: 'Address'),
              SizedBox(height: 5.h,),
              // CommonAddressWidget(
              //   addressSelected: AddressModel(
              //       street: orderdetail.addressSelected?.street,
              //       houseNo: orderdetail.addressSelected?.houseNo,
              //       district: orderdetail.addressSelected?.district,
              //       state: orderdetail.addressSelected?.state,
              //       userMobileNumber:
              //           orderdetail.addressSelected?.userMobileNumber),
              // ),
              Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(240, 245, 250, 1),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  // BoxShadow(
                                  //     color: Colors.black.withOpacity(0.20),
                                  //     spreadRadius: 0,
                                  //     blurRadius: 7,
                                  //     offset: const Offset(0, 5))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width: 150.w,
                                          child: CustomText(
                                            text: '${orderdetail.addressSelected?.street}',
                                            fontSize: 16.sp,
                                            color:
                                                Color.fromRGBO(50, 52, 62, 1),
                                          )),
                                       
                                    ],
                                  ),
                                  SizedBox(
                                      width: 220.w,
                                      child: CustomText(
                                        fontSize: 14.sp,
                                        text:
                                            '${orderdetail.addressSelected?.houseNo}, ${orderdetail.addressSelected?.district}, ${orderdetail.addressSelected?.state}',
                                        color: Color.fromRGBO(50, 52, 62, 1),
                                      )),
                                  //const SizedBox(height: 5),
                                  SizedBox(
                                      width: 200.w,
                                      child: CustomText(
                                          text:
                                              'Phone No : ${orderdetail.addressSelected?.userMobileNumber}',
                                          fontSize: 14.sp,
                                          color:
                                              Color.fromRGBO(50, 52, 62, 1))),

                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                SizedBox(height: 20.h),
                for (var i = 0; i < orderdetail.cartdata.length ; i++)
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, bottom: 5),
                        child: dishWidgetInCheckOut(orderdetail.cartdata[i]),
                      ),
                SizedBox(
                height: 10.h,
              ),
              headingText(text: 'Bill Total'),
                SizedBox(
                height: 10.h,
              ),
              billDetailsRecentOrder(orderdetail: orderdetail),
            ],
          ),
        ),
      )),
    );
  }
}
