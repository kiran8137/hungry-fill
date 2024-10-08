
 

import 'package:file_picker/file_picker.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/category/category_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish/dish_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish_category/dish_category_model.dart';

abstract class DishRepository {
  

  Future<bool> addDish({required DishModel dishmodel});

  Stream<List<DishModel>> getDishes({required String? userid});

  Future<void> deleteDish({required String? dishid});

  Future<void> updateDish({required DishModel dish});


  Future<FilePickerResult?> ImagePicker();

  


  Future<void> createCategory({required List<CategoryModel> categories});

  Future<List<CategoryModel>> getCategories();

  Future<List<DishCategoryModel>> getDishCategories();
}