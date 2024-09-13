import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hungry_fill/core/restaurant_and_dish/restaurant_and_dish.dart';
import 'package:hungry_fill/data/model/dish_category_model/dish_category_model.dart';
import 'package:hungry_fill/domain/repositories/dish_repository/dish_repo.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
   DishRepository dishrepository;
  FilterBloc({required this.dishrepository}) : super(FilterInitial()) {
    
    on<GetDishesCategoryFilterOptions>(getDishCategoryFilterOptions);
    on<GetFilteredDishes>(getFilteredDishes);

  }

  FutureOr<void> getDishCategoryFilterOptions(GetDishesCategoryFilterOptions event, Emitter<FilterState> emit) async{
     try{
      final result = await dishrepository.getDishesCategoryFilterOptionFromDb();
      emit(DishesCategoryFilterOptionSuccess(filteroptions: result));
    }catch(error){
      log(error.toString());
    }
  }

  FutureOr<void> getFilteredDishes(GetFilteredDishes event, Emitter<FilterState> emit) async{
     try{
      emit(FilterDishesInitial());
      final result = await dishrepository.getFilterDish(dishcategoryid: event.dishCategoryId);
      if(result.isEmpty){
        emit(FilterDishesEmpty());
      }else{
        emit(FilteredDishesSuccess(filtereddish: result));
      }
    debugPrint(result.toString());
    }catch(error){
      log(error.toString());
    }
  }
  }

