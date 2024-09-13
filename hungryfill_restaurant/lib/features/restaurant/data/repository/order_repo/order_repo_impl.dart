
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
import 'package:flutter/material.dart';
 
import 'package:hungryfill_restaurant/features/restaurant/data/model/order/order_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/domain/repositories/order_repository.dart';

class OrderRepoImpl extends OrderRepository{
  @override
  Future<List<OrderModel>> getOrdersListFromDb() async{
    List<OrderModel> ordersList = [];
     try{
    final result =  await FirebaseFirestore.instance.collection('OrderCollection').where('restaurantId' ,isEqualTo: FirebaseAuth.instance.currentUser?.uid).get();;

    final orderResult = result.docs.map((order)=> OrderModel.fromJson(json: order.data())).toList();
    debugPrint(ordersList.toString());

   if(orderResult.isNotEmpty){
    for(var order in orderResult){
      var userId = order.userid;

      final userdetail =  await FirebaseFirestore.instance.collection('Users').doc(userId).get();
      final userName =   userdetail.get('userName');
      ordersList.add(OrderModel(
        orderid: order.orderid,
        userid: userId,
        username: userName.toString(),
        orderdate: order.orderdate,
        paymentType: order.paymentType,
        paymentid: order.paymentid,
        addressSelected: order.addressSelected,
        cartdata: order.cartdata,
        grandtotal: order.grandtotal,
        orderstatus: order.orderstatus,
        restaurantname: order.restaurantname
      ));
    }
   }
    
    return ordersList;
    
  }catch(error){
    log(error.toString());
    throw Exception(error);

  }

  }
}

 Future<List<OrderModel>> getFilterOrdersFromDb({required String filteroption}) async{
     try{
    final result = await FirebaseFirestore.instance.collection('OrderCollection').where('orderStatus', isEqualTo: filteroption).get();

    final filterordersList = result.docs.map((order)=> OrderModel.fromJson(json: order.data())).toList();
    debugPrint(filterordersList.toString());
    
    return filterordersList;
    
  }catch(error){
    log(error.toString());
    throw Exception(error);

  }

  }