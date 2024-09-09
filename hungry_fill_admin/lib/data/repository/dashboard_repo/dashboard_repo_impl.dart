
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungry_fill_admin/domain/repositories/dashboard_repository.dart';

class DashBoardRepoImpl extends DashBoardRepository{


  @override
  Future<int> getUsersCount()async {
     try{
      final result = await FirebaseFirestore.instance.collection('Users').get();
      final usersCount = result.docs.length;
      return usersCount;
     }catch(error){
      log(error.toString());
      throw Exception(error);
     }
  }
  
  @override
  Future<int> getTotalOrdersCount() async {
     try{
      final result = await FirebaseFirestore.instance.collection('OrderCollection').get();
      final ordersCount = result.docs.length;
      return ordersCount;
     }catch(error){
      log(error.toString());
      throw Exception(error);
     }
  }
  
  @override
  Future<int> getRestaurantCount() async{
      try{
      final result = await FirebaseFirestore.instance.collection('Restaurants').get();
      final restaurantsCount = result.docs.length;
      return restaurantsCount;
     }catch(error){
      log(error.toString());
      throw Exception(error);
     }
  }
}