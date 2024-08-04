part of 'dish_bloc.dart';

sealed class DishEvent extends Equatable {
  const DishEvent();




  @override
  List<Object> get props => [];
}

class DishGetInitial extends DishEvent{}

class DishGetEvent extends DishEvent{
  final String? resuserid;
  
  const DishGetEvent({required this.resuserid});

  @override
  // TODO: implement props
  List<Object> get props => [resuserid!];
}


class SearchDishEvent extends DishEvent{
  final String? dishname;
  final String? userid;

  const SearchDishEvent({required this.dishname , required this.userid});

  @override
  // TODO: implement props
  List<Object> get props => [dishname!];


}


class GetCategories extends DishEvent{
  final String? resuerid;

  const GetCategories({required this.resuerid});

  @override
  // TODO: implement props
  List<Object> get props => [resuerid!];
}

class GetCategoryDish extends DishEvent{
  final String? categoryid;
  final String? resuerid;

  const GetCategoryDish({required this.categoryid , required this.resuerid});

  @override
  // TODO: implement props
  List<Object> get props => [categoryid!];
}


class AddDishToCartEvent extends DishEvent{

  final String? restaurantid;
  final List<String>? items;
  final BuildContext? context;
  final String? restaurantname;

  const AddDishToCartEvent({this.context, this.restaurantname, required this.restaurantid, required this.items});

  @override
  // TODO: implement props
  List<Object> get props => [restaurantid! , items! ];
  
   
}


class GetDishInCartEvent extends DishEvent{
  final String? restaurantid;
  

  const GetDishInCartEvent({required this.restaurantid});

  @override
   
  List<Object> get props => [restaurantid!];
}


 