
abstract class DashBoardRepository{

  Future<int> getUsersCount();
  Future<int> getTotalOrdersCount();
  Future<int> getRestaurantCount(); 
}