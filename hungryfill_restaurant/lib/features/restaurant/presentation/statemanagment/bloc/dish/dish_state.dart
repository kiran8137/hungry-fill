part of 'dish_bloc.dart';

sealed class DishState extends Equatable {
  const DishState();
  
  @override
  List<Object> get props => [];
}

final class DishInitial extends DishState {}


final class DishAddSuccuessState extends DishState{}

final class ErrorState extends DishState{}

final class GetDishesSuccessState extends DishState{
 final  List<DishModel> dishes;
 

const  GetDishesSuccessState({required this.dishes});

@override
  // TODO: implement props
  List<Object> get props => [dishes];


}

final class DeleteDishSuccesState extends DishState{}

final class DishImagPickerLoaded extends DishState{
 final PlatformFile? file;

 const DishImagPickerLoaded({this.file});
 
}