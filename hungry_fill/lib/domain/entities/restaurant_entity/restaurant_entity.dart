
import 'package:equatable/equatable.dart';

class RestaurantEntity extends Equatable {
   
  final String? userid;
  final String? restaurantname; 
  final String? restaurantmobileNo;
  final String? restaurantstate;
  final String? restaurantdistrict;
  final String? restaurantplace;

   RestaurantEntity(
      {
        
        this.userid,
        this.restaurantname,  
        this.restaurantmobileNo,
        this.restaurantstate,
        this.restaurantdistrict,
        this.restaurantplace}){

          
        }

  @override
  
  List<Object?> get props =>
      [userid,restaurantname,restaurantmobileNo,restaurantstate,restaurantdistrict,restaurantplace];
}
