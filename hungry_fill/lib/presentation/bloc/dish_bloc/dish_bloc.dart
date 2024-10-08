import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:hungry_fill/data/model/cart_model/cart_model.dart';

import 'package:hungry_fill/data/model/category_model/category_model.dart';
import 'package:hungry_fill/data/model/dish_model/dish_model.dart';
import 'package:hungry_fill/data/model/restaurant_model/restaurant_model.dart';
import 'package:hungry_fill/domain/repositories/cart_repository/cart_repository.dart';
import 'package:hungry_fill/domain/repositories/dish_repository/dish_repo.dart';
import 'package:hungry_fill/domain/repositories/restaurant_repository/restaurant_respository.dart';

part 'dish_event.dart';
part 'dish_state.dart';

class DishBloc extends Bloc<DishEvent, DishState> {
  DishRepository dishrepository;
  CartRepository cartrepositoy;
  RestaurantRepository restaurantepository;

  DishBloc(
      {required this.dishrepository,
      required this.cartrepositoy,
      required this.restaurantepository})
      : super(DishInitial()) {
    on<DishGetEvent>(getDish);
    on<SearchDishEvent>(searchDishes);
    //on<GetCategories>(getCategories);
    on<GetCategoryDish>(getCategoryDish);
    on<AddDishToCartEvent>(addDishToCart);
    // on<GetCartEvent>(getCart);
    on<GetRestaurantsInCart>(getRestaurantsInCart);
    //on<CartCalculationEvent>(getCartCalculation);
   

  }

  FutureOr<void> getDish(DishGetEvent event, Emitter<DishState> emit) async {
    emit(DishInitial());
    try {
      List<DishModel> dishes =
          await dishrepository.getDish(resuerid: event.resuserid);

      if (dishes.isNotEmpty) {
        emit(DishSuccesEvent(dish: dishes));
      } else if (dishes.isEmpty) {
        emit(DishEmpty());
      }
    } catch (error) {
      log(error.toString());
    }
  }

  FutureOr<void> searchDishes(
      SearchDishEvent event, Emitter<DishState> emit) async {

        List<DishModel> searchesDishes = [];
    try {
      List<DishModel> dishes = await dishrepository.searchDishes(
          query: event.dishname, userid: event.userid);
      
      if (dishes.isNotEmpty) {
        //searchesDishes = dishes.where((dish)=> dish.dishname!.toLowerCase().contains(event.dishname!.toLowerCase())).toList();
         emit(SearchDishSuccessState(dishes: dishes));
      } else {
        emit(SearchDishEmptyState());
      }
    } catch (error) {
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

  FutureOr<void> getCategoryDish(
      GetCategoryDish event, Emitter<DishState> emit) async {
    try {
      List<DishModel> categorydishes = await dishrepository.getCategoryDishes(
          categoryid: event.categoryid!, resuerid: event.resuerid!);
      if (categorydishes.isNotEmpty) {
        emit(CategoryDishesSuccesState(categorydishes: categorydishes));
      } else {
        emit(CategoryDisheseEmptyState());
      }
    } catch (error) {
      log(error.toString());
    }
  }

  FutureOr<void> addDishToCart(
      AddDishToCartEvent event, Emitter<DishState> emit) async {
    try {
      await cartrepositoy.addDishToCart(cartmodel: event.cart);
      //Navigator.push(event.context!, MaterialPageRoute(builder: (context)=> CartPage(restaurantid: event.restaurantid, restaurantname: event.restaurantname,)));
      emit(AddDishToCartSuccesState());
    } catch (error) {
      log(error.toString());
    }
  }

   

  FutureOr<void> getRestaurantsInCart(
      GetRestaurantsInCart event, Emitter<DishState> emit) async {
    List<RestaurantModel> restaurantsincart = [];
    try {
      final restaurantsidcart = await cartrepositoy.getRestaurantsInCart();
      debugPrint(restaurantsidcart.toString());
      for (var resid in restaurantsidcart) {
        restaurantsincart.add(await restaurantepository.getRestaurantUsingId(
            restaurantid: resid));
      }
      debugPrint(restaurantsincart.toString());
      if (restaurantsincart.isNotEmpty) {
        emit(GetRestaurantsInCartSuccess(restaurantsincart: restaurantsincart));
      } else {
        emit(GetRestaurantsInCartIsEmpty());
      }
    } catch (error) {
      log(error.toString());
    }
  }

  // FutureOr<void> getCartCalculation(CartCalculationEvent event, Emitter<DishState> emit) async {

  //   try{

  //     final cartcarttotal = await getcarttotal(userid: event.userid!, restaurantid: event.restuarantid);

  //     emit(CartCalculationSuccesState(carttotal: cartcarttotal));
  //   }catch(error){
  //     log(error.toString());
  //   }
  // }

  // FutureOr<void> getFilteredDishes(GetFilteredDishes event, Emitter<DishState> emit) async{
    

  //   try{
  //     emit(FilterDishesInitial());
  //     final result = await dishrepository.getFilterDish(dishcategoryid: event.dishCategoryId);
  //     if(result.isEmpty){
  //       emit(FilterDishesEmpty());
  //     }else{
  //       emit(FilteredDishesSuccess(filtereddish: result));
  //     }
  //   debugPrint(result.toString());
  //   }catch(error){
  //     log(error.toString());
  //   }
  // }
}
