
import 'package:hungry_fill_admin/data/models/user_model.dart';

abstract class UsersRepository{

  Future<List<UserModel>> getUsersFromDb();
}