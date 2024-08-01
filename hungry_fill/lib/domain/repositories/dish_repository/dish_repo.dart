
 
 

import 'package:hungry_fill/data/model/category_model/category_model.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';

abstract class DishRepository{

  Future<List<DishModel>> getDish({required String? resuerid});

  Future<List<DishModel>> searchDishes({required String? query , required String? userid});

  Future<List<CategoryModel>> getCategories({required String resuerid});

  Future<List<DishModel>> getCategoryDishes({required String categoryid , required String resuerid});
}