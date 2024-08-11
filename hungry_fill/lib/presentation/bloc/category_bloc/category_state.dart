part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();
  
  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}


final class GetCategoriesSuccesState extends CategoryState{
  final List<CategoryModel> categories;
  final List<String> selectedcategories;

  const GetCategoriesSuccesState({required this.categories , required this.selectedcategories});

  @override
  // TODO: implement props
  List<Object> get props => [categories , selectedcategories];
}

final class CategorySelectSuccess extends CategoryState{
  final List<String> selectedcategory;

 const CategorySelectSuccess({required this.selectedcategory});

 @override
  // TODO: implement props
  List<Object> get props => [selectedcategory];
}
