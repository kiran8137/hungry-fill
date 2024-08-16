
import 'package:equatable/equatable.dart';

class CartEntity extends Equatable{

final String? cartid;
final String? userid;
final String? restaurantid;
final String? dishid;
final int? dishquantity;
final int? priceperquantity;
final String? dishname;
final String? dishimage;


 const CartEntity({this.cartid, this.userid, this.restaurantid, this.dishid, this.dishquantity, this.priceperquantity , this.dishname , this.dishimage});



  @override
   
  List<Object?> get props => [cartid , userid , restaurantid , dishid , dishquantity , priceperquantity , dishname , dishimage];

  
}