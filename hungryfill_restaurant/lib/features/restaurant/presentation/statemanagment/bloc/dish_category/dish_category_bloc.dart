import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish_category/dish_category_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/domain/repositories/dish_repository.dart';

part 'dish_category_event.dart';
part 'dish_category_state.dart';

class DishCategoryBloc extends Bloc<DishCategoryEvent, DishCategoryState> {
   DishRepository dishrepository;
  DishCategoryBloc({required this.dishrepository}) : super(DishCategoryInitial()) {
     
     on<GetDishCategoriesEvent>(getDishCategories);
  }

  FutureOr<void> getDishCategories(GetDishCategoriesEvent event, Emitter<DishCategoryState> emit) async {

     emit(DishCategoryInitial());
    try{
      final dishcategories = await dishrepository.getDishCategories();
      emit(GetDishCategoriesSuccess(dishcategories: dishcategories));
      debugPrint(dishcategories.toString());
      debugPrint('emitting GetDishCategoriesSuccesss');
    }catch(error){
      log(error.toString());
    }
  }
}
