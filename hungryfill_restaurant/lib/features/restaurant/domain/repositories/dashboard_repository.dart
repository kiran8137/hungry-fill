
abstract class DashBoardRepository{

  Future<int> getDishesCount();
  Future<int> getTotalOrdersCount();
  Future<int> calculateTodaysRevenue();
  Future<int> calculateTotalEarnings();
  // Future<int> getRestaurantCount(); 
}