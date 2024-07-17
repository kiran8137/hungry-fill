import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry_fill/data/restaurant_model/restaurant_model.dart';
import 'package:hungry_fill/domain/repositories/restaurant_repository/restaurant_respository.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantRepository restaurantrepository;
  RestaurantBloc({required this.restaurantrepository}) : super(RestaurantInitial()) {
     
    on<RestaurantEvent>(getRestuarants);
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
}
