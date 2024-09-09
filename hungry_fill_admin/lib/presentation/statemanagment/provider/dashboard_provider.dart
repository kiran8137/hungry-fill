
import 'package:flutter/material.dart';
import 'package:hungry_fill_admin/data/repository/dashboard_repo/dashboard_repo_impl.dart';

class DashboardProvider extends ChangeNotifier{
  DashBoardRepoImpl dashboardrepository;

  DashboardProvider({required this.dashboardrepository});


  String? totalUsers;
  String? totalOrders;
  String? totalRestaurant;

  Future<void> getUsersCount()async{
    final userCount = await dashboardrepository.getUsersCount();
    totalUsers = userCount.toString();
    notifyListeners();
    debugPrint(userCount.toString());
  }


  Future<void> getOrdersCount() async{
    final orderCount = await dashboardrepository.getTotalOrdersCount();
    totalOrders = orderCount.toString();
    notifyListeners();
  }

  Future<void> getRestaurantCount()async{
    final  result = await dashboardrepository.getRestaurantCount();
    totalRestaurant = result.toString();
    notifyListeners();
  }
}