part of 'dish_bloc.dart';

sealed class DishEvent extends Equatable {
  const DishEvent();

  @override
  List<Object> get props => [];
}

class DishAddEvent extends DishEvent {

  final DishModel dishmodel;

 const DishAddEvent({required this.dishmodel});

  @override
  // TODO: implement props
  List<Object> get props => [dishmodel];
}


class DishUpdateEvent extends DishEvent{

  final DishModel updatedDish;

 const DishUpdateEvent({required this.updatedDish});

 @override
  // TODO: implement props
  List<Object> get props => [updatedDish];
  
}

class GetDishesEvent extends DishEvent{}

class DeleteDishEvent extends DishEvent{
  final String? dishid;

 const DeleteDishEvent({required this.dishid});

 @override
  // TODO: implement props
  List<Object> get props => [dishid!];

  
}


class DishImagePicker extends DishEvent{}

class CreateCategoryEvent extends DishEvent{

 final List<CategoryModel> categorymodel;

 const  CreateCategoryEvent({required this.categorymodel});

 @override
  // TODO: implement props
  List<Object> get props => [categorymodel];
}


class GetCategoriesEvent extends DishEvent{}