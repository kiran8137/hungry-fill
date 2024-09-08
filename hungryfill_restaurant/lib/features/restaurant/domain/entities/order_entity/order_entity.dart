import 'package:equatable/equatable.dart';
import 'package:hungryfill_restaurant/core/models/address_model.dart';
import 'package:hungryfill_restaurant/core/models/cart_model.dart';

class OrderEntity extends Equatable {
  final String? orderid;
  final String? userid;
  final String? username;
  final String? orderdate;
  final String? paymentType;
  final String? paymentid;
  final AddressModel? addressSelected;
  final List<CartModel> cartdata;
  final String? grandtotal;
  final String? orderstatus;
  final String? restaurantname;

  const OrderEntity(
      {required this.orderid,
      required this.userid,
      required this.username,
      required this.cartdata,
      required this.orderdate,
      required this.paymentType,
      this.paymentid,
      required this.addressSelected,
      required this.grandtotal,
      required this.orderstatus,
      required this.restaurantname});

  @override
  // TODO: implement props
  List<Object?> get props => [
        orderid,
        userid,
        username,
        cartdata,
        orderdate,
        paymentType,
        paymentid,
        addressSelected,
        grandtotal,
        orderstatus,
        restaurantname
      ];
}
