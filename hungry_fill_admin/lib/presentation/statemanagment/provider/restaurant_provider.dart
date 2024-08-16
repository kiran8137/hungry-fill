
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hungry_fill_admin/data/models/category_model.dart';
import 'package:hungry_fill_admin/data/models/restaurant_model.dart';
import 'package:hungry_fill_admin/data/repository/restaurant_repo/restaurant_repo_impl.dart';

class RestaurantProvider extends ChangeNotifier{

  RestaurantRepoImpl restaurantrepository;

  RestaurantProvider({required this.restaurantrepository});

  List<RestaurantModel> restaurants = [];
  List<CategoryModel> categories = [];

Future<void> getRestaurants() async {


try{
   final result = await restaurantrepository.getRestaurants();
  
  restaurants.addAll(result);
  notifyListeners();

  debugPrint(result.toString());

}catch(error){
  log(error.toString());
}
 
}

Future<void> createCategory({required String category}) async{
 
 try{
await restaurantrepository.createCategory(category: category);
 notifyListeners();
 }catch(error){
  log(error.toString());
 }
 
  
}

 Future<void> getCategories() async{

  // final result = await restaurantrepository.getCategories();
  // categories.addAll(result);
  // notifyListeners();
  restaurantrepository.getCategories().listen(
    (categorystream){
      categories = categorystream;
      notifyListeners();
    }
    );
 }

 Future<void> deleteCategory({required String categoryid}) async{
 await restaurantrepository.deleteCategory(categoryid: categoryid);
  notifyListeners();
 }
  
 Future<void> updateCategory({required CategoryModel category}) async{
  await restaurantrepository.updateCategory(category: category);
  notifyListeners();
 }
}