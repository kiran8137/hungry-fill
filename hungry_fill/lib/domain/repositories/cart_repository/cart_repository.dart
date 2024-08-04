


import 'package:flutter/material.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';

abstract class CartRepository{

  Future<void> addDishToCart({required String? cartrestaurantid,required List<String>? items});

  Future<List<DishModel>> getDishInCart({required String restaurantid});
}