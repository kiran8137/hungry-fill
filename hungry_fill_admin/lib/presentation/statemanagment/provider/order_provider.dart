import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hungry_fill_admin/data/models/orders_model.dart';
import 'package:hungry_fill_admin/data/repository/order_repo/order_repo_impl.dart';

class OrderProvider extends ChangeNotifier{
  OrderRepoImpl orderRepository;

  OrderProvider({required this.orderRepository});

  List<OrderModel> ordersList = [];

  var orderStatusList = ['All','Placed','Collected','Delivered'];
  String? selectStatus = 'Placed' ;
  String? selectedfilteroption; //orderslist page orderstatus filter option 
  
  bool filterenable = false;

  Future<void> getOrdersList()async{
    try{
      final result = await orderRepository.getOrdersListFromDb();
      ordersList.addAll(result);
      notifyListeners();
    }catch(error){
      log(error.toString());
    }
  }

  changeOrderStatus(String newStatus){
    selectStatus = newStatus;
    notifyListeners();
  }

  Future<void> updateOrderStatus({required String orderId , required String newStatus}) async{
    try{
      await orderRepository.updateOrderStatus(orderId: orderId, newStatus: newStatus);
      notifyListeners();
    }catch(error){
      log(error.toString());
    }
  }

 setFilterEnables(){
  filterenable = !filterenable;
  debugPrint(filterenable.toString());
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