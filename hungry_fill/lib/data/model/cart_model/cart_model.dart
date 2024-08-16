
import 'package:hungry_fill/domain/entities/cart_entity/cart_entity.dart';

class CartModel extends CartEntity{
 const CartModel({
    super.cartid,
  required super.userid,
  required super.dishid,
  required super.restaurantid,
  required super.dishquantity,
  required super.priceperquantity,
  required super.dishname,
  required super.dishimage,
  
  
 });

  factory CartModel.fromJson({required Map<String , dynamic> json}){
    return CartModel(
      cartid : json['cartId'],
      userid: json['userId'],
      dishid: json['dishId'],
      restaurantid: json['restaurantId'], 
      dishquantity: json['dishQuantity'],
      priceperquantity: json['priceperQuantity'],
      dishname: json['dishName'],
      dishimage: json['dishImage']
      );
  }


  Map<String , dynamic> toJson(){
    return {
      'cartId' : cartid,
      'userId': userid,
      'dishId' : dishid,
      'restaurantId' : restaurantid,
      'dishQuantity' : dishquantity,
      'priceperQuantity' : priceperquantity,
      'dishName' : dishname,
      'dishImage' : dishimage

    };
  }
}