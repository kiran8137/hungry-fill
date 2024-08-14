import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
 
import 'package:file_picker/file_picker.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/category/category_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish/dish_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/domain/repositories/dish_repository.dart';
import 'package:image_picker/image_picker.dart';
 

String dishid = "";

class DishRepoImplementation extends DishRepository {
  @override
  Future<void> addDish({required DishModel dishmodel}) async {
    try {
      final resref =  FirebaseFirestore.instance
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

      await resref.set(dish.toJson());
      // set(dishmodel.toJson());

      log(resref.id);
    } catch (error) {
      log(error.toString());
    }
  }

  @override
  Stream<List<DishModel>> getDishes({String? userid})   {
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

      return FirebaseFirestore.instance.
      collection("Restaurants")
      .doc(userid)
      .collection("Dishes")
      .snapshots()
      .map((snapshot)=> snapshot.docs.map((dish)=> DishModel.fromJson(json: dish.data())).toList());
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
  Future<PlatformFile?> dishImagePicker() async {
    try {
      final result = await FilePicker.platform.pickFiles(
          );
      if (result != null && result.files.isNotEmpty) {
        return result.files.first;
      }
    } catch (error) {
      log(error.toString());
      throw Exception(error.toString());
    }
  }

  @override
  Future<void> createCategory({required List<CategoryModel> categories}) async {
    try {
      final firestore = FirebaseFirestore.instance;

      for(var i=0;i<categories.length;i++){
       final categoryref =   await firestore
      .collection("Restaurants")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("categories").add({'name':'veg'});
            CategoryModel category = CategoryModel(
              categoryid: categoryref.id,
              categoryname: categories[i].categoryname
            );
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
  Future<List<CategoryModel>> getCategories() async{

    try{

       final result = await FirebaseFirestore.instance
      .collection("Restaurants")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("categories")
      .get();

  List<CategoryModel> category = result.docs
      .map((cat) =>  CategoryModel(categoryid: cat.id , categoryname: cat['name']))
      .toList();
      debugPrint(category.toString());

    return category;

    }catch(error){
      log(" getcategory error ${error.toString()}");
      throw Exception(error.toString());
    }
    
  }


  
}

 

Future<Uint8List> pickimage() async {

  String? url;
  Uint8List? image;
  XFile? pickedfile = await ImagePicker().pickImage(source: ImageSource.gallery);
  image = await pickedfile!.readAsBytes();
  if(kIsWeb){
    Reference ref = FirebaseStorage.instance.ref().child('image/${pickedfile.name}');
    await ref.putData(
      await pickedfile.readAsBytes(),
      SettableMetadata(contentType: 'image/jpeg')
    ).whenComplete(() async{
      await ref.getDownloadURL().then((value) {
          url = value;
      
      });
    }
      
    );
     

  }
 debugPrint(url);
  return image;

 
}


  