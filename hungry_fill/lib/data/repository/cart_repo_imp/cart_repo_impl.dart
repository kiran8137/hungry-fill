

import 'dart:math';
import 'dart:developer';
 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';
import 'package:hungry_fill/domain/repositories/cart_repository/cart_repository.dart';



class CartRepoImpl extends CartRepository{




  @override
  Future<void> addDishToCart({required String? restaurantid, required List<String>? items}) async {
   

    try{

      final docref = FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid).collection("Cart").doc();
      CartModel cart = CartModel(restaurantid: restaurantid, items: items);
      docref.set(cart.toJson());
      


    }catch(error){
      debugPrint(error.toString());
      throw Exception(error.toString());
    }
  
  }



  @override
  Future<List<DishModel>> getDishInCart ({required String restaurantid}) async{
    List<String> dishids = [];
    List<DishModel> cartdishes = [];
     
     try{
      
      final cartdoc = await FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('Cart')
       
      .get();

      for(var doc in cartdoc.docs){
        dishids = List<String>.from(doc['items']);
      }

      for(var id in dishids){
            final dishdoc = await FirebaseFirestore.instance
          .collection("Restaurants")
          .doc(restaurantid)
          .collection('Dishes')
          .doc(id)
          .get();


          cartdishes.add(DishModel.fromSnapshot(snapshot: dishdoc));
      }

      // if(cartdoc.exists){
      //   dishids = List<String>.from(cartdoc['items']);

      //   for(var dishid in dishids){

      //     final dishdoc = await FirebaseFirestore.instance
      //     .collection("Restaurants")
      //     .doc(restaurantid)
      //     .collection('Dishes')
      //     .doc(dishid)
      //     .get();

      //     cartdishes.add(DishModel.fromSnapshot(snapshot: dishdoc));
      //   }
      // }

      return cartdishes;

     }catch(error){
      debugPrint(error.toString());
      throw Exception(error.toString());
     }
  }
  
}

// Future<void>createcart() async{

//   final docref = FirebaseFirestore.instance.collection("Users").doc('pwyH5xe0ABQqoKnoVTtfsJ2HUQ52').collection("Cart").doc();

//   CartModel cart = CartModel(restaurantid: "EVNCBQtwSBMoCI7EsKFvDwrX7vE3", items: ["foods"]);

//   docref.set(cart.toJson());

//   print(docref.id);

// }