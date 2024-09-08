part of 'orders_bloc.dart';

sealed class OrdersState extends Equatable {
  const OrdersState();
  
  @override
  List<Object> get props => [];
}

final class OrdersInitial extends OrdersState {}

final class GetOrderListIntial extends OrdersState{}

final class GetOrderListSuccess extends OrdersState{
   final List<OrderModel> orderList;

  const GetOrderListSuccess({required this.orderList});
@override
  // TODO: implement props
  List<Object> get props => [orderList];

}

final class GetOrdersListEmpty extends OrdersState{}

final class GetOrdersListError extends OrdersState{}