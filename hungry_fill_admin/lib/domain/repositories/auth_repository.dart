
abstract class AuthRepository{

  Future<bool> logIn({required String emailid ,required String password });

  Future<void> setUserLoggedStatus({required bool islogged});

  Future<bool> getRestaurantLoggedStatus();
}