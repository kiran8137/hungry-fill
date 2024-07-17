import 'dart:developer';
 

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish/dish_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/domain/repositories/dish_repository.dart';

class DishRepoImplementation extends DishRepository {


  @override
  Future<void> addDish({required DishModel dishmodel}) async {
    try {
      await FirebaseFirestore.instance
          .collection("Restaurants")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection("Dishes")
          .doc().set(dishmodel.toJson());
           
    } catch (error) {
      log(error.toString());
    }
  }
  
  @override
  Future<List<DishModel>> getDishes({String? userid}) async{
   
   try{
    final dishessnapshot =  await FirebaseFirestore.instance.collection("Restaurants").doc(userid).collection("Dishes").get();

    List<DishModel> dishes = dishessnapshot.docs.map((dish)=> DishModel.fromJson(json: dish.data())).toList();
    return dishes;

   }catch(error){
    log(error.toString());
    throw Exception(error.toString());
   }
    
  }
  
  
}
