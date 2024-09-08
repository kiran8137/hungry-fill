part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();
  
  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategorySuccessEvent extends CategoryState{
  final List<CategoryModel> categories;

 const CategorySuccessEvent({required this.categories});

 @override
   
  List<Object> get props => [categories];

  
}

// final class GetDishCategoriesIntial extends CategoryState{}

// final class GetDishCategoriesSuccess extends CategoryState{
//   final List<DishCategoryModel> dishcategories;

//   const GetDishCategoriesSuccess({required this.dishcategories});

//   @override
//   // TODO: implement props
//   List<Object> get props => [dishcategories];

// }