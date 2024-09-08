part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();
  
  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

final class GetCartInCheckOutInitial extends OrderState{}

final class GetCartInCheckOutSuccess extends OrderState{
  final List<CartModel> cartmodel;
  const GetCartInCheckOutSuccess({required this.cartmodel});

  @override
   
  List<Object> get props => [cartmodel];
}

final class GetCartInCheckOutError extends OrderState{}


final class PlaceOrderSuccess extends OrderState{}


//getordersinitial
final class GetOrderDetailsInitial extends OrderState{}

//getorderssucess
final class GetOrderDetailsSuccess extends OrderState{
  final List<OrderModel> orderslist;

const  GetOrderDetailsSuccess({required this.orderslist});

  @override
  
  List<Object> get props => [orderslist];
}
//getordersempty
final class GetOrderDetailsEmpty extends OrderState{}

//getorderserror
final class GetOrderDetailsError extends OrderState{}


//cancel orderinital
final class CancelOrderInitial extends OrderState{}

//cancel ordersucces
final class CancelOrderSuccess extends OrderState{}