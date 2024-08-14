
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/res_user/res_user_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/domain/repositories/res_user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
const String userloggedkey = 'islogged';

class ResUserImplementation extends RestaurantUserRepository {



  @override
  Future<void> saveRestaurantToDb({required RestaurantModel restaurantmodel}) async{
     
     try{
      await FirebaseFirestore.instance.collection("Restaurants").doc(restaurantmodel.userid).set(restaurantmodel.toJson());
     }catch(error){
      log(error.toString());
     }
  }
  
  @override
  Future<RestaurantModel?> getRestaurantDetails({required String userid}) async{
     
     try{
         DocumentSnapshot<Map<String , dynamic>> documentsnapshot = await FirebaseFirestore.instance.collection("Restaurants").doc(userid).get();
         if(documentsnapshot.exists){
          return RestaurantModel.fromJson(json: documentsnapshot.data()!);
         }else{
          log("no user found ");
         }

     }catch(error){
      log(error.toString());
      throw Exception(error.toString());
     }
  }
  
  @override
  Future<void> setRestaurantLoggedStatus({required bool isLoggedin}) async {
     
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setBool(userloggedkey, isLoggedin);

  }
  
  @override
  Future<bool> getRestaurantLoggedStatus() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
     return prefs.getBool(userloggedkey) ?? false;
  }
  
  @override
  Future<void> updateRestaurantDetails({required RestaurantModel restaurantmodel}) async{
    
    try{
      await FirebaseFirestore.instance.collection("Restaurants").doc(FirebaseAuth.instance.currentUser?.uid).update(restaurantmodel.toJson());
    }
    catch(error){
      log(error.toString());
    }
  }

  
  
}