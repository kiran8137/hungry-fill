


import 'dart:developer';
 

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungry_fill/data/model/category_model/category_model.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';
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
      log(error.toString());
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
     print(dishes);
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
     .collection("Restaurants")
     .doc(resuerid)
     .collection("categories")
     .get();
     //final snapshot =   await FirebaseFirestore.instance.collection("Restaurants").doc(userid).collection("Dishes").get();

      final categories = snapshot.docs.map((cat)=> CategoryModel.fromJson(json: cat.data())).toList();
      
      return categories;

      

     }catch(error){
      log(error.toString());
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
     
     print("category: $dishes");

     return dishes;

     }catch(error){
      log(error.toString());
      throw Exception(error.toString());
     }
  }
  
}

// Future<void> categorys() async{
//    try{

//       final snapshot = await FirebaseFirestore.instance
//      .collection("Restaurants")
//      .doc("EVNCBQtwSBMoCI7EsKFvDwrX7vE3")
//      .collection("categories")
//      .get();
//      //final snapshot =   await FirebaseFirestore.instance.collection("Restaurants").doc(userid).collection("Dishes").get();

//       final result = snapshot.docs.map((cat)=> CategoryModel.fromJson(json: cat.data())).toList();
//      print("category: $result");

//     }catch(error){
//       log(error.toString());
//       throw Exception(error.toString());
//     }
// }



// Future<void> categoryhDishes() async{

//     try{

//       final snapshot = await FirebaseFirestore.instance
//      .collection("Restaurants")
//      .doc("EVNCBQtwSBMoCI7EsKFvDwrX7vE3")
//      .collection("Dishes")
//      .where("category" , arrayContains: "1DtFhrpljNQ2DHzuG8oe")
//      .get();
//      //final snapshot =   await FirebaseFirestore.instance.collection("Restaurants").doc(userid).collection("Dishes").get();

//      List<DishModel> dishes = snapshot.docs.map((dish)=> DishModel.fromJson(json: dish.data())).toList();
     
//      print("category: $dishes");

//     }catch(error){
//       log(error.toString());
//       throw Exception(error.toString());
//     }
     

     
//   }


  // Future<void> searchDishes() async{

  //   try{

  //     final snapshot = await FirebaseFirestore.instance
  //    .collection("Restaurants")
  //    .doc("EVNCBQtwSBMoCI7EsKFvDwrX7vE3")
  //    .collection("Dishes")
  //    .where("dishName" , isEqualTo: "chicken biriyani")
  //    .get();
  //    //final snapshot =   await FirebaseFirestore.instance.collection("Restaurants").doc(userid).collection("Dishes").get();

  //    List<DishModel> dishes = snapshot.docs.map((dish)=> DishModel.fromJson(json: dish.data())).toList();
  //    print("search : $dishes");

  //   }catch(error){
  //     log(error.toString());
  //     throw Exception(error.toString());
  //   }
     

     
  // }
  



 
 






 