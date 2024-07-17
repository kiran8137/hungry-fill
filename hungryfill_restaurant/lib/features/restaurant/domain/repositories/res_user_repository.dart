
import 'package:hungryfill_restaurant/features/restaurant/data/model/res_user/res_user_model.dart';

abstract class RestaurantUserRepository{

  Future<void> saveRestaurantToDb({
    required RestaurantModel restaurantmodel
  });

  Future<RestaurantModel?> getRestaurantDetails({
    required String userid
  });

  Future<void> setRestaurantLoggedStatus({
    required bool isLoggedin
  });

  Future<bool> getRestaurantLoggedStatus();

  Future<void> updateRestaurantDetails({
    required RestaurantModel restaurantmodel
  });


}