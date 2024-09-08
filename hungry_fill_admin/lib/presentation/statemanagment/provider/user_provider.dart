
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hungry_fill_admin/data/models/user_model.dart';
import 'package:hungry_fill_admin/data/repository/users_repo/users_repo_impl.dart';

class UserProvider extends ChangeNotifier{
  UsersRepoImpl userRepository;

  UserProvider({required this.userRepository});

List<UserModel> usersList = [];

  Future<void> getUsersDetail()async{
    try{
      final usersListdetail = await userRepository.getUsersFromDb();
      usersList.addAll(usersListdetail);
      notifyListeners();
      debugPrint(usersListdetail.toString());
    }catch(error){
      log(error.toString());

    }
  }
}