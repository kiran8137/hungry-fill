import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hungry_fill_admin/data/models/orders_model.dart';
import 'package:hungry_fill_admin/domain/repositories/dashboard_repository.dart';
import 'package:intl/intl.dart';

class DashBoardRepoImpl extends DashBoardRepository {
  @override
  Future<int> getUsersCount() async {
    try {
      final result = await FirebaseFirestore.instance.collection('Users').get();
      final usersCount = result.docs.length;
      return usersCount;
    } catch (error) {
      log(error.toString());
      throw Exception(error);
    }
  }

  @override
  Future<int> getTotalOrdersCount() async {
    try {
      final result =
          await FirebaseFirestore.instance.collection('OrderCollection').get();
      final ordersCount = result.docs.length;
      return ordersCount;
    } catch (error) {
      log(error.toString());
      throw Exception(error);
    }
  }

  @override
  Future<int> getRestaurantCount() async {
    try {
      final result =
          await FirebaseFirestore.instance.collection('Restaurants').get();
      final restaurantsCount = result.docs.length;
      return restaurantsCount;
    } catch (error) {
      log(error.toString());
      throw Exception(error);
    }
  }

  @override
  Future<int> calculateTodaysRevenue() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    int todaysRevenue = 0;

    try {
      final result = await FirebaseFirestore.instance
          .collection('OrderCollection')
          .where('orderDate', isEqualTo: formattedDate)
          .where('orderStatus', isEqualTo: 'Delivered')
          .get();

      final orderslist = result.docs
          .map((order) => OrderModel.fromJson(json: order.data()))
          .toList();

      for (var order in orderslist) {
        var val = int.parse(order.grandtotal!);
        todaysRevenue += (val - 40);
      }

      debugPrint(todaysRevenue.toString());
      return (todaysRevenue);
    } catch (error) {
      log(error.toString());
      throw Exception(error);
    }
  }

  @override
  Future<int> calculateTotalEarnings() async {
   int totalEarnings = 0;

     try {
    final result = await FirebaseFirestore.instance
        .collection('OrderCollection')
        
        
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
