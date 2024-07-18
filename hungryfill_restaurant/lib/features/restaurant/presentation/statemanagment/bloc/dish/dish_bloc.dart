import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish/dish_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/domain/repositories/dish_repository.dart';

part 'dish_event.dart';
part 'dish_state.dart';

class DishBloc extends Bloc<DishEvent, DishState> {

  DishRepository dishrepository;
  DishBloc({required this.dishrepository}) : super(DishInitial()) {
    
    on<DishAddEvent>(addDish);
    on<GetDishesEvent>(getDishes);
    on<DeleteDishEvent>(deleteDish);
    on<DishUpdateEvent>(updateDish);
  }

  FutureOr<void> addDish(DishAddEvent event, Emitter<DishState> emit) async {

    try{
      await dishrepository.addDish(dishmodel: event.dishmodel);
      emit(DishAddSuccuessState());
    }catch(error){
      log(error.toString());
    }
  }




  FutureOr<void> getDishes(GetDishesEvent event, Emitter<DishState> emit) async{
    try{

      List<DishModel> dishes = await dishrepository.getDishes(userid: FirebaseAuth.instance.currentUser?.uid);
      if(dishes.isNotEmpty){
        for(var i in dishes){
          print(i);
        }
        emit(GetDishesSuccessState(dishes: dishes));
      }else{
        emit(ErrorState());
        log("no food items found");
      }
      

    }catch(error){
      log(error.toString());
    }
  }

  FutureOr<void> deleteDish(DeleteDishEvent event, Emitter<DishState> emit) async{
    try{
      await dishrepository.deleteDish(dishid: event.dishid);
    }
    catch(error){

        log(error.toString());
    }
  }




  FutureOr<void> updateDish(DishUpdateEvent event, Emitter<DishState> emit) async{
    try{

      DishModel dish = event.updatedDish.copywith(
        dishid: event.updatedDish.dishid,
        dishname: event.updatedDish.dishname,
        dishprice: event.updatedDish.dishprice,
        stock: event.updatedDish.stock,
        serve: event.updatedDish.serve,
        category: event.updatedDish.category
      );

      await dishrepository.updateDish(dish: dish);

    }catch(error){
      log(error.toString());
    }
  }
}
