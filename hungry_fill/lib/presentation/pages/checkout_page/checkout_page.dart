import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/core/constants/constant.dart';
import 'package:hungry_fill/core/functions/functions.dart';
import 'package:hungry_fill/data/model/order_model/order_model.dart';
import 'package:hungry_fill/presentation/bloc/address_bloc/address_bloc.dart';
import 'package:hungry_fill/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:hungry_fill/presentation/pages/cart_page/widgets/bill_details_widgets.dart';
import 'package:hungry_fill/presentation/pages/checkout_page/components/components_checkout.dart';

import 'package:hungry_fill/presentation/pages/checkout_page/widget/address_select_btmsheet.dart';
import 'package:hungry_fill/presentation/pages/payment_status_pages/order_placed_page/order_placed.dart';
import 'package:hungry_fill/presentation/pages/payment_status_pages/payment_failed/payment_failed_btm_sheet.dart';
import 'package:hungry_fill/presentation/pages/widgets/common_components.dart';
import 'package:hungry_fill/widgets/custom_text.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage(
      {super.key,
      required this.restaurantid,
      required this.userid,
      required this.carttotalprice,
      required this.restaurantname});

  final String restaurantid;
  final String restaurantname;
  final String userid;
  final String carttotalprice;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final List<String> paymentmodes = [
    'Cash On Delivery',
    'Debit or Credit Cart'
  ];

  var selectedoption = 'Cash On Delivery';
  bool isCod = false;
  bool isOnline = false;
  String? result;
  String? newresult;

  late Razorpay razorpay;

  @override
  void initState() {
    BlocProvider.of<OrderBloc>(context)
        .add(GetCartInCheckOut(restaurantid: widget.restaurantid));
    //BlocProvider.of<AddressBloc>(context).add(GetAddressFromDb());
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    super.initState();
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> OrderSuccessPage()), (Route<dynamic> route)=> false);
    OrderModel order = OrderModel(
      userid: FirebaseAuth.instance.currentUser?.uid,
      orderdate: DateTime.now().toString(),
      paymentType: 'Online Payment',
      // addressSelected: result,
      paymentid: response.paymentId,
      grandtotal: widget.carttotalprice,
      cartdata: [],
      orderstatus: 'Placed',
    );
    context.read<OrderBloc>().add(PlaceOrder(
        order: order, restaurantId: widget.restaurantid, addressid: result!));
  }

  void handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (context) {
          return const PaymentFailedScreen();
        });
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        backgroundColor: Colors.white,
        title: CustomText(
          text: 'Check Out',
          fontSize: 17.sp,
          color: Color.fromRGBO(24, 528, 46, 1),
        ),
        // totalBillInAppBar(
        //     text: 'Total Bill', carttotalprice: widget.carttotalprice),
        actions: [
          CustomText(
            text: "₹ ${widget.carttotalprice.toString()}",
            fontSize: 20.sp,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            width: 2.w,
          )
        ],
      ),
      body: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state is PlaceOrderSuccess) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const OrderSuccessPage()),
                (Route<dynamic> route) => false);
          }
        },
        builder: (context, state) {
          if (state is GetCartInCheckOutInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetCartInCheckOutSuccess) {
            return SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(246, 248, 250, 1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Color.fromRGBO(160, 165, 186, 1))),
                      child: Row(
                        spacing: 5.w,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            color: Colors.amber,
                          ),
                          CustomText(
                            text: widget.restaurantname.toString(),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(24, 28, 46, 1),
                          ),
                        ],
                      ),
                      // child: GestureDetector(
                      //                       onTap: () {},
                      //                       // child: ProfileMenuWidget(
                      //                       //   leadingicon: Assets().userIcon,
                      //                       //   leadingIconColor: AppColors.primaryColor,
                      //                       //   title: 'Address',
                      //                       //   trailing: "assets/next.png",
                      //                       //   ontap: () {
                      //                       //     Navigator.push(
                      //                       //         context,
                      //                       //         MaterialPageRoute(
                      //                       //             builder: (context) => const AddressPage()));
                      //                       //   },
                      //                       // ),
                      //                     ),
                    ),

                    // const Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    headingText(text: 'Delivery To'),
                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: () async {
                        newresult = await showModalBottomSheet(
                            isDismissible: false,
                            context: context,
                            builder: (context) => const AddressBottomSheet());
                        result = newresult ?? result;
                        if (result != null) {
                          BlocProvider.of<AddressBloc>(context)
                              .add(GetAddressUsingId(addressid: result!));
                        }

                        debugPrint(result);
                      },
                      child: selectAddressContainer(),
                    ),
                    BlocBuilder<AddressBloc, AddressState>(
                      builder: (context, state) {
                        debugPrint('${state.runtimeType}');
                        if (state is GetAddressUsingIdEvent) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is GetAddressUsingIdSuccess) {
                          final userAddress = state.address;
                          return Container(
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
                                            text: '${userAddress.street}',
                                            fontSize: 16.sp,
                                            color:
                                                Color.fromRGBO(50, 52, 62, 1),
                                          )),
                                      GestureDetector(
                                          onTap: () async {
                                            newresult = await showModalBottomSheet(
                                                isDismissible: false,
                                                context: context,
                                                builder: (context) =>
                                                    const AddressBottomSheet());
                                            result = newresult ?? result;
                                            if (result != null) {
                                              BlocProvider.of<AddressBloc>(
                                                      context)
                                                  .add(GetAddressUsingId(
                                                      addressid: result!));
                                            }
                                          },
                                          child: CustomText(
                                            text: 'Change',
                                            fontSize: 14.sp,
                                            color: AppColors.primaryColor,
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                      width: 220.w,
                                      child: CustomText(
                                        fontSize: 14.sp,
                                        text:
                                            '${userAddress.houseNo}, ${userAddress.district}, ${userAddress.state}',
                                        color: Color.fromRGBO(50, 52, 62, 1),
                                      )),
                                  //const SizedBox(height: 5),
                                  SizedBox(
                                      width: 200.w,
                                      child: CustomText(
                                          text:
                                              'Phone No : ${userAddress.userMobileNumber}',
                                          fontSize: 14.sp,
                                          color:
                                              Color.fromRGBO(50, 52, 62, 1))),

                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              ),
                            ),
                          );
                          //addressDetailCheckOut(state);
                        } else {
                          return const Center(
                            child: SizedBox(),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 10.h),
                    const Divider(),
                    SizedBox(height: 5.h),
                    headingText(text: 'Dishes'),

                    for (var i = 0; i < state.cartmodel.length; i++)
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, bottom: 5),
                        child: dishWidgetInCheckOut(state.cartmodel[i]),
                      ),
                    // SizedBox(
                    //   height: 200.h,
                    //   width: double.infinity,
                    //   //color: Colors.blue,
                    //   child:
                    //   ListView.separated(
                    //       physics: NeverScrollableScrollPhysics(),
                    //       itemBuilder: (context, index) {
                    //         final cartdish = state.cartmodel[index];
                    //         return Padding(
                    //           padding: const EdgeInsets.only(
                    //               left: 8, right: 8, bottom: 5),
                    //           child: dishWidgetInCheckOut(cartdish),
                    //         );
                    //       },
                    //       separatorBuilder: (context, index) =>
                    //           const SizedBox(),
                    //       itemCount: state.cartmodel.length),
                    // ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(240, 245, 250, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          BillDetailswidget(
                            detail: "Total Amount",
                            amount: "${int.parse(widget.carttotalprice)}",
                          ),
                          const SizedBox(height: 15),
                          BillDetailswidget(
                              detail: "Item total",
                              amount:
                                  "${int.parse(widget.carttotalprice) - (packagingcharge + deliveycharge)}"),
                          const SizedBox(height: 15),
                          const BillDetailswidget(
                              detail: "packaging charges", amount: "10"),
                          const SizedBox(height: 15),
                          const BillDetailswidget(
                            detail: "delivery charges",
                            amount: "30",
                          ),
                          const SizedBox(height: 50),
                          BillDetailswidget(
                            detail: "Total Amount",
                            amount:
                                "${int.parse(widget.carttotalprice) + packagingcharge + deliveycharge}",
                          ),
                        ],
                      ),
                    ),
                    headingText(text: 'Pay Using'),
                    SizedBox(height: 5.h),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isCod = !isCod;
                        });
                      },
                      child: payUsingOptions(
                          paymentoption: "Cash On Delivery", isCod: isCod),
                    ),
                    SizedBox(height: 5.h),
                    isCod
                        ? GestureDetector(
                            onTap: () async {
                              OrderModel order = OrderModel(
                                  userid:
                                      FirebaseAuth.instance.currentUser?.uid,
                                  orderdate: DateTime.now().toString(),
                                  paymentType: 'Cash On Delivery',
                                  // addressSelected: result,
                                  grandtotal: widget.carttotalprice,
                                  cartdata: [],
                                  orderstatus: 'Placed',
                                  restaurantId: widget.restaurantid,
                                  restaurantname: widget.restaurantname,
                                   
                                  );
                              if (result == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    scaffoldMessenger(
                                        color: Colors.red,
                                        message: "Address Not selected"));
                              } else {
                                BlocProvider.of<OrderBloc>(context).add(
                                    PlaceOrder(
                                        order: order,
                                        restaurantId: widget.restaurantid,
                                        addressid: result!));
                              }
                            },
                            child: conformPaymentButton(text: 'CONFIRM ORDER'))
                        : const SizedBox(),
                    SizedBox(
                      height: 5.h,
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            isOnline = !isOnline;
                          });
                        },
                        child: payUsingOptions(
                            paymentoption: 'Choose a payment method',
                            isCod: isCod)),
                    SizedBox(height: 5.h),
                    isOnline
                        ? GestureDetector(
                            onTap: () async {
                              if (result == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    scaffoldMessenger(
                                        color: Colors.red,
                                        message: "Address Not selected"));
                              } else {
                                final usernumber = await getUserMobileNumber(
                                    userId:
                                        FirebaseAuth.instance.currentUser!.uid);
                                openCheckOutPayments(
                                    amount: int.parse(widget.carttotalprice),
                                    username: 'username',
                                    usermobilenumber: usernumber,
                                    razorPay: razorpay);
                              }
                            },
                            child: conformPaymentButton(text: 'PAY USING'),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
