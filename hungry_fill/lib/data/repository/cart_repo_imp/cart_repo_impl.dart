

 
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hungry_fill/core/functions/cart_functions.dart';
 
 
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/domain/repositories/cart_repository/cart_repository.dart';



class CartRepoImpl extends CartRepository{




  @override
  Future<void> addDishToCart({required CartModel cartmodel}) async {
   

    try{
       
    
    final docref = FirebaseFirestore.instance.collection('Cart').doc();

  debugPrint(docref.id); 

 //final carttotal =  cartCalculations(quantity: 2, price: cartmodel.priceperquantity!);

   
      CartModel cart = CartModel(
    cartid: docref.id,
    userid: cartmodel.userid, 
    dishid: cartmodel.dishid, 
    restaurantid: cartmodel.restaurantid, 
    dishquantity: cartmodel.dishquantity, 
    priceperquantity: cartmodel.priceperquantity,
    dishname:cartmodel.dishname 
    );
  docref.set(cart.toJson());
      
    
     


  
      


    }catch(error){
      debugPrint(".....${error.toString()}");
      throw Exception(error.toString());
    }
  
  }



  @override
  // Future<List<CartModel>> getCart ({required String restaurantid}) async{
  //   String? userid = FirebaseAuth.instance.currentUser?.uid;
  //   List<String> dishids = [];
  //   List<DishModel> cartdishes = [];
     
  //    try{
  //     final carttotal = await getcarttotal(userid: userid!, restaurantid: restaurantid);
  //     debugPrint(carttotal.toString());
  //     final cartdoc = await FirebaseFirestore.instance
 
  //     .collection('Cart')
  //     .where('userId' , isEqualTo: userid )
  //     .where('restaurantId' , isEqualTo: restaurantid)   
  //     .get();

  //     List<CartModel> cart = cartdoc.docs.map((cart)=> CartModel.fromJson(json: cart.data())).toList();
  //     debugPrint(cart.toString());

  //     return cart;

       

  //    }catch(error){
  //     debugPrint(error.toString());
  //     throw Exception(error.toString());
  //    }
  // }
  
  @override
  Future<List<dynamic>> getRestaurantsInCart() async {
    String? userid = FirebaseAuth.instance.currentUser?.uid;
     
    try{
     
 final result =   await FirebaseFirestore.instance.collection('Cart').where('userId', isEqualTo: userid ).get();
   final Set<dynamic> restaurant = result.docs.map((doc)=> doc["restaurantId"]).toSet();
      
      return restaurant.toList();
    }catch(error){
      log(error.toString());
      throw Exception(error.toString());
    }
  }



  
}

 
 Future<void> deleteDishInCart({required String cartid}) async{

   final docref = FirebaseFirestore.instance.collection('Cart').doc(cartid);
   await docref.delete();

 }

