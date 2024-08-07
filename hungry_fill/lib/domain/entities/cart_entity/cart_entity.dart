
import 'package:equatable/equatable.dart';

class CartEntity extends Equatable{

final String? restaurantid;
final List<String>? items;
final int? totalprice;

 const CartEntity({this.totalprice, required this.restaurantid, required this.items});



  @override
   
  List<Object?> get props => [restaurantid , items , totalprice];

  
}