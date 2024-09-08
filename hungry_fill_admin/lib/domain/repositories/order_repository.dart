import 'package:hungry_fill_admin/data/models/orders_model.dart';

abstract class OrderRepository{

  Future<List<OrderModel>> getOrdersListFromDb();
}