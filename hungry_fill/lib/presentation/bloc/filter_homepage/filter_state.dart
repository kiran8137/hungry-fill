part of 'filter_bloc.dart';

sealed class FilterState extends Equatable {
  const FilterState();
  
  @override
  List<Object> get props => [];
}

final class FilterInitial extends FilterState {}
final class DishesCategoryFilterOptionSuccess extends FilterState{
  
  final List<DishCategoryModel> filteroptions;

const  DishesCategoryFilterOptionSuccess({required this.filteroptions});

@override
   
  List<Object> get props => [filteroptions];
  

}




//filter dishes 

class FilterDishesInitial extends FilterState{}
class FilteredDishesSuccess extends FilterState{
 final List<RestaurantAndDish> filtereddish;

 const FilteredDishesSuccess({required this.filtereddish});

 @override
  // TODO: implement props
  List<Object> get props => [filtereddish];
}

class FilterDishesEmpty extends FilterState{}

class FilterDishesError extends FilterState{}
