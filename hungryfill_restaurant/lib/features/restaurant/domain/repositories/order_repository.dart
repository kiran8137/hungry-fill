 
import 'package:hungryfill_restaurant/features/restaurant/data/model/order/order_model.dart';

abstract class OrderRepository{

  Future<List<OrderModel>> getOrdersListFromDb();
}