part of 'dish_category_bloc.dart';

sealed class DishCategoryEvent extends Equatable {
  const DishCategoryEvent();

  @override
  List<Object> get props => [];
}


class GetDishCategoriesEvent extends DishCategoryEvent{}