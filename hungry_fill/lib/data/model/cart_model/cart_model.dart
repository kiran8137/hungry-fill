
import 'package:hungry_fill/domain/entities/cart_entity/cart_entity.dart';

class CartModel extends CartEntity{
 const CartModel({required super.restaurantid, required super.items});

  factory CartModel.fromJson({required Map<String , dynamic> json}){
    return CartModel(
      restaurantid: json['restaurantId'], 
      items: json['items']
      );
  }


  Map<String , dynamic> toJson(){
    return {
      'restaurantId' : restaurantid,
      'items' : items,
    };
  }
}