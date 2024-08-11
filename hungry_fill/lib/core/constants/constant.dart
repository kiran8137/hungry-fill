
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
 

const String cartid = 'cartid1234';
const int packagingcharge = 10;
const int deliveycharge = 30;

Future<int?> carttotal({required List<String> dishids , required String? restaurantid}) async {
   
  


  try{

    

    final cartsnapref = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('Cart')
      .doc(cartid);

  DocumentSnapshot<Map<String, dynamic>> cartsnapshot = await cartsnapref.get();
   



  if (cartsnapshot.exists) {
    List<dynamic> dishids = cartsnapshot.get('items');

    print('dishids $dishids');

    final dishdocref = FirebaseFirestore.instance
        .collection("Restaurants")
        .doc(restaurantid)
        .collection('Dishes');

    final dishquerysnap = await dishdocref.where('dishId', whereIn: dishids).get();

    final result = dishquerysnap.docs.map((doc) => doc.data()).toList();

    List<int> dishprices = [];
    for (var i in result) {
      dishprices.add(int.parse(i['dishPrice']));
    }
    print(dishprices);

    var totalsum = 0;
    if(dishprices.length == 1){
      return dishprices.first;
    }else{
      totalsum = dishprices.reduce((value, element) => value += element);
       print(totalsum);
    return totalsum;
    }

    

   
    
  } else {
    print('doc not exists');
  }
  }catch(error){
    log(error.toString());
    throw Exception(error.toString());
  }

}


// int cartCalculations({required int quantity , required int price }){
//   var answer = price*quantity;
//   debugPrint(answer.toString());
//   return answer;
//}


// Future<int> getcarttotal ({required String? userid , required String? restaurantid}) async{

//   int cartotal = 0;
//    final cartdoc = await FirebaseFirestore.instance
 
//       .collection('Cart')
//       .where('userId' , isEqualTo: userid )
//       .where('restaurantId' , isEqualTo: restaurantid)   
//       .get();

//       List<CartModel> cart = cartdoc.docs.map((cart)=> CartModel.fromJson(json: cart.data())).toList();
//       debugPrint(" items in cart${cart.toString()}");

//       for(var i in cart){
//          cartotal = cartotal+i.priceperquantity!;
//       }
//       debugPrint(cartotal.toString());
//       return cartotal;

// }