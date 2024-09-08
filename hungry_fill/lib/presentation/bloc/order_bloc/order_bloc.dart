import 'dart:async';
import 'dart:developer';
 

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
import 'package:hungry_fill/data/model/order_model/order_model.dart';
 
import 'package:hungry_fill/domain/repositories/order_repository/order_repository.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderRepository orderrepositoy; 
  OrderBloc({required this.orderrepositoy}) : super(OrderInitial()) {
     
     on<GetCartInCheckOut>(getCartInChecKOut);
     on<PlaceOrder>(placeOrder);
     on<GetOrderDetailsEvent>(getOrderDetail);
     on<CancelOrderEvent>(cancelOrder);

  }

  FutureOr<void> getCartInChecKOut(GetCartInCheckOut event, Emitter<OrderState> emit) async{
  emit(GetCartInCheckOutInitial());
    try{
      final cartresult = await orderrepositoy.getCartInCheckOut(restaurantid: event.restaurantid);
      emit(GetCartInCheckOutSuccess(cartmodel: cartresult));
    }catch(error){
      log(error.toString());
    }
  }

  FutureOr<void> placeOrder(PlaceOrder event, Emitter<OrderState> emit) async {
    try{
      orderrepositoy.placeOrder(order: event.order, restaurantId: event.restaurantId , addressId: event.addressid);
      emit(PlaceOrderSuccess());
        
    }catch(error){
      log(error.toString());
    }
  }

  FutureOr<void> getOrderDetail(GetOrderDetailsEvent event, Emitter<OrderState> emit) async {

    emit(GetOrderDetailsInitial());
    try{
      final result =await orderrepositoy.getOrderDetails();
      if(result.isEmpty){
        emit(GetOrderDetailsEmpty());
      }else{
        emit(GetOrderDetailsSuccess(orderslist: result));
      }

    }catch(error){
      emit(GetOrderDetailsError());
      log(error.toString());
    }
  }

  FutureOr<void> cancelOrder(CancelOrderEvent event, Emitter<OrderState> emit)async{
    emit(CancelOrderInitial());
    try{
      await orderrepositoy.cancelOrder(orderId: event.orderId);
      emit(CancelOrderSuccess());
    }catch(error){
      log(error.toString());
    }
  }
}
