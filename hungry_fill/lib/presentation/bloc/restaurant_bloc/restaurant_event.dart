part of 'restaurant_bloc.dart';

sealed class RestaurantEvent extends Equatable {
  const RestaurantEvent();

  @override
  List<Object> get props => [];
}


class GetRestaurantsEvent extends RestaurantEvent{}

class AddRestaurantToWishList extends RestaurantEvent{
  final String restaurantid;

  const AddRestaurantToWishList({required this.restaurantid});

  @override
 
  List<Object> get props => [restaurantid];
}

class GetRestaurantsInWishList extends RestaurantEvent{}

class RemoveRestaurantInWishList extends RestaurantEvent{
  final String restaurantid;

 const RemoveRestaurantInWishList({required this.restaurantid});

 @override
  
  List<Object> get props => [restaurantid];

  
}

class SearchRestaurantEvent extends RestaurantEvent {
  final String restaurantName;

const  SearchRestaurantEvent({required this.restaurantName});

@override
  // TODO: implement props
  List<Object> get props => [restaurantName];
  
}