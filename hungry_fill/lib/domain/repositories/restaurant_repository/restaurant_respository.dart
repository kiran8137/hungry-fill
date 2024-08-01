import 'package:hungry_fill/data/model/restaurant_model/restaurant_model.dart';

abstract class RestaurantRepository{

  Future<List<RestaurantModel>> getRestaurants();
}