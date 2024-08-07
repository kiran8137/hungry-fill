part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();
  
  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}


final class GetCategoriesSuccesState extends CategoryState{
  final List<CategoryModel> categories;

  const GetCategoriesSuccesState({required this.categories});

  @override
  // TODO: implement props
  List<Object> get props => [categories];
}
