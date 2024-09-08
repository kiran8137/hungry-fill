 
 
import 'package:hungry_fill_admin/core/models/address_model.dart';
import 'package:hungry_fill_admin/core/models/cart_model.dart';

class OrderEntity{

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
      required this.restaurantname
      });
      
}
