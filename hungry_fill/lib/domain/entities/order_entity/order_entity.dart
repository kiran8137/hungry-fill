import 'package:equatable/equatable.dart';
import 'package:hungry_fill/data/model/address_model/address_model.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';

class OrderEntity extends Equatable {

  final String? orderid;
  final String? userid;
  final String? orderdate;
  final String? paymentType;
  final String? paymentid;
 final AddressModel? addressSelected;
  final List<CartModel> cartdata;
  final String? grandtotal;
  final String? orderstatus;
  final String? restaurantname;
  final String? restaurantId;

 const OrderEntity(
      {
      required this.orderid,
      required this.userid,
      required this.cartdata,
      required this.orderdate,
      required this.paymentType,
      this.paymentid,
      required this.addressSelected,
      required this.grandtotal,
      required this.orderstatus,
      required this.restaurantname,
      required this.restaurantId
      });
      
        @override
        
        List<Object?> get props => [userid , orderdate, paymentType ,paymentid, addressSelected , cartdata , grandtotal , orderstatus , restaurantname , restaurantId];
}
