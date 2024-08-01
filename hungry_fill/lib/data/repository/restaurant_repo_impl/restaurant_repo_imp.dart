

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungry_fill/data/model/restaurant_model/restaurant_model.dart';
import 'package:hungry_fill/domain/repositories/restaurant_repository/restaurant_respository.dart';

class RestaurantRepoImp extends RestaurantRepository{



  @override
  Future<List<RestaurantModel>> getRestaurants() async{

    try {

    QuerySnapshot<Map<String, dynamic>> snapshot =   await FirebaseFirestore.instance.collection("Restaurants").get();
   
   
    final restaurants = snapshot.docs.map((restaurant)=>RestaurantModel.fromJson(doc: restaurant)).toList();
    return restaurants;

    }catch(error){
      print(error.toString());
      throw Exception(error.toString());
      
     
  }


  }
}