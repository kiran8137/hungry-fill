

import 'package:flutter/material.dart';
import 'package:hungry_fill_admin/core/funtions.dart';
import 'package:hungry_fill_admin/data/repository/auth_repo/auth_repo_impl.dart';

class AuthProvider extends ChangeNotifier{

  AuthRepoImpl authrepository;

  AuthProvider({required this.authrepository});

  bool? userresult;


  Future<bool> logIn({required String emailid , required String password }) async{
    final result = await authrepository.logIn(emailid: emailid, password: password);

     notifyListeners();
    await authrepository.setUserLoggedStatus(islogged: true);

   
    return result;
  }

  Future<bool?> getUserStatus()async{
      userresult = await authrepository.getRestaurantLoggedStatus();

    notifyListeners();
    return userresult; 
  }

Future<void> logout()async{
 await signOut();
 authrepository.setUserLoggedStatus(islogged: false);
}
   
}