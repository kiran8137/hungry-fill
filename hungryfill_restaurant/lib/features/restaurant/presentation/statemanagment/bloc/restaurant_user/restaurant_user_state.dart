part of 'restaurant_user_bloc.dart';

sealed class RestaurantUserState extends Equatable {
  const RestaurantUserState();
  
  @override
  List<Object> get props => [];
}

final class RestaurantUserInitial extends RestaurantUserState {}

final class RestaurantDetailLoaded extends RestaurantUserState{

   final RestaurantModel restaurantmodel;

 const RestaurantDetailLoaded({required this.restaurantmodel});

 @override
   
  List<Object> get props => [restaurantmodel];
}

final class RestaurantUpdatedSucess extends RestaurantUserState{}

final class ErrorState extends RestaurantUserState{}

final class RestaurantAuthenticated extends RestaurantUserState{}

final class RestaurantUnAuthenticated extends RestaurantUserState{}
