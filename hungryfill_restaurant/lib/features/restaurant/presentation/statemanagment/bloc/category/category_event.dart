part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}


class CreateCategoryEvent extends CategoryEvent{

 final List<CategoryModel> categorymodel;

 const  CreateCategoryEvent({required this.categorymodel});

 @override
   
  List<Object> get props => [categorymodel];
}


class GetCategoriesEvent extends CategoryEvent{}


//class GetDishCategoriesEvent extends CategoryEvent{}