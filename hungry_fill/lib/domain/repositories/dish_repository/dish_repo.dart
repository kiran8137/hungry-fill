
import 'package:hungry_fill/data/dish_model/dish_model.dart';

abstract class DishRepository{

  Future<List<DishModel>> getDish({required String? resuerid});
}