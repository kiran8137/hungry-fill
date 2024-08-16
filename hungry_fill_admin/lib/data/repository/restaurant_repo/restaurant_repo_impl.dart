import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hungry_fill_admin/data/models/category_model.dart';
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

      // List<CategoryModel> category = result.docs
      //     .map((cat) =>
      //         CategoryModel(categoryid: cat.id, categoryname: cat['name']))
      //     .toList();
      // debugPrint(category.toString());

      // return category;


    //  try{
    //    final result = await FirebaseFirestore.instance
    //       .collection("Categories")
    //        .get();

    //   List<CategoryModel> category = result.docs
    //       .map((cat) =>
    //           CategoryModel(categoryid: cat.id, categoryname: cat['name']))
    //       .toList();
    //   debugPrint(category.toString());

    //   return category;

    //  }catch(error){
    //   log(error.toString());
    //   throw Exception(error.toString());
    //  }
  
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
}