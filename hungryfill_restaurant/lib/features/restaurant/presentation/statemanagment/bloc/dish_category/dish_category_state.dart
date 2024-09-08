part of 'dish_category_bloc.dart';

sealed class DishCategoryState extends Equatable {
  const DishCategoryState();
  
  @override
  List<Object> get props => [];
}

final class DishCategoryInitial extends DishCategoryState {}

final class GetDishCategoriesSuccess extends DishCategoryState{
  final List<DishCategoryModel> dishcategories;

  const GetDishCategoriesSuccess({required this.dishcategories});

  @override
  
  List<Object> get props => [dishcategories];
}
