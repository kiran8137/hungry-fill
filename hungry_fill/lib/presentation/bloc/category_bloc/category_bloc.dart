import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry_fill/data/model/category_model/category_model.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';
import 'package:hungry_fill/domain/repositories/dish_repository/dish_repo.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  DishRepository dishrepository;
  CategoryBloc({required this.dishrepository}) : super(CategoryInitial()) {
     
     on<GetCategories>(getCategories);



  }

  FutureOr<void> getCategories(GetCategories event, Emitter<CategoryState> emit) async {
       try{

      List<CategoryModel> categories = await dishrepository.getCategories(resuerid: event.resuerid!);
      emit(GetCategoriesSuccesState(categories: categories));

    }catch(error){
      log(error.toString());
    }
  }
}
