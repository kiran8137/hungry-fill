import 'package:file_picker/file_picker.dart';
import 'package:hungry_fill_admin/data/models/category_model.dart';
import 'package:hungry_fill_admin/data/models/dish_category_model.dart';
import 'package:hungry_fill_admin/data/models/restaurant_model.dart';

abstract class RestaurantRespository {
 
   Future<List<RestaurantModel>> getRestaurants();
   Future<void> createCategory({required String category});
   Stream<List<CategoryModel>> getCategories();

   Future<void> deleteCategory({required String categoryid});

   Future<void> updateCategory({required CategoryModel category});

   Future<FilePickerResult?> imagePicker();

  //dish wise category
   Future<void> createDishCategory({required String dishcategory ,required String dishcategoryimgeurl});

   Stream<List<DishCategoryModel>> getDishCategories();

   Future<void> deleteDishCategory({required String dishcategoryid});

   Future<void> updateDishCategory({required CategoryModel dishcategory});

}