import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/order/order_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/repository/order_repo/order_repo_impl.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrderRepoImpl orderRepository;
  OrdersBloc({required this.orderRepository}) : super(OrdersInitial()) {
     
     on<GetOrdersList>(getOrderList);
  }

  FutureOr<void> getOrderList(GetOrdersList event, Emitter<OrdersState> emit)async {
    try{
    emit(GetOrderListIntial());
      final result = await orderRepository.getOrdersListFromDb();
      if(result.isNotEmpty){
        emit(GetOrderListSuccess(orderList: result));
      }else{
        emit(GetOrdersListEmpty());
      }

    }catch(error){
      emit(GetOrdersListError());
      log(error.toString());
    }
  }
}
