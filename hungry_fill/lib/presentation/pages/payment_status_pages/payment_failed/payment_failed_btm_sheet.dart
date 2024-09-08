

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentFailedScreen extends StatelessWidget {
  const PaymentFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), (){
      Navigator.pop(context);
    });
    return Scaffold(
      
      backgroundColor: Colors.white,
      body:  SafeArea(
        child: Center(
          child: LottieBuilder.asset('assets/paymentfail.json'),
        ),
      ),
    );
  }
}