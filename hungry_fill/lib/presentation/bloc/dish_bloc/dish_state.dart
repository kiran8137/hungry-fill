part of 'dish_bloc.dart';

sealed class DishState extends Equatable {
  const DishState();

  @override
  List<Object> get props => [];
}

//Dish States

final class DishInitial extends DishState {}

final class DishSuccesEvent extends DishState {
  final List<DishModel> dish;

  const DishSuccesEvent({required this.dish});

  @override
  List<Object> get props => [dish];
}

final class DishErrorState extends DishState {
  final String? errormessage;

  const DishErrorState({this.errormessage});

  @override
  List<Object> get props => [errormessage!];
}

//Search States

final class SearchDishSuccessState extends DishState {
  final List<DishModel> dishes;

  const SearchDishSuccessState({required this.dishes});

  @override
  List<Object> get props => [dishes];
}

// Category filter States

final class GetCategoriesSuccessState extends DishState {
  final List<CategoryModel> categories;

  const GetCategoriesSuccessState({required this.categories});

  @override
  List<Object> get props => [categories];
}

final class GetCategoriesErrorState extends DishState {}

final class CategoryDishesSuccesState extends DishState {
  final List<DishModel> categorydishes;

  const CategoryDishesSuccesState({required this.categorydishes});

  @override
  List<Object> get props => [categorydishes];
}

//Cart States

final class AddDishToCartInitial extends DishState {}

final class GetDishInCartInital extends DishState {}

final class AddDishToCartSuccesState extends DishState {}

final class GetDishInCartSuccessState extends DishState {
  final List<DishModel> cartdishes;

  const GetDishInCartSuccessState({required this.cartdishes});

  @override
  // TODO: implement props
  List<Object> get props => [cartdishes];
}

final class AddDishToCartErrorState extends DishState {}

final class GetDishInCartErrorState extends DishState {}

//Cart States

final class GetRestaurantsInCartInital extends DishState {}

final class GetRestaurantsInCartSuccess extends DishState {
  
}

final class GetRestaurantsInCartIsEmpty extends DishState {}
