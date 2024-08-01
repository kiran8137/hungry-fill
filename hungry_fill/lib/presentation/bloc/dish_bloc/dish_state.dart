part of 'dish_bloc.dart';

sealed class DishState extends Equatable {
  const DishState();
  
  @override
  List<Object> get props => [];
}

final class DishInitial extends DishState {}

final class DishSuccesEvent extends DishState{
  final List<DishModel> dish;


  const DishSuccesEvent({required this.dish});

  @override
  // TODO: implement props
  List<Object> get props => [dish];
}

final class DishErrorState extends DishState{
  final String? errormessage;

 const DishErrorState({this.errormessage});

 @override
  // TODO: implement props
  List<Object> get props => [errormessage!];
}

final class SearchDishSuccessState extends DishState{
  final List<DishModel> dishes;

  const SearchDishSuccessState({required this.dishes});

  @override
  // TODO: implement props
  List<Object> get props => [dishes];
}


final class GetCategoriesSuccessState extends DishState{
  final List<CategoryModel> categories;

  const GetCategoriesSuccessState({required this.categories});

  @override
  // TODO: implement props
  List<Object> get props => [categories];
}



final class GetCategoriesErrorState extends DishState{}


final class CategoryDishesSuccesState extends DishState{
  final List<DishModel> categorydishes;

  const CategoryDishesSuccesState({required this.categorydishes});

  @override
  // TODO: implement props
  List<Object> get props => [categorydishes];
}


final class AddDishToCartInitial extends DishState{}

final class GetDishInCartInital extends DishState{}

final class AddDishToCartSuccesState extends DishState{}

 

final class GetDishInCartSuccessState extends DishState{
  final List<DishModel> cartdishes;

  const GetDishInCartSuccessState({required this.cartdishes});

  @override
  // TODO: implement props
  List<Object> get props => [cartdishes];
}


final class AddDishToCartErrorState extends DishState{}

final class GetDishInCartErrorState extends DishState{}


