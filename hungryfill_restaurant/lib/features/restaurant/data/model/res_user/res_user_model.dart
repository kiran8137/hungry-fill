
import 'package:flutter/material.dart';
import 'package:hungryfill_restaurant/features/restaurant/domain/entities/res_user/res_user_enitity.dart';

class RestaurantModel extends RestaurantEntity {
    RestaurantModel({
        super.username, 
        super.userid,
        super.restaurantname,
        super.restaurantemail,
        super.restaurantmobileNo,
        super.restaurantstate,
        super.restaurantdistrict,
        super.restaurantplace
        
        }){
          debugPrint("res model : $username");
        }



  factory RestaurantModel.fromJson({required Map<String, dynamic> json}){
    return RestaurantModel(
      username: json["userName"],
      userid: json["userId"],
      restaurantname: json["restuarantName"],
      restaurantemail: json["restaurantEmail"],
      restaurantmobileNo: json["restaurantMobileNo"],
      restaurantstate: json["restaurantState"],
      restaurantdistrict:json["restaurantDistrict"],
      restaurantplace: json["restaurantPlace"]

      
      


    );
  }


  Map<String , dynamic > toJson(){
    return {
      "userId" : userid,
      "userName" : username,
      "restuarantName": restaurantname,
      "restaurantEmail" : restaurantemail,
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
      userid: userid ?? this.userid,
      username: username ?? this.username,
      restaurantname : restaurantname ?? this.restaurantname,
      restaurantemail: restaurantemail ?? this.restaurantemail,
      restaurantmobileNo: restaurantmobileNo ?? this.restaurantmobileNo,
      restaurantstate: restaurantstate ?? this.restaurantstate,
      restaurantdistrict: restaurantdistrict ?? this.restaurantdistrict,
      restaurantplace: restaurantplace ?? this.restaurantplace
      
    );
   }
}
