import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/category/category_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish/dish_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/domain/repositories/dish_repository.dart';

String dishid = "";

class DishRepoImplementation extends DishRepository {
  @override
  Future<void> addDish({required DishModel dishmodel}) async {
    try {
      final resref = FirebaseFirestore.instance
          .collection("Restaurants")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection("Dishes")
          .doc();

      DishModel dish = DishModel(
          dishid: resref.id, 
          dishname: dishmodel.dishname,
          dishprice: dishmodel.dishprice,
          stock: dishmodel.stock,
          serve: dishmodel.serve,
          category: dishmodel.category);

      resref.set(dish.toJson());
      // set(dishmodel.toJson());

      log(resref.id);
    } catch (error) {
      log(error.toString());
    }
  }

  @override
  Future<List<DishModel>> getDishes({String? userid}) async {
    try {
      final dishessnapshot = await FirebaseFirestore.instance
          .collection("Restaurants")
          .doc("userid")
          .collection("Dishes")
          .get();

      List<DishModel> dishes = dishessnapshot.docs
          .map((dish) => DishModel.fromJson(json: dish.data()))
          .toList();
      return dishes;
    } catch (error) {
      log(error.toString());
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
  Future<PlatformFile?> dishImagePicker() async {
    try {
      final result = await FilePicker.platform.pickFiles(
          type: FileType.custom, allowedExtensions: ['jpg', 'jpeg', 'png']);
      if (result != null && result.files.isNotEmpty) {
        return result.files.first;
      }
    } catch (error) {
      log(error.toString());
      throw Exception(error.toString());
    }
  }

  @override
  Future<void> createCategory() async {
    try {
      final firestore = FirebaseFirestore.instance;
      await firestore
      .collection("Restaurants")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("categories").add({'name':'veg'});




      // final categoryref = FirebaseFirestore.instance
      //     .collection("Restaurants")
      //     .doc(FirebaseAuth.instance.currentUser?.uid)
      //     .collection("categories")
      //     .doc();

      //     CategoryModel category = CategoryModel(
      //       categoryid: categoryref.id,
      //       categoryname: categorymodel.categoryname
      //     );

      //     categoryref.set(category.toJson());

    } catch (error) {
      log(error.toString());
      throw Exception(error.toString());
    }
  }
}

Future<void> getcat() async {
  final result = await FirebaseFirestore.instance
      .collection("Restaurants")
      .doc("DrGiHa3uutdYSXUjl3TBUR1fwqG2")
      .collection("categories")
      .get();

  List<CategoryModel> category = result.docs
      .map((cat) => CategoryModel.fromJson(json: cat.data()))
      .toList();

  print("lunch ${category[1].categoryid}");
}
