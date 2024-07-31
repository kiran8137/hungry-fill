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

  DishErrorState({this.errormessage});
}

final class SearchDishSuccessState extends DishState{
  final List<DishModel> dishes;

  const SearchDishSuccessState({required this.dishes});

  @override
  // TODO: implement props
  List<Object> get props => [dishes];
}