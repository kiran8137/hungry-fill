
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
 
import 'package:flutter/material.dart';
import 'package:hungry_fill_admin/data/models/orders_model.dart';
import 'package:hungry_fill_admin/domain/repositories/order_repository.dart';

class OrderRepoImpl extends OrderRepository{
  @override
  Future<List<OrderModel>> getOrdersListFromDb() async{
     try{
    final result = await FirebaseFirestore.instance.collection('OrderCollection').get();

    final ordersList = result.docs.map((order)=> OrderModel.fromJson(json: order.data())).toList();
    debugPrint(ordersList.toString());
    
    return ordersList;
    
  }catch(error){
    log(error.toString());
    throw Exception(error);

  }

  }
}

 