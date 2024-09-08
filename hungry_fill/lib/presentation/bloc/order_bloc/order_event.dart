part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class GetCartInCheckOut extends OrderEvent{
  final String restaurantid;

  const GetCartInCheckOut({required this.restaurantid});

  @override
   
  List<Object> get props => [restaurantid];
}


class PlaceOrder extends OrderEvent{
  final OrderModel order;
  final String restaurantId;
  final String addressid;

 const  PlaceOrder({required this.order, required this.restaurantId , required this.addressid});

 @override
  
  List<Object> get props => [order , restaurantId , addressid];
  
}

class GetOrderDetailsEvent extends OrderEvent{}

class CancelOrderEvent extends OrderEvent{
 final String orderId ;

  const CancelOrderEvent({required this.orderId});

  @override
  // TODO: implement props
  List<Object> get props => [orderId];
}
