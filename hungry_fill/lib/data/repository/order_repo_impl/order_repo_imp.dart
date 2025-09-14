
import 'dart:developer';
 

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
 
import 'package:geolocator/geolocator.dart';
import 'package:hungry_fill/core/functions/functions.dart';
import 'package:hungry_fill/data/model/address_model/address_model.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/data/model/order_model/order_model.dart';
import 'package:hungry_fill/domain/repositories/order_repository/order_repository.dart';
import 'package:intl/intl.dart';

class OrderRepoImp extends OrderRepository{


  @override
  Future<Placemark> getAddress({required Position positon}) async{
     try{

      List<Placemark> placemark = await placemarkFromCoordinates(positon.latitude, positon.longitude);
    Placemark address = placemark.first;

    debugPrint("${address.subLocality} ${address.locality} , ${address.subAdministrativeArea} ${address.administrativeArea} ${address.country}");
    return address;

     }catch(error){
      log(error.toString());
      throw Exception(error.toString());
     }
  }

  @override
  Future<void> saveAddressToDB({required AddressModel useraddress}) async {
     
     
     
     try{

      final collectionref = FirebaseFirestore.instance.collection('Addresses').doc();

      final addressModel  = AddressModel(
                              addressid: collectionref.id,
                              latitude:  useraddress.latitude,
                              longitude:  useraddress.longitude,
                              userid: FirebaseAuth.instance.currentUser?.uid,
                              username: useraddress.username,
                              userMobileNumber: useraddress.userMobileNumber,
                              houseNo: useraddress.houseNo,
                              street: useraddress.street,
                              district: useraddress.district,
                              state: useraddress.state);
      
        collectionref.set(addressModel.toJson());
      //await FirebaseFirestore.instance.collection('Addresses').doc().set(useraddress.toJson());
     }catch(error){
      log(error.toString());
     }
  }

 @override
  Future<List<AddressModel>> getAddressesFromDb() async{
 String? userid = FirebaseAuth.instance.currentUser?.uid;
     
 final  addressnap  = await FirebaseFirestore.instance.collection('Addresses').where('userId' , isEqualTo: userid).get();

final result = addressnap.docs.map((address)=>AddressModel.fromJson(json: address.data())).toList();


return result;



}

  @override
  Future<void> removeAddress({required String addressid}) async {
    
    try{
      final docref =  FirebaseFirestore.instance.collection('Addresses').doc(addressid);
      await docref.delete();
    }catch(error){
      log(error.toString());
      throw Exception();
    }
  }

  @override
  Future<List<CartModel>> getCartInCheckOut({required String restaurantid}) async{
     final userid = FirebaseAuth.instance.currentUser?.uid;
     try{
      final cartdoc =  await FirebaseFirestore.instance
 
      .collection('Cart')
      .where('userId' , isEqualTo: userid )
      .where('restaurantId' , isEqualTo: restaurantid) 
      .get();

      final cartresult = cartdoc.docs.map((cart)=>CartModel.fromJson(json: cart.data())).toList();

      return cartresult;
     }catch(error){
      log(error.toString());
      throw Exception(error.toString());
     }
  }
  
  @override
  Future<AddressModel> getAddressUsingId({required String addressid}) async{
     
     try{
    
    final result = await FirebaseFirestore.instance.collection('Addresses').doc(addressid).get();
    AddressModel address = AddressModel.fromJson(json: result.data()!);
    return address;
     }catch(error){
      log(error.toString());
      throw Exception(error.toString());
     }
  }
  
  @override
  Future<void> placeOrder({required OrderModel order, required String restaurantId , required String addressId}) async {
     
     try{
      final collectionref = FirebaseFirestore.instance.collection('OrderCollection').doc();

final cartdetails = await getCartDetail(restaurantid: restaurantId);
final addressdetail = await getAddressOrderDetail(addressId: addressId);
DateTime now = DateTime.now();
String formattedDate =  DateFormat('dd/MM/yyyy').format(now);

 OrderModel ordermodel = OrderModel(
  orderid: collectionref.id,
  userid: order.userid,
  orderdate: formattedDate,
  paymentType: order.paymentType,
  paymentid: order.paymentid,
  addressSelected: addressdetail,
  cartdata: cartdetails,
  grandtotal: order.grandtotal,
  orderstatus: order.orderstatus,
  restaurantId: order.restaurantId,
  restaurantname: order.restaurantname
);

await collectionref.set(ordermodel.toJson()).then((_){
   
   for(var i = 0;i<cartdetails.length;i++){
     deleteCart(cartId: cartdetails[i].cartid!);
   }
  debugPrint("placedorder $order");
});
// if(order.paymentType == 'Cash On Delivery'){
//   OrderModel ordermodel = OrderModel(
//   orderid: collectionref.id,
//   userid: order.userid,
//   orderdate: DateTime.now().toString(),
//   paymentType: order.paymentType,
//   addressSelected: addressdetail,
//   cartdata: cartdetails,
//   grandtotal: order.grandtotal,
//   orderstatus: order.orderstatus
  
// );

// await collectionref.set(ordermodel.toJson()).then((_){
   
//    for(var i = 0;i<cartdetails.length;i++){
//      deleteCart(cartId: cartdetails[i].cartid!);
//    }
//   debugPrint("placedorder $order");
// });
// }
     }catch(error){
      log(error.toString());
      throw Exception(error.toString());
     }
  }
  
  @override
  Future<List<OrderModel>> getOrderDetails() async{
      String? userid = FirebaseAuth.instance.currentUser?.uid;
  try{
    final result = await FirebaseFirestore.instance.collection('OrderCollection').where('userId' , isEqualTo: userid).get();
    final orderslist = result.docs.map((order)=> OrderModel.fromJson(json: order.data())).toList();
    return orderslist;
  }catch(error){
    log(error.toString());
    throw Exception(error.toString());
  }
  }
  
  @override
  Future<void> cancelOrder({required String orderId}) async{
    
    try{
    final result =   FirebaseFirestore.instance.collection('OrderCollection').doc(orderId);
    await result.update({
      "orderStatus" : 'cancelled'
    });
    }catch(error){
      log(error.toString());
      throw Exception(error.toString());
    }
  }

  
}


// Future<List<OrderModel>> getOrderDetails() async{
//    String? userid = FirebaseAuth.instance.currentUser?.uid;
//   try{
//     final result = await FirebaseFirestore.instance.collection('OrderCollection').where('userId' , isEqualTo: userid).get();
//     final orderslist = result.docs.map((order)=> OrderModel.fromJson(json: order.data())).toList();
//     return orderslist;
//   }catch(error){
//     log(error.toString());
//     throw Exception(error.toString());
//   }
// }