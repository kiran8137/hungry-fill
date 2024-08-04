part of 'restaurant_bloc.dart';

sealed class RestaurantState extends Equatable {
  const RestaurantState();
  
  @override
  List<Object> get props => [];
}

final class RestaurantInitial extends RestaurantState {}

final class GetRestaurantSuccessState extends RestaurantState{
  final List<RestaurantModel> restaurants ;

 const GetRestaurantSuccessState({required this.restaurants});
}

final class GetRestaurantsInWishListInitial extends RestaurantState{}

final class GetRestaurantsInWishListSucces extends RestaurantState{
  final List<RestaurantModel> wishlistrestaurant;

 const GetRestaurantsInWishListSucces({required this.wishlistrestaurant});

 @override
  
  List<Object> get props => [wishlistrestaurant];

  
}

final class GetRestaurantsInWishListErrorState extends RestaurantState{}

