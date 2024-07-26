


import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungry_fill/data/dish_model/dish_model.dart';
import 'package:hungry_fill/domain/repositories/dish_repository/dish_repo.dart';

class DishRepoImpl extends DishRepository{





  @override
  Future<List<DishModel>> getDish({required String? resuerid}) async {
    
    try{
      final snapshot =   await FirebaseFirestore.instance.collection("Restaurants").doc(resuerid).collection("Dishes").get();
      List<DishModel> dish = snapshot.docs.map((dish)=>DishModel.fromJson(json: dish.data())).toList();
      return dish;
    }
    catch(error){
      log(error.toString());
      throw Exception(error.toString());
    }
  }
  
}
 
 






// Future <void> getDish( {String? resuerid}) async{

//  QuerySnapshot<Map<String, dynamic>> snapshot =   await FirebaseFirestore.instance.collection("Restaurants").doc(resuerid).collection("Dishes").get();
   
   
//     final restaurants = snapshot.docs.map((dish)=>DishModel.fromJson(json: dish)).toList();

//     print(restaurants);


// }