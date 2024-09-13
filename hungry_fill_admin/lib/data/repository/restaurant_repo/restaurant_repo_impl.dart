import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hungry_fill_admin/data/models/category_model.dart';
import 'package:hungry_fill_admin/data/models/dish_category_model.dart';
import 'package:hungry_fill_admin/data/models/restaurant_model.dart';
import 'package:hungry_fill_admin/domain/repositories/restaurant_repository.dart';

class RestaurantRepoImpl extends RestaurantRespository{
  @override
  Future<List<RestaurantModel>> getRestaurants() async {
         try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection("Restaurants").get();

      final restaurants = snapshot.docs
          .map((restaurant) => RestaurantModel.fromJson(doc: restaurant))
          .toList();
      return restaurants;
    } catch (error) {
      debugPrint(error.toString());
      throw Exception(error.toString());
    }
  }

  @override
  Future<void> createCategory({required String category}) async{
    final firebasefirestore = FirebaseFirestore.instance;
    try{
     final ref =  firebasefirestore.collection('Categories').doc();
    CategoryModel categoryModel = CategoryModel(categoryname: category , categoryid: ref.id);
    await ref.set(categoryModel.toJson());
    }catch(error){
      log(error.toString());
      throw Exception(error.toString());
    }
  }
  
  @override
  Stream<List<CategoryModel>> getCategories()  {
     
     return 
            FirebaseFirestore.instance
          .collection("Categories")
           .snapshots()
           .map((snapshot)=>
           snapshot.docs.map((cat)=>
           CategoryModel.fromJson(json: cat.data())
           ).toList()
           
           );

     
  
  }
  
  @override
  Future<void> deleteCategory({required String categoryid}) async {
     
     try{

      await FirebaseFirestore.instance.collection('Categories').doc(categoryid).delete();

     }catch(error){
      log(error.toString());
      throw Exception(error.toString());
     }
  }
  
  @override
  Future<void> updateCategory({required CategoryModel category}) async{
    
    
    try{
      await FirebaseFirestore.instance
      .collection('Categories')
      .doc(category.categoryid)
      .update(category.toJson());
    }catch(error){
      log(error.toString());
      throw Exception(error.toString());
    }
  }
  


  @override
  Future<void> createDishCategory({required String dishcategory , required String dishcategoryimgeurl}) async{
    final firebasefirestore = FirebaseFirestore.instance;
     try{
       final ref =  firebasefirestore.collection('DishCategories').doc();
    DishCategoryModel dishcategoryModel = DishCategoryModel(dishcategoryid: ref.id , dishcategoryname: dishcategory ,dishcategoryimgeurl: dishcategoryimgeurl );
    await ref.set(dishcategoryModel.toJson());
     }catch(error){
      throw Exception(error.toString());
     }
  }
  
  @override
  Future<void> deleteDishCategory({required String dishcategoryid}) {
     
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateDishCategory({required CategoryModel dishcategory}) {
     
    throw UnimplementedError();
  }
  
  @override
  Stream<List<DishCategoryModel>> getDishCategories() {
     return 
          FirebaseFirestore.instance
          .collection("DishCategories")
          .snapshots()
          .map((snapshot)=>
          snapshot.docs.map((cat)=>
          DishCategoryModel.fromJson(json: cat.data())
          ).toList()
           
           );
  }

  @override
  Future<FilePickerResult?> imagePicker() async {
    try {
     
        final pickedimage = await FilePicker.platform.pickFiles();

        if (pickedimage != null) {
          
        }

        return pickedimage;
      
    } catch (error) {
      log(error.toString());
      throw Exception(error.toString());
    }
  }
}


// Future<List<RestaurantModel>> searchDishesFromDb({required String query}) async{
//  // List<DishModel> filteredDishes = [];
//   try{
//     final result =await FirebaseFirestore.instance
//           .collection("Restaurants")
          
//           .get();
      
//     final dishes = result.docs.map((dish)=>REst.fromJson(json: dish.data())).toList();
//      return  dishes.where((dish)=>dish.dishname!.toLowerCase().contains(query.toLowerCase())).toList();
//   }catch(error){
//     log(error.toString());
//     throw Exception(error);
//   }
