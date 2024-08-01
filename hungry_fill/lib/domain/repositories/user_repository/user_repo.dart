
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hungry_fill/data/model/user_model/user_model.dart';

abstract class UserRepository {

  // Future<UserModel> getUserdetail({required this.userid}) async{
  //    String userid;
  // }

   Future<UserModel?> getUserdetail({required String userid});

   Future<User?> getUsersStatus();

   Future<void> updateUserDetails({required UserModel userupdateddetails});
}