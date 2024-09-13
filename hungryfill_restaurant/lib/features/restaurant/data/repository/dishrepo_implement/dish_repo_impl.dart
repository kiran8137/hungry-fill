import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:file_picker/file_picker.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/category/category_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish/dish_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish_category/dish_category_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/domain/repositories/dish_repository.dart';
 

String dishid = "";

class DishRepoImplementation extends DishRepository {
  @override
  Future<bool> addDish({required DishModel dishmodel}) async {
    bool isAddDishComplete = false;
    try {
      final resref = FirebaseFirestore.instance
          .collection("Restaurants")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection("Dishes")
          .doc();

      DishModel dish = DishModel(
          dishid: resref.id,
          dishname: dishmodel.dishname,
          dishdescription: dishmodel.dishdescription,
          dishprice: dishmodel.dishprice,
          stock: dishmodel.stock,
          serve: dishmodel.serve,
          category: dishmodel.category,
          dishcategory: dishmodel.dishcategory,
          image1: dishmodel.image1,
          image2: dishmodel.image2,
          image3: dishmodel.image3,
          image4: dishmodel.image4
          
          );

      await resref.set(dish.toJson()).whenComplete(() {
        isAddDishComplete = !isAddDishComplete;
      },);
      // set(dishmodel.toJson());

      log(resref.id);

      return isAddDishComplete;
    } catch (error) {
      log(error.toString());
      throw Exception(error);
    }
  }

  @override
  Stream<List<DishModel>> getDishes({String? userid}) {
    try {
      // final dishessnapshot =   FirebaseFirestore.instance
      //     .collection("Restaurants")
      //     .doc(userid)
      //     .collection("Dishes")
      //     .get();

      // List<DishModel> dishes = dishessnapshot.docs
      //     .map((dish) => DishModel.fromJson(json: dish.data()))
      //     .toList();
      //     print(dishes.first.category);
      // return dishes;

      return FirebaseFirestore.instance
          .collection("Restaurants")
          .doc(userid)
          .collection("Dishes")
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((dish) => DishModel.fromJson(json: dish.data()))
              .toList());
    } catch (error) {
      log(" error ${error.toString()}");
      throw Exception(error.toString());
    }
  }

  @override
  Future<void> deleteDish({required String? dishid}) async {
    try {
      //  final dishref = await FirebaseFirestore.instance.collection("Restaurants").doc().collection("Dishes");
      //  final dishquerysnapshot = await dishref.where('dishName' , isEqualTo: dishname).get();

      await FirebaseFirestore.instance
          .collection("Restaurants")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection("Dishes")
          .doc(dishid)
          .delete();
    } catch (error) {
      log(error.toString());
    }
  }

  @override
  Future<void> updateDish({required DishModel dish}) async {
    try {
      await FirebaseFirestore.instance
          .collection("Restaurants")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection("Dishes")
          .doc(dish.dishid)
          .update(dish.toJson());
    } catch (error) {
      log(error.toString());
    }
  }

  @override
  Future<FilePickerResult?> ImagePicker() async {
    //Uint8List? selectedimagefile;
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




  @override
  Future<void> createCategory({required List<CategoryModel> categories}) async {
    try {
      final firestore = FirebaseFirestore.instance;

      for (var i = 0; i < categories.length; i++) {
        final categoryref = await firestore
            .collection("Restaurants")
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .collection("categories")
            .add({'name': 'veg'});
        CategoryModel category = CategoryModel(
            categoryid: categoryref.id,
            categoryname: categories[i].categoryname);
        await categoryref.set(category.toJson());
      }

      // final categoryref = FirebaseFirestore.instance
      //     .collection("Restaurants")
      //     .doc(FirebaseAuth.instance.currentUser?.uid)
      //     .collection("categories")
      //     .doc();
      //      log(categoryref.id);

      // CategoryModel category = CategoryModel(
      //   categoryid: categoryref.id,
      //   categoryname: categorymodel.categoryname
      // );

      // categoryref.set(category.toJson());

      // for(var cat in categories){
      //   CategoryModel category = CategoryModel(
      //     categoryid: categoryref.id,
      //     categoryname: cat.categoryname
      //   );
      //  await categoryref.set(category.toJson());
      // }
    } catch (error) {
      log("create category error ${error.toString()}");
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final result = await FirebaseFirestore.instance
          .collection("Categories")
         
          .get();

      List<CategoryModel> category = result.docs
          .map((cat) =>
              CategoryModel(categoryid: cat.id, categoryname: cat['name']))
          .toList();
      debugPrint(category.toString());

      return category;
    } catch (error) {
      log(" getcategory error ${error.toString()}");
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<DishCategoryModel>> getDishCategories() async {
    try{
      final result = await FirebaseFirestore.instance.collection('DishCategories').get();
      final dishcategories = result.docs.map((dishcat)=> DishCategoryModel.fromJson(json: dishcat.data())).toList();
      debugPrint(dishcategories.toString());
      return dishcategories;
    }catch(error){
      log(error.toString());
      throw Exception(error.toString());
    }
  }
}

Future<List<DishModel>> searchDishesFromDb({required String query}) async{
 // List<DishModel> filteredDishes = [];
  try{
    final result =await FirebaseFirestore.instance
          .collection("Restaurants")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection("Dishes")
          .get();
      
    final dishes = result.docs.map((dish)=>DishModel.fromJson(json: dish.data())).toList();
     return  dishes.where((dish)=>dish.dishname!.toLowerCase().contains(query.toLowerCase())).toList();
  }catch(error){
    log(error.toString());
    throw Exception(error);
  }
}