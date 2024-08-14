
import 'package:equatable/equatable.dart';

class RestaurantEntity extends Equatable {
   
  final String? restaurantuserid;
  final String? restaurantname; 
  final String? restaurantmobileNo;
  final String? restaurantstate;
  final String? restaurantdistrict;
  final String? restaurantplace;

   RestaurantEntity(
      {
        
        this.restaurantuserid,
        this.restaurantname,  
        this.restaurantmobileNo,
        this.restaurantstate,
        this.restaurantdistrict,
        this.restaurantplace});

  @override
  
  List<Object?> get props =>
      [restaurantuserid,restaurantname,restaurantmobileNo,restaurantstate,restaurantdistrict,restaurantplace];
}
