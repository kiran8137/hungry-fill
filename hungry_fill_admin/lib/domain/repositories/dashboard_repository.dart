
abstract class DashBoardRepository{

  Future<int> getUsersCount();
  Future<int> getTotalOrdersCount();
  Future<int> getRestaurantCount(); 
  Future<int> calculateTodaysRevenue();
  Future<int> calculateTotalEarnings();
}