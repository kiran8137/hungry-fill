import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry_fill/data/model/restaurant_model/restaurant_model.dart';
import 'package:hungry_fill/data/repository/restaurant_repo_impl/restaurant_repo_imp.dart';
import 'package:hungry_fill/domain/repositories/restaurant_repository/restaurant_respository.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantRepository restaurantrepository;
  RestaurantBloc({required this.restaurantrepository}) : super(RestaurantInitial()) {
     
    on<RestaurantEvent>(getRestuarants);
    on<AddRestaurantToWishList>(addRestaurantToWishList);
    on<GetRestaurantsInWishList>(getRestaurantInWishList);
  }




  FutureOr<void> getRestuarants(RestaurantEvent event, Emitter<RestaurantState> emit) async{
  
  try{
   List<RestaurantModel> restaurants = await restaurantrepository.getRestaurants();
   if(restaurants.isNotEmpty){
    emit(GetRestaurantSuccessState(restaurants: restaurants));
   } 
  }catch(error){
    log(error.toString());
  }

  }

  FutureOr<void> addRestaurantToWishList(AddRestaurantToWishList event, Emitter<RestaurantState> emit) async{
    try{

      await restaurantrepository.addRestaurantToWishList(restaurantid: event.restaurantid);

    }catch(error){
      log(error.toString());
    }
  }

  FutureOr<void> getRestaurantInWishList(GetRestaurantsInWishList event, Emitter<RestaurantState> emit) async{

    emit(GetRestaurantsInWishListInitial());
    try{
      

      final restaurantwishlist = await restaurantrepository.getRestaurantInWishList();
       
      final List<RestaurantModel>restaurants = [];

      for(var i in restaurantwishlist){
      var restaurantwishlist = await restaurantrepository.getRestaurantUsingId(restaurantid: i);
       restaurants.add(restaurantwishlist);
      }

      print(restaurants);

      if(restaurants.isNotEmpty){
        emit(GetRestaurantsInWishListSucces(wishlistrestaurant: restaurants));
      }else{
        emit(GetRestaurantsInWishListErrorState());
      }

    }catch(error){
      log(error.toString());
    }
  }
}
