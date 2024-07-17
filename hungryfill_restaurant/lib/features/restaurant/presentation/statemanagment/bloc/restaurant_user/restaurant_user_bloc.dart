import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/res_user/res_user_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/domain/repositories/res_user_repository.dart';

part 'restaurant_user_event.dart';
part 'restaurant_user_state.dart';

class RestaurantUserBloc extends Bloc<RestaurantUserEvent, RestaurantUserState> {
  RestaurantUserRepository restaurantuserrepository;
  RestaurantUserBloc({ required this.restaurantuserrepository}) : super(RestaurantUserInitial()) {
    
      on<GetRestaurantDetailEvent>(getRestaurantDetails);
      on<RestuarantLoggedStatusEvent>(getRestaurantLoggedStatus);
      on<UpdateRestaurantEvent>(updateRestaurantDetail);


  }

  

  FutureOr<void> getRestaurantDetails(GetRestaurantDetailEvent event, Emitter<RestaurantUserState> emit) async {

    try{
      RestaurantModel? restaurantmodel = await restaurantuserrepository.getRestaurantDetails(userid: FirebaseAuth.instance.currentUser!.uid);
      if(restaurantmodel!=null){
        emit(RestaurantDetailLoaded(restaurantmodel: restaurantmodel));
      }else{
        log("No user");
      }


    }catch(error){
      log(error.toString());
    }
  }

  FutureOr<void> getRestaurantLoggedStatus(RestuarantLoggedStatusEvent event, Emitter<RestaurantUserState> emit) async{

    try{
      bool loggedstatus = await restaurantuserrepository.getRestaurantLoggedStatus();
      if(loggedstatus == true){
        emit(RestaurantAuthenticated());
      }else{
        emit(RestaurantUnAuthenticated());
      }
    }catch(error){
      log(error.toString());
    }
  }

  FutureOr<void> updateRestaurantDetail(UpdateRestaurantEvent event, Emitter<RestaurantUserState> emit) async{
    try{
      RestaurantModel user = event.updatedrestaurantdetail.copywith(
       
        restaurantname: event.updatedrestaurantdetail.restaurantname,
        restaurantmobileNo: event.updatedrestaurantdetail.restaurantmobileNo,
        restaurantstate: event.updatedrestaurantdetail.restaurantstate,
        restaurantdistrict: event.updatedrestaurantdetail.restaurantdistrict,
        restaurantplace: event.updatedrestaurantdetail.restaurantplace,

      );
      restaurantuserrepository.updateRestaurantDetails(restaurantmodel: user);
      emit(RestaurantUpdatedSucess());
    }
    catch(error){
      log(error.toString());
    }
  }
}
