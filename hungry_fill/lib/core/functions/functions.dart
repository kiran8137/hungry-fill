
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hungry_fill/data/model/address_model/address_model.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/data/model/user_model/user_model.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

Stream<List<CartModel>> getCartInStream ({required String restaurantid}) async*{
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




 
// getting current location using geolocator 

Future<Position> getCurrentLocation() async{
  
bool serviceEnabled;
LocationPermission permission;


  try{

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if(!serviceEnabled){
      return Future.error('location services are disabled');
    }
     
     permission = await Geolocator.checkPermission();

     if(permission == LocationPermission.denied){
       permission = await Geolocator.requestPermission();

       if(permission == LocationPermission.denied){
        return Future.error('location permission denied');
       }
     }

     if(permission == LocationPermission.deniedForever){
      return Future.error('location is permenantly denied');
     }


     Position position = await Geolocator.getCurrentPosition();

     return position;

  }catch(error){
    debugPrint(error.toString());
    throw Exception(error.toString());
  }
}


// Future<Placemark> getAddress(Position positon)async{
//   try{
//     List<Placemark> placemark = await placemarkFromCoordinates(positon.latitude, positon.longitude);
//     Placemark address = placemark.first;

//     debugPrint("${address.subLocality} ${address.locality} , ${address.subAdministrativeArea} ${address.administrativeArea} ${address.country}");
//     return address;

//   }catch(error){

//     debugPrint(error.toString());
//     throw Exception(error.toString());
    
//   }
// }
 

//getting user details for add address purpose

Future<UserModel?> getUserDetailForAddress() async{
  try{
      DocumentSnapshot<Map<String , dynamic>> documentsnapshot = await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid).get();
       if(documentsnapshot.exists){
        final user = UserModel.fromJson(json: documentsnapshot.data()!);
      return user;
    } 
    }
    catch (error){
       debugPrint(error.toString());
      throw Exception("error while getting user info $error");
    }
}


Future<List<CartModel>> getCartDetail({required restaurantid}) async{
  String? userid = FirebaseAuth.instance.currentUser?.uid;
  try{
    final result = await FirebaseFirestore.instance.collection('Cart') .where('userId' , isEqualTo: userid )
      .where('restaurantId' , isEqualTo: restaurantid).get();
    final cartdetails = result.docs.map((cart)=> CartModel.fromJson(json: cart.data())).toList();
    return cartdetails;
  }catch(error){
    throw Exception(error.toString());
  }
}

Future<AddressModel> getAddressOrderDetail ({required String addressId}) async{
   
   try{
  
    final result = await FirebaseFirestore.instance.collection('Addresses').doc(addressId).get();
    AddressModel address = AddressModel.fromJson(json: result.data()!);
    return address;
   }catch(error){
    throw Exception(error.toString());
   }
}


Future<void> deleteCart ({required String cartId}) async{

  try{
    await FirebaseFirestore.instance.collection('Cart').doc(cartId).delete();
  }catch(error){
    throw Exception(error.toString());
  }
}


 void openCheckOutPayments({
  required int amount,
  required String username,
  required String usermobilenumber,
  required Razorpay razorPay
 }){

  var options ={
    'key' : 'rzp_test_b0Ft6owMsckUhT',
    'amount' : amount*100,
    'name' : username,
    'prefill': {
      'contact': usermobilenumber,
      'email': 'test@razorpay.com',
    },
  };


  try{
  razorPay.open(options);
  }catch(error){
    throw Exception(error.toString());
  }
 }



Future<String> getUserMobileNumber({required String userId}) async{
 
  try{
    String userNumber;
    final result = await FirebaseFirestore.instance.collection('Users').doc(userId).get();
     userNumber = result.get('userMobileNumber');
     return userNumber;
  }catch(error){
    throw Exception(error.toString());
  }
}