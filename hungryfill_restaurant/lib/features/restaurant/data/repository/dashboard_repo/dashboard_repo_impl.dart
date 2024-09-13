import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/order/order_model.dart';

import 'package:hungryfill_restaurant/features/restaurant/domain/repositories/dashboard_repository.dart';
import 'package:intl/intl.dart';

class DashBoardRepoImpl extends DashBoardRepository {
  @override
  Future<int> getDishesCount() async {
    try {
      final result = await FirebaseFirestore.instance
          .collection('Restaurants')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('Dishes')
          .get();
      final dishesCount = result.docs.length;
      return dishesCount;
    } catch (error) {
      log(error.toString());
      throw Exception(error);
    }
  }

  @override
  Future<int> getTotalOrdersCount() async {
    try {
      final result = await FirebaseFirestore.instance
          .collection('OrderCollection')
          .where('restaurantId',
              isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get();
      final ordersCount = result.docs.length;
      return ordersCount;
    } catch (error) {
      log(error.toString());
      throw Exception(error);
    }
  }
  
  @override
  Future<int> calculateTodaysRevenue() async {
    DateTime now = DateTime.now();
String formattedDate =  DateFormat('dd/MM/yyyy').format(now);
int todaysRevenue = 0;

  try {
    final result = await FirebaseFirestore.instance
        .collection('OrderCollection')
        .where('restaurantId',isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .where('orderDate', isEqualTo: formattedDate )
        .where('orderStatus' , isEqualTo: 'Delivered')
        .get();

    final orderslist =  result.docs.map((order)=> OrderModel.fromJson(json: order.data())).toList();

     for(var order in orderslist){
      var val = int.parse(order.grandtotal!);
      todaysRevenue+=(val-40);
     }

     debugPrint(todaysRevenue.toString());
     return (todaysRevenue);
  } catch (error) {
    log(error.toString());
    throw Exception(error);
  }
  }
  
  @override
  Future<int> calculateTotalEarnings()async {
    int totalEarnings = 0;

     try {
    final result = await FirebaseFirestore.instance
        .collection('OrderCollection')
        .where('restaurantId',isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        
        .where('orderStatus' , isEqualTo: 'Delivered')
        .get();

    final orderslist =  result.docs.map((order)=> OrderModel.fromJson(json: order.data())).toList();

     for(var order in orderslist){
      var val = int.parse(order.grandtotal!);
      totalEarnings+=(val-40);
     }

     debugPrint(totalEarnings.toString());
     return (totalEarnings);
  } catch (error) {
    log(error.toString());
    throw Exception(error);
  }
  }
}

// Future<int> calculateTodaysRevenue() async {
//   DateTime now = DateTime.now();
// String formattedDate =  DateFormat('dd/MM/yyyy').format(now);
// int todaysRevenue = 0;

//   try {
//     final result = await FirebaseFirestore.instance
//         .collection('OrderCollection')
//         .where('restaurantId',isEqualTo: FirebaseAuth.instance.currentUser?.uid)
//         .where('orderDate', isEqualTo: formattedDate )
//         .where('orderStatus' , isEqualTo: 'Delivered')
//         .get();

//     final orderslist =  result.docs.map((order)=> OrderModel.fromJson(json: order.data())).toList();

//      for(var order in orderslist){
//       var val = int.parse(order.grandtotal!);
//       todaysRevenue+=val;
//      }

//      debugPrint(todaysRevenue.toString());
//      return (todaysRevenue-40);
//   } catch (error) {
//     log(error.toString());
//     throw Exception(error);
//   }
// }
