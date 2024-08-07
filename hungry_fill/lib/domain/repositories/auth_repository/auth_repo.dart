
 

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
 
import 'package:hungry_fill/data/model/user_model/user_model.dart';

abstract class AuthRepository{

// Future<void> sendOtp({
//   required String phoneNumber,
//   required BuildContext context,
//   required String? username,
//   required String? useremail

  
//});

// Future<UserCredential> verifyOtp({
//   required String verificationId,
//   required String otpCode,
  
// });


 Future<UserCredential> signIn({
    required String emailid,
    required  String password

  });

  Future<UserCredential> logIn({
     required String emailid,
    required  String password

  });

//save user to the database(temp)
Future<void> saveUserToDatabase({
  required UserModel usermodel});


// Future<UserModel?> signInFaceBook();

Future<void> setUserLoggedIn ({required bool isloggedIn});

Future<bool> getUserLoggedStatus();

Future<bool> checkUserAlreadyRegistered({required String? emailid});

//Future<void> sendOtpLogInPage({required String? phonenumber});

Future<void> sendOtpLogin({required String phonenumber ,  required BuildContext context,});


Future<void> resentOtpSent({
   required String phoneNumber,
   required String? username,
   required String? useremail,
   required int? forceresendingtoken
});



}