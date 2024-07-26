part of 'dish_bloc.dart';

sealed class DishEvent extends Equatable {
  const DishEvent();




  @override
  List<Object> get props => [];
}

class DishGetInitial extends DishEvent{}

class DishGetEvent extends DishEvent{
  final String? resuserid;
  
  const DishGetEvent({required this.resuserid});

  @override
  // TODO: implement props
  List<Object> get props => [resuserid!];
}


 