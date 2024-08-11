part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}


class GetCategories extends CategoryEvent{
  final String? resuerid;

    GetCategories({required this.resuerid});

  // TODO: implement props
  List<Object> get props => [resuerid!];
}


class CategorySelect extends CategoryEvent{
  final String? category;

const  CategorySelect({required this.category});

  @override
  // TODO: implement props
  List<Object> get props => [category!];
}


