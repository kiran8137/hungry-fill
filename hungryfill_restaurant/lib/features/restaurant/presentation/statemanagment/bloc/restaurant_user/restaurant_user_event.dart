part of 'restaurant_user_bloc.dart';

sealed class RestaurantUserEvent extends Equatable {
  const RestaurantUserEvent();

  @override
  List<Object> get props => [];
}


class GetRestaurantDetailEvent extends RestaurantUserEvent{}

class UpdateRestaurantEvent extends RestaurantUserEvent{

  final RestaurantModel updatedrestaurantdetail;

 const  UpdateRestaurantEvent({required this.updatedrestaurantdetail});

 @override
   
  List<Object> get props => [updatedrestaurantdetail];

  
}

class RestuarantLoggedStatusEvent extends RestaurantUserEvent{}

 
