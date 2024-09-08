


import 'dart:developer';
 

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hungry_fill/core/restaurant_and_dish/restaurant_and_dish.dart';
import 'package:hungry_fill/data/model/category_model/category_model.dart';
import 'package:hungry_fill/data/model/dish_category_model/dish_category_model.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';
import 'package:hungry_fill/data/model/restaurant_model/restaurant_model.dart';
import 'package:hungry_fill/domain/repositories/dish_repository/dish_repo.dart';

class DishRepoImpl extends DishRepository{





  @override
  Future<List<DishModel>> getDish({required String? resuerid}) async  {
    
    try{
       

      final snapshot =   await FirebaseFirestore.instance.collection("Restaurants").doc(resuerid).collection("Dishes").get();
      List<DishModel> dish = snapshot.docs.map((dish)=>DishModel.fromJson(json: dish.data())).toList();
      return dish;
    }
    catch(error){
      log(".......${error.toString()}");
      throw Exception(error.toString());
    }
  }
  
  @override
  Future<List<DishModel>> searchDishes({required String? query, required String? userid}) async{

    try{

      final snapshot = await FirebaseFirestore.instance
     .collection("Restaurants")
     .doc(userid)
     .collection("Dishes")
     .where("dishName" , isEqualTo: query)
     .get();
     //final snapshot =   await FirebaseFirestore.instance.collection("Restaurants").doc(userid).collection("Dishes").get();

     List<DishModel> dishes = snapshot.docs.map((dish)=> DishModel.fromJson(json: dish.data())).toList();
     debugPrint(dishes.toString());
     return dishes;
      

    }catch(error){
      log(error.toString());
      throw Exception(error.toString());
    }
     

     
  }
  
  @override
  Future<List<CategoryModel>> getCategories({required String resuerid}) async {
     
     try{


      final snapshot = await FirebaseFirestore.instance
     .collection("Categories")
     .get();
     //final snapshot =   await FirebaseFirestore.instance.collection("Restaurants").doc(userid).collection("Dishes").get();

      final categories = snapshot.docs.map((cat)=> CategoryModel.fromJson(json: cat.data())).toList();
      
      return categories;

      

     }catch(error){
      log("cat error ${error.toString()}");
      throw Exception(error.toString());
     }
  }
  
  @override
  Future<List<DishModel>> getCategoryDishes({required String categoryid , required String resuerid}) async {
     try{

       final snapshot = await FirebaseFirestore.instance
     .collection("Restaurants")
     .doc(resuerid)
     .collection("Dishes")
     .where("category" , arrayContains: categoryid)
     .get();
     //final snapshot =   await FirebaseFirestore.instance.collection("Restaurants").doc(userid).collection("Dishes").get();

     List<DishModel> dishes = snapshot.docs.map((dish)=> DishModel.fromJson(json: dish.data())).toList();
     
     debugPrint("category: $dishes");

     return dishes;

     }catch(error){
      log(error.toString());
      throw Exception(error.toString());
     }
  }

  @override
  Future<List<RestaurantAndDish>> getFilterDish({required String dishcategoryid}) async{
    List<RestaurantAndDish> filteredDishandRestaurants = [];
    try{
      final restaurantSnapshot = await FirebaseFirestore.instance.collection('Restaurants').get();

      for(var restaurantdoc in restaurantSnapshot.docs){
        var restaurantdata = restaurantdoc.data();
        var restaurantid = restaurantdoc.id;

        final dishessnapshot = await FirebaseFirestore.instance
        .collection('Restaurants')
        .doc(restaurantid)
        .collection("Dishes")
        .where('dishCategory' , isEqualTo: dishcategoryid)
        .get();

        if(dishessnapshot.docs.isNotEmpty){
          List<DishModel> dishes = dishessnapshot.docs.map((dish)=> DishModel.fromJson(json: dish.data())).toList();
        

        filteredDishandRestaurants.add(RestaurantAndDish(
          restaurant: RestaurantModel.fromJson(doc: restaurantdoc), 
          dishes: dishes
          )
          );
        }
      }

      return filteredDishandRestaurants;
    }catch(error){
      log(error.toString());
      throw Exception(error.toString());
    }
  }
  
  @override
  Future<List<DishCategoryModel>> getDishesCategoryFilterOptionFromDb() async {
    try{
    final snapshot = await FirebaseFirestore.instance.collection('DishCategories').get();
    final result = snapshot.docs.map((doc)=> DishCategoryModel.fromJson(json: doc.data())).toList();
    debugPrint(result.toString());
return result;
  }catch(error){
    log(error.toString());
    throw Exception(error.toString());
  }
  }
  
}

// Future<List<DishCategoryModel>> getDishesCategoryFilterOptionFromDb() async{

//   try{
//     final snapshot = await FirebaseFirestore.instance.collection('DishCategories').get();
//     final result = snapshot.docs.map((doc)=> DishCategoryModel.fromJson(json: doc.data())).toList();
//     debugPrint(result.toString());
// return result;
//   }catch(error){
//     log(error.toString());
//     throw Exception(error.toString());
//   }
// }

 