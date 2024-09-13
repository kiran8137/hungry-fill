
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/order/order_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/repository/order_repo/order_repo_impl.dart';

class OrderProvider extends ChangeNotifier{

   OrderRepoImpl orderRepository;

  OrderProvider({required this.orderRepository});

   List<OrderModel> ordersList = [];

  var orderStatusList = ['All','Placed','Collected','Delivered'];
  String? selectStatus = 'Placed' ;
  String? selectedfilteroption; //orderslist page orderstatus filter option 


   Future<void> getOrdersList()async{
    try{
      final result = await orderRepository.getOrdersListFromDb();
      ordersList.addAll(result);
      notifyListeners();
    }catch(error){
      log(error.toString());
    }
  }

  changeSelectedFilter(String newStatus){
    selectedfilteroption = newStatus;
    notifyListeners();
  }

  Future<void> filterOrder({required String filteroption}) async{
    if(filteroption == 'All'){
       final result = await orderRepository.getOrdersListFromDb();
      ordersList.addAll(result);
      notifyListeners();
      
    }else{
      ordersList.clear();
    final resultl = await getFilterOrdersFromDb(filteroption: filteroption);
    ordersList.addAll(resultl);
    notifyListeners();
    }
    
  }
}