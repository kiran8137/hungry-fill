import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hungry_fill_admin/data/models/orders_model.dart';
import 'package:hungry_fill_admin/data/repository/order_repo/order_repo_impl.dart';

class OrderProvider extends ChangeNotifier{
  OrderRepoImpl orderRepository;

  OrderProvider({required this.orderRepository});

  List<OrderModel> ordersList = [];


  Future<void> getOrdersList()async{
    try{
      final result = await orderRepository.getOrdersListFromDb();
      ordersList.addAll(result);
      notifyListeners();
    }catch(error){
      log(error.toString());
    }
  }
}