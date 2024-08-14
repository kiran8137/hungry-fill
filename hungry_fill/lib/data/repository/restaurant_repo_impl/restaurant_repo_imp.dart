
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hungry_fill/data/model/restaurant_model/restaurant_model.dart';
import 'package:hungry_fill/domain/repositories/restaurant_repository/restaurant_respository.dart';

class RestaurantRepoImp extends RestaurantRepository {
  @override
  Future<List<RestaurantModel>> getRestaurants() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection("Restaurants").get();

      final restaurants = snapshot.docs
          .map((restaurant) => RestaurantModel.fromJson(doc: restaurant))
          .toList();
      return restaurants;
    } catch (error) {
      debugPrint(error.toString());
      throw Exception(error.toString());
    }
  }

  @override
  Future<void> addRestaurantToWishList({required restaurantid}) async {
    try {
      final wishlistdoc = FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('wishlist')
          .doc(restaurantid);

      wishlistdoc.set({'restaurantids': restaurantid});
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<String>> getRestaurantInWishList() async {
   
   try{

    final wishlistref = FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('wishlist');
  final wishlistdoc = await wishlistref.get();
  List<String> wishlist = wishlistdoc.docs.map((doc) => doc.id).toList();

  debugPrint(wishlist.toString());

  return wishlist;

   }catch(error){
    throw Exception(error.toString());
   }
  }
  
  @override
  Future<RestaurantModel> getRestaurantUsingId({required String restaurantid})async {
     
     try{
      
    final snapshot = await FirebaseFirestore.instance.collection("Restaurants").doc(restaurantid).get();
    RestaurantModel restaurant = RestaurantModel.fromJson(doc: snapshot);
    return restaurant;

     
     }catch(error){

      throw Exception(error.toString());

     }
  }
  
  @override
  Future<void> removeRestaurantFromWishist({required restaurantid}) async{
    try{
       final snapshot =   FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid).collection('wishlist').doc(restaurantid);
       await snapshot.delete();
    }catch(error){
     debugPrint(error.toString());
     throw Exception(error.toString());
    }
    
  }
}

//  Future<void> removeRestaurantWishList({required String restaurantid}) async{

//   final snapshot =   FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid).collection('wishlist').doc(restaurantid);
//    snapshot.delete();
//  }