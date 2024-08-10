


 
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';

abstract class CartRepository{

  Future<void> addDishToCart({required CartModel cartmodel});

  Future<List<CartModel>> getCart({required String restaurantid});

  Future<List<dynamic>>  getRestaurantsInCart();
}