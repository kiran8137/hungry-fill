
import 'package:equatable/equatable.dart';

class RestaurantEntity extends Equatable {
   
  final String? restaurantname;
   
  final String? restaurantmobileNo;
  final String? restaurantstate;
  final String? restaurantdistrict;
  final String? restaurantplace;

   RestaurantEntity(
      {
        
        this.restaurantname,
         
        this.restaurantmobileNo,
        this.restaurantstate,
        this.restaurantdistrict,
        this.restaurantplace}){

          
        }

  @override
  
  List<Object?> get props =>
      [restaurantname,restaurantmobileNo,restaurantstate,restaurantdistrict,restaurantplace];
}
