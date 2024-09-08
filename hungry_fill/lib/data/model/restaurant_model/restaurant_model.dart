

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungry_fill/domain/entities/restaurant_entity/restaurant_entity.dart';
 

class RestaurantModel extends RestaurantEntity {
    const RestaurantModel({
        
        super.restaurantuserid,
        super.restaurantname,
         
        super.restaurantmobileNo,
        super.restaurantstate,
        super.restaurantdistrict,
        super.restaurantplace
        
        }) ;



  factory RestaurantModel.fromJson({required DocumentSnapshot doc}){
    return RestaurantModel(
      
      restaurantuserid: doc["userId"],
      restaurantname: doc["restuarantName"],
     
      restaurantmobileNo: doc["restaurantMobileNo"],
      restaurantstate: doc["restaurantState"],
      restaurantdistrict:doc["restaurantDistrict"],
      restaurantplace: doc["restaurantPlace"]

      
      


    );
  }


  Map<String , dynamic > toJson(){
    return {
       
      "restuarantName": restaurantname,
      
      "restaurantMobileNo" : restaurantmobileNo,
      "restaurantState": restaurantstate,
      "restaurantDistrict" : restaurantdistrict,
      "restaurantPlace" : restaurantplace

    };
     
   }

   RestaurantModel copywith({
    String? userid,
    String? username,
    String? restaurantname,
    String? restaurantemail,
    String? restaurantmobileNo,
    String? restaurantstate,
    String? restaurantdistrict,
    String? restaurantplace,

   
 
  
   }){
    return RestaurantModel(
      
      restaurantname : restaurantname ?? this.restaurantname,
      
      restaurantmobileNo: restaurantmobileNo ?? this.restaurantmobileNo,
      restaurantstate: restaurantstate ?? this.restaurantstate,
      restaurantdistrict: restaurantdistrict ?? this.restaurantdistrict,
      restaurantplace: restaurantplace ?? this.restaurantplace
      
    );
   }
}
