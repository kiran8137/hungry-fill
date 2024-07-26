import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:hungry_fill/data/dish_model/dish_model.dart';
import 'package:hungry_fill/domain/repositories/dish_repository/dish_repo.dart';

part 'dish_event.dart';
part 'dish_state.dart';

class DishBloc extends Bloc<DishEvent, DishState> {
  DishRepository dishrepository;
  DishBloc({required this.dishrepository}) : super(DishInitial()) {
     
     on<DishGetEvent>(getDish);
  }

  FutureOr<void> getDish(DishGetEvent event, Emitter<DishState> emit) async{

    try{

      List<DishModel> dishes = await dishrepository.getDish(resuerid: event.resuserid);
      if(dishes.isNotEmpty){
        emit(DishSuccesEvent(dish: dishes));
      }else{
        emit(DishErrorState());
      }

    }catch(error){
      log(error.toString());
      
    }
  }
}
