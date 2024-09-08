
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hungry_fill/data/model/address_model/address_model.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/data/model/order_model/order_model.dart';

abstract class OrderRepository{


Future<Placemark> getAddress({required Position positon});

Future<void>  saveAddressToDB({required AddressModel useraddress});

Future<List<AddressModel>> getAddressesFromDb();

Future<void> removeAddress({required String addressid});

Future<List<CartModel>> getCartInCheckOut({required String restaurantid});

Future<AddressModel> getAddressUsingId({required String addressid});

Future<void> placeOrder ({required OrderModel order , required String restaurantId , required String addressId});

Future<List<OrderModel>> getOrderDetails();

Future<void> cancelOrder({required String orderId});

}
