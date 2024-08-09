
import 'package:equatable/equatable.dart';

class CartEntity extends Equatable{

final String? cartid;
final String? userid;
final String? restaurantid;
final String? dishid;
final int? dishquantity;
final int? priceperquantity;

 const CartEntity({this.cartid, this.userid, this.restaurantid, this.dishid, this.dishquantity, this.priceperquantity});



  @override
   
  List<Object?> get props => [];

  
}