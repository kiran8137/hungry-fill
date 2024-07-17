import 'package:hungry_fill/data/restaurant_model/restaurant_model.dart';

abstract class RestaurantRepository{

  Future<List<RestaurantModel>> getRestaurants();
}