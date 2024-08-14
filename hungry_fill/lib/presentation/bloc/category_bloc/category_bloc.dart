import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry_fill/data/model/category_model/category_model.dart';
import 'package:hungry_fill/domain/repositories/dish_repository/dish_repo.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  DishRepository dishrepository;
  CategoryBloc({required this.dishrepository}) : super(CategoryInitial()) {
     
     on<GetCategories>(getCategories);
     on<CategorySelect>(categorySelect);



  }

  FutureOr<void> getCategories(GetCategories event, Emitter<CategoryState> emit) async {
       try{

      List<CategoryModel> categories = await dishrepository.getCategories(resuerid: event.resuerid!);
      emit(GetCategoriesSuccesState(categories: categories , selectedcategories: []));

    }catch(error){
      log(error.toString());
    }
  }

  FutureOr<void> categorySelect(CategorySelect event, Emitter<CategoryState> emit) async{

      if(state is GetCategoriesSuccesState){
        final currentstate = state as GetCategoriesSuccesState;
        List<String> selectedcategories = List.from(currentstate.selectedcategories);
        if(selectedcategories.contains(event.category)){
          selectedcategories.remove(event.category);
        }else{
          selectedcategories.add(event.category!);
        }
        emit(GetCategoriesSuccesState(categories: currentstate.categories, selectedcategories: selectedcategories));
      }
  }
}
