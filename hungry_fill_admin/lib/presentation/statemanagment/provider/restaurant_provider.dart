
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hungry_fill_admin/data/models/category_model.dart';
import 'package:hungry_fill_admin/data/models/dish_category_model.dart';
import 'package:hungry_fill_admin/data/models/restaurant_model.dart';
import 'package:hungry_fill_admin/data/repository/restaurant_repo/restaurant_repo_impl.dart';

class RestaurantProvider extends ChangeNotifier{

  RestaurantRepoImpl restaurantrepository;

  RestaurantProvider({required this.restaurantrepository});

  

  List<RestaurantModel> restaurants = [];
  List<CategoryModel> categories = [];
  List<DishCategoryModel> dishcategories = [];


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



 //dish wise category


 Future<void> createDishCategory({required String dishcategory , required String dishcategoryimgeurl}) async{
 
 try{
await restaurantrepository.createDishCategory(dishcategory: dishcategory , dishcategoryimgeurl: dishcategoryimgeurl);
 notifyListeners();
 }catch(error){
  log(error.toString());
 }
 
  
}


 Future<void> getDishCategories() async{

   
  restaurantrepository.getDishCategories().listen(
    (dishcategorystream){
      dishcategories = dishcategorystream;
      notifyListeners();
    }
    );
 }


 Future<Uint8List?> imagePicker() async{

  final imageresult = await restaurantrepository.imagePicker();
  final selectedimage = imageresult!.files.first.bytes;
  notifyListeners();
  return selectedimage;
}

Future<void> searchRestaurant({required Query}) async{
  
}
}