import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/category/category_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/domain/repositories/dish_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  DishRepository dishrepository;
  CategoryBloc({required this.dishrepository}) : super(CategoryInitial()) {
    
     on<CreateCategoryEvent>(createCategory);
    on<GetCategoriesEvent>(getCategories);
  }

  FutureOr<void> createCategory(CreateCategoryEvent event, Emitter<CategoryState> emit) async {

     try{

      dishrepository.createCategory(categories: event.categorymodel);
    }catch(error){
      log(error.toString());
    }
  }

  FutureOr<void> getCategories(GetCategoriesEvent event, Emitter<CategoryState> emit) async{
     try{
     final categories = await dishrepository.getCategories();
     if(categories.isNotEmpty){
      emit(CategorySuccessEvent(categories: categories));
     }else{
      //emit(ErrorState(errormessage: 'categories are empty'));
     }
    }catch(error){
      log(" getcatbloc error ${error.toString()}");
    }
  }
}
