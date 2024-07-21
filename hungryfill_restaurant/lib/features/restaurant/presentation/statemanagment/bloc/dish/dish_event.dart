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

  
}


class DishImagePicker extends DishEvent{}