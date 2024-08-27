
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geocoding_platform_interface/src/models/placemark.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hungry_fill/data/model/address_model/address_model.dart';
import 'package:hungry_fill/domain/repositories/order_repository/order_repository.dart';

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

  
}


