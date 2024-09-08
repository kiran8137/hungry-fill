import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_fill/core/functions/functions.dart';
import 'package:hungry_fill/data/model/order_model/order_model.dart';
import 'package:hungry_fill/presentation/bloc/address_bloc/address_bloc.dart';
import 'package:hungry_fill/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:hungry_fill/presentation/pages/checkout_page/components/components_checkout.dart';

import 'package:hungry_fill/presentation/pages/checkout_page/widget/address_select_btmsheet.dart';
import 'package:hungry_fill/presentation/pages/payment_status_pages/order_placed_page/order_placed.dart';
import 'package:hungry_fill/presentation/pages/payment_status_pages/payment_failed/payment_failed_btm_sheet.dart';
import 'package:hungry_fill/presentation/pages/widgets/common_components.dart';
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
        title: totalBillInAppBar(
            text: 'Total Bill', carttotalprice: widget.carttotalprice),
      ),
      body: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, state) {
          // TODO: implement listener
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
                    Text(
                      widget.restaurantname,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    const Divider(),
                    headingText(text: 'Delivery To'),
                    const SizedBox(height: 5),
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
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: BlocBuilder<AddressBloc, AddressState>(
                        builder: (context, state) {
                          debugPrint('${state.runtimeType}');
                          if (state is GetAddressUsingIdEvent) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is GetAddressUsingIdSuccess) {
                            return addressDetailCheckOut(state);
                          } else {
                            return const Center(
                              child: SizedBox(),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 5),
                    headingText(text: 'Dishes'),
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      //color: Colors.blue,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            final cartdish = state.cartmodel[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 5),
                              child: dishWidgetInCheckOut(cartdish),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(),
                          itemCount: state.cartmodel.length),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 5),
                    headingText(text: 'Pay Using'),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isCod = !isCod;
                        });
                      },
                      child: payUsingOptions(
                          paymentoption: "Cash On Delivery", isCod: isCod),
                    ),
                    const SizedBox(height: 5),
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
                                  orderstatus: 'Placed');
                              if (result == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    scaffoldMessenger(
                                        message: "Address Not selected"));
                              } else {
                                 
                                BlocProvider.of<OrderBloc>(context).add(
                                    PlaceOrder(
                                        order: order,
                                        restaurantId: widget.restaurantid,
                                        addressid: result!));
                              }
                            },
                            child: conformPaymentButton(text: 'CONFIRM ORDER')
                           
                            )
                        : const SizedBox(),
                    const SizedBox(
                      height: 5,
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
                    const SizedBox(height: 5),
                    isOnline
                        ? GestureDetector(
                            onTap: () async {
                              if (result == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    scaffoldMessenger(
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
