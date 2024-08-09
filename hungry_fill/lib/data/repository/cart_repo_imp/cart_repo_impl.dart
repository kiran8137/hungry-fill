

 
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
 
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';
import 'package:hungry_fill/domain/repositories/cart_repository/cart_repository.dart';



class CartRepoImpl extends CartRepository{




  @override
  Future<void> addDishToCart({required CartModel cartmodel}) async {
   

    try{
       
    
    final docref = FirebaseFirestore.instance.collection('Cart').doc();

  debugPrint(docref.id); 

  CartModel cart = CartModel(
    cartid: docref.id,
    userid: cartmodel.userid, 
    dishid: cartmodel.dishid, 
    restaurantid: cartmodel.restaurantid, 
    dishquantity: cartmodel.dishquantity, 
    priceperquantity: cartmodel.priceperquantity
    );
  docref.set(cart.toJson());
      
      


    }catch(error){
      debugPrint(".....${error.toString()}");
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

      

      return cartdishes;

     }catch(error){
      debugPrint(error.toString());
      throw Exception(error.toString());
     }
  }
  
  @override
  Future<List<CartModel>> getRestaurantsInCart() async {
    String? userid = FirebaseAuth.instance.currentUser?.uid;
     Set<String> restaurants = {};
    try{
     
 final result =   await FirebaseFirestore.instance.collection('Cart').where('userId', isEqualTo: userid ).get();
     List<CartModel> cartmodel =  result.docs.map((res)=> CartModel.fromJson(json: res.data())).toList();

      
      return cartmodel;
    }catch(error){
      log(error.toString());
      throw Exception(error.toString());
    }
  }



  
}

// Future<void> adddish() async{

//   final docref =  await  FirebaseFirestore.instance.collection('Cart').doc();

//   debugPrint(docref.id);
//   docref.set({});
      
// }

 