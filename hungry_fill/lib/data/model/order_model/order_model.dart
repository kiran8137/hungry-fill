import 'package:hungry_fill/data/model/address_model/address_model.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/domain/entities/order_entity/order_entity.dart';

class OrderModel extends OrderEntity {
 const OrderModel(
      {
      super.orderid,
      super.userid,
      super.orderdate,
      super.paymentType,
      super.paymentid,
      super.addressSelected,
      required super.cartdata,
      super.grandtotal,
      super.orderstatus,
      super.restaurantname,
      super.restaurantId
      }
      );

      factory OrderModel.fromJson({required Map<String  , dynamic> json}){
        return OrderModel(
          orderid: json['orderId'],
          userid: json['userId'],
          orderdate: json['orderDate'],
          paymentType: json['paymentType'],
          paymentid: json['paymentId'],
          addressSelected: AddressModel.fromJson(json: json['addressSelected']),
          cartdata: (json['cartData'] as List<dynamic>).map((cart)=> CartModel.fromJson(json: cart as Map<String, dynamic>)).toList(),
          grandtotal: json['grandTotal'],
          orderstatus: json['orderStatus'],
          restaurantname: json['restaurantName'],
          restaurantId : json['restaurantId']


        );
      }

      Map<String , dynamic> toJson(){
        return {
          'orderId' : orderid,
          'userId' : userid,
          'orderDate':orderdate,
          'paymentType' : paymentType,
          'paymentId': paymentid,
          'addressSelected' : addressSelected?.toJson(),
          'cartData' : cartdata.map((cart)=> cart.toJson()).toList(),
          'grandTotal' : grandtotal,
          'orderStatus' : orderstatus,
          'restaurantName' : restaurantname,
          'restaurantId' : restaurantId
        };
      }
}


