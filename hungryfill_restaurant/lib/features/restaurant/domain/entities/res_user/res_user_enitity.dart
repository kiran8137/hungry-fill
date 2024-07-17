import 'package:equatable/equatable.dart';

class RestaurantEntity extends Equatable {
  final String? username;
  final String? userid;
  final String? restaurantname;
  final String? restaurantemail;
  final String? restaurantmobileNo;
  final String? restaurantstate;
  final String? restaurantdistrict;
  final String? restaurantplace;

   RestaurantEntity(
      {
        this.username,
        this.userid,
        this.restaurantname,
        this.restaurantemail,
        this.restaurantmobileNo,
        this.restaurantstate,
        this.restaurantdistrict,
        this.restaurantplace}){

          print("res enitiy : $username");
        }

  @override
  
  List<Object?> get props =>
      [restaurantname, restaurantemail,restaurantmobileNo,restaurantstate,restaurantdistrict,restaurantplace];
}
