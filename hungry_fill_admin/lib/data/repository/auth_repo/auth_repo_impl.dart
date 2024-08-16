
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hungry_fill_admin/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String userkey = 'isLogged';
class AuthRepoImpl extends AuthRepository{



  @override
  Future<bool> logIn({required String emailid, required String password})async {
   
   try{
    final auth = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailid, password: password);
    User? _user = auth.user;
    if(_user != null){
      return true;
    }else{
      return false;
    }
   }catch(error){

    log(error.toString());
    throw Exception(error.toString());
   }
  }
  
  @override
  Future<void> setUserLoggedStatus({required bool islogged}) async {
     
      SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setBool(userkey, islogged);
  }
  
  @override
  Future<bool> getRestaurantLoggedStatus() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     return prefs.getBool(userkey) ?? false;
    
  }

  
}