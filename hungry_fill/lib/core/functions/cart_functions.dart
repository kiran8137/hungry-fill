
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';

Stream<List<CartModel>> getCart ({required String restaurantid}) async*{
    String? userid = FirebaseAuth.instance.currentUser?.uid;
    // List<String> dishids = [];
    // List<DishModel> cartdishes = [];
     
     try{
      //final carttotal = await getcarttotal(userid: userid!, restaurantid: restaurantid);
      //debugPrint(carttotal.toString());
      final cartdoc =   FirebaseFirestore.instance
 
      .collection('Cart')
      .where('userId' , isEqualTo: userid )
      .where('restaurantId' , isEqualTo: restaurantid)   
      .snapshots();
     
     await for(var snashot in cartdoc){
       List<CartModel> cart = snashot.docs.map((cart)=> CartModel.fromJson(json: cart.data())).toList();
      debugPrint(cart.toString());

      yield cart;

     }
     
       

     }catch(error){
      debugPrint(error.toString());
      throw Exception(error.toString());
     }
  }


  Stream<int> getcarttotal ({required String? userid , required String? restaurantid ,  }) async*{

  
  //int currentcartotal = 0;
   final cartdoc =   FirebaseFirestore.instance
 
      .collection('Cart')
      .where('userId' , isEqualTo: userid )
      .where('restaurantId' , isEqualTo: restaurantid)   
      .snapshots();

      await for(var snapshot in cartdoc){
        int cartotal = 0;
          List<CartModel> cart = snapshot.docs.map((cart)=> CartModel.fromJson(json: cart.data())).toList();
      debugPrint(" items in cart${cart.toString()}");

      for(var i in cart){
        
        int currentcartotal =  i.priceperquantity! * i.dishquantity!;
         cartotal = cartotal+currentcartotal;

         debugPrint(cartotal.toString());
      }
       
      yield cartotal;
      }

    

}



Future<void> increase({required int dishquantity , required String cartid}) async{

  final docref = FirebaseFirestore.instance.collection('Cart').doc(cartid);
  int newquantity = dishquantity+1;
 await docref.update({
    "dishQuantity" : newquantity
  });

}

Future<void> decrease({required int dishquantity , required String cartid}) async{

  final docref = FirebaseFirestore.instance.collection('Cart').doc(cartid);
  int newquantity = dishquantity-1;
 await docref.update({
    "dishQuantity" : newquantity
  });

}
 