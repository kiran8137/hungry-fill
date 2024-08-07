

 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hungry_fill/core/constants/constant.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';
import 'package:hungry_fill/domain/repositories/cart_repository/cart_repository.dart';



class CartRepoImpl extends CartRepository{




  @override
  Future<void> addDishToCart({required String? cartrestaurantid, required List<String>? items ,}) async {
   

    try{
       

       final collectionref = FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser?.uid).collection('Cart');

   final cartsnapshot = await collectionref.where("restaurantId" , isEqualTo: cartrestaurantid).limit(1).get();

   if(cartsnapshot.docs.isEmpty){

    print('if worked');
    final docref =  FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid).collection("Cart").doc(cartid);
    
      CartModel cart =   CartModel(restaurantid: cartrestaurantid, items: items );
      print('cart $cart');
     await docref.set(cart.toJson());

    final carttotalprice =  await carttotal(dishids: items! , restaurantid: cartrestaurantid);
       print(" cart total price$carttotalprice");


       CartModel updatedcart = CartModel(restaurantid: cartrestaurantid, items: items , totalprice: carttotalprice);
       await docref.update(updatedcart.toJson());

   }else{
    print('else worked');
    
    final docrefs =  FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid).collection("Cart").doc(cartid);
      
     
    final cartitemsnapshot = await docrefs.get();

    List<dynamic> cartitems = cartitemsnapshot['items'];
    cartitems.add(items!.first);
      
    docrefs.update(
      {
       // 'items' : ["3vR861PFbk5ZGrEDi5IM" , "Ya5x8LIjPvUmY16OEeg6"]
        'items' : cartitems,
        
         
      }
    );

    final carttotalprice =  await carttotal(dishids: items , restaurantid: cartrestaurantid);
       print(" updaateed cart total price$carttotalprice");

  docrefs.update(
      {
        
        'totalPrice' : carttotalprice
         
      }
    );


 
    
   }

   



    //   final docref =   FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid).collection("Cart").doc();
    //   CartModel cart = CartModel(restaurantid: restaurantid, items: items);
    //  await docref.set(cart.toJson());
      
      


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

Future<void> addDish() async{

   final collectionref = FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser?.uid).collection('Cart');

   final cartsnapshot = await collectionref.where('restaurantId' , isEqualTo: 'SzAIrtctPeQX9vi7uOk31RDZ5kz1').limit(1).get();

   if(cartsnapshot.docs.isEmpty){
    final docref =  FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid).collection("Cart").doc(cartid);
      CartModel cart = const CartModel(restaurantid: 'SzAIrtctPeQX9vi7uOk31RDZ5kz1', items: ["3vR861PFbk5ZGrEDi5IM"]);
     await docref.set(cart.toJson());
   }else{
    final docref =  FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid).collection("Cart").doc(cartid);
    docref.update(
      {
        'items' : ["3vR861PFbk5ZGrEDi5IM" , "Ya5x8LIjPvUmY16OEeg6"]
      }
    );
   }

   
}


Future<void> getcart () async{

  DocumentSnapshot<Map<String, dynamic>> result = await FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser?.uid).collection('Cart').doc(cartid).get();
  print(result.data());
  // CartModel cart =  CartModel.fromJson(json: result.data()!);
  

}

 