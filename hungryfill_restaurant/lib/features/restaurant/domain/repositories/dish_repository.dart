
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish/dish_model.dart';

abstract class DishRepository {
  

  Future<void> addDish({required DishModel dishmodel});

  Future<List<DishModel>> getDishes({required String? userid});
}