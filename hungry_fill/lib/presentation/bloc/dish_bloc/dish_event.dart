part of 'dish_bloc.dart';

sealed class DishEvent extends Equatable {
  const DishEvent();

  @override
  List<Object> get props => [];
}

//Dish Events
class DishGetInitial extends DishEvent {}

class DishGetEvent extends DishEvent {
  final String? resuserid;

  const DishGetEvent({required this.resuserid});

  @override
  List<Object> get props => [resuserid!];
}

class SearchDishEvent extends DishEvent {
  final String? dishname;
  final String? userid;

  const SearchDishEvent({required this.dishname, required this.userid});

  @override
  List<Object> get props => [dishname!];
}

class GetCategoryDish extends DishEvent {
  final String? categoryid;
  final String? resuerid;

  const GetCategoryDish({required this.categoryid, required this.resuerid});

  @override
  List<Object> get props => [categoryid!];
}

//Cart Events

class GetRestaurantsInCart extends DishEvent {}

class AddDishToCartEvent extends DishEvent {
  // final String? restaurantid;
  // final List<String>? items;
  // final BuildContext? context;
  // final String? restaurantname;
  final CartModel cart;

  const AddDishToCartEvent({required this.cart});

  @override
  List<Object> get props => [cart];
}

class GetDishInCartEvent extends DishEvent {
  final String? restaurantid;

  const GetDishInCartEvent({required this.restaurantid});

  @override
  List<Object> get props => [restaurantid!];
}
