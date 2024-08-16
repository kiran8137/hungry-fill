

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungry_fill_admin/domain/entities/restaurant_entity.dart';

class RestaurantModel extends RestaurantEntity{
  

  RestaurantModel({
     super.restaurantuserid,
     super.restaurantname,
         
     super.restaurantmobileNo,
     super.restaurantstate,
     super.restaurantdistrict,
     super.restaurantplace
  });


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
  
}