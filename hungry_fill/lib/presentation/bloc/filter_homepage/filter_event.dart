part of 'filter_bloc.dart';

sealed class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class GetDishesCategoryFilterOptions extends FilterEvent{}

class GetFilteredDishes extends FilterEvent{
  final String dishCategoryId;

  const GetFilteredDishes({required this.dishCategoryId});

  @override
   
  List<Object> get props => [dishCategoryId];
}