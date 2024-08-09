import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
 
import 'package:hungry_fill/data/model/category_model/category_model.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';
import 'package:hungry_fill/domain/repositories/cart_repository/cart_repository.dart';
import 'package:hungry_fill/domain/repositories/dish_repository/dish_repo.dart';
 

part 'dish_event.dart';
part 'dish_state.dart';

class DishBloc extends Bloc<DishEvent, DishState> {
  DishRepository dishrepository;
  CartRepository cartrepositoy;

  DishBloc({required this.dishrepository , required this.cartrepositoy}) : super(DishInitial()) {
     
     
     on<DishGetEvent>(getDish);
     on<SearchDishEvent>(searchDishes);
     //on<GetCategories>(getCategories);
     on<GetCategoryDish>(getCategoryDish);
     //on<AddDishToCartEvent>(addDishToCart);
     //on<GetDishInCartEvent>(getDishInCart);
     on<GetRestaurantsInCart>(getRestaurantsInCart);
  }

  FutureOr<void> getDish(DishGetEvent event, Emitter<DishState> emit) async {

    try{

      List<DishModel> dishes = await dishrepository.getDish(resuerid: event.resuserid);
       
      if(dishes.isNotEmpty){
        emit(DishSuccesEvent(dish: dishes));
      }else{
        
        emit(const DishErrorState(errormessage: "no dishes available"));
      }
     emit(DishSuccesEvent(dish: dishes));

    }catch(error){
      log(error.toString());
      
    }
  }

  FutureOr<void> searchDishes(SearchDishEvent event, Emitter<DishState> emit) async {

    try{

      List<DishModel> dishes = await dishrepository.searchDishes(query: event.dishname, userid: event.userid);
      emit(SearchDishSuccessState(dishes: dishes));

    }catch(error){
      log(error.toString());
    }
  }

  // FutureOr<void> getCategories(GetCategories event, Emitter<DishState> emit) async{
  //   try{

  //     List<CategoryModel> categories = await dishrepository.getCategories(resuerid: event.resuerid!);
  //     emit(GetCategoriesSuccessState(categories: categories));

  //   }catch(error){
  //     log(error.toString());
  //   }
  // }

  FutureOr<void> getCategoryDish(GetCategoryDish event, Emitter<DishState> emit) async{

    try{

      List<DishModel> categorydishes = await dishrepository.getCategoryDishes(categoryid: event.categoryid!, resuerid: event.resuerid!);
      emit(CategoryDishesSuccesState(categorydishes: categorydishes));
    }catch(error){
      log(error.toString());
    }
  }

  // FutureOr<void> addDishToCart(AddDishToCartEvent event, Emitter<DishState> emit) async{
  //   try{
      
  //     await cartrepositoy.addDishToCart(cartmodel: event.cart);
  //      //Navigator.push(event.context!, MaterialPageRoute(builder: (context)=> CartPage(restaurantid: event.restaurantid, restaurantname: event.restaurantname,)));
  //     emit(AddDishToCartSuccesState());
  //   }catch(error){
      
  //     log(error.toString());
  //   }
  // }

  // FutureOr<void> getDishInCart(GetDishInCartEvent event, Emitter<DishState> emit) async{
  //   print("getdishincart event trggerd");
  //   print("${event.runtimeType}");


  //   emit(GetDishInCartInital());
  //   try{

  //     List<DishModel> cartdishes = await cartrepositoy.getDishInCart(restaurantid: event.restaurantid!);
  //     print(cartdishes);
  //     if(cartdishes.isNotEmpty){
  //       print('emitted GetDishInCartSuccessState');
  //       emit(GetDishInCartSuccessState(cartdishes: cartdishes));
  //     }else{
  //       print('emitted GetDishInCartErrorState');
        
  //       emit(GetDishInCartErrorState());
  //     }


  //   }catch(error){
  //     log(error.toString());
  //   }
  // }

  FutureOr<void> getRestaurantsInCart(GetRestaurantsInCart event, Emitter<DishState> emit) async {
     
    try{
      
    }catch(error){
      log(error.toString());
    }
  }
}
