
 

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hungry_fill/core/otp_model/otp_model.dart';
import 'package:hungry_fill/data/user_model/user_model.dart';

abstract class AuthRepository{

Future<void> sendOtp({
  required String phoneNumber,
  required BuildContext context,
  required String? username,
  required String? useremail

  
});

Future<UserCredential> verifyOtp({
  required String verificationId,
  required String otpCode,
  
});

//save user to the database(temp)
Future<void> saveUserToDatabase({
  required UserModel usermodel});


// Future<UserModel?> signInFaceBook();

Future<void> setUserLoggedIn ({required bool isloggedIn});

Future<bool> getUserLoggedStatus();

Future<bool> checkUserAlreadyRegistered({required String? phonenumber});

//Future<void> sendOtpLogInPage({required String? phonenumber});

Future<void> sendOtpLogin({required String phonenumber ,  required BuildContext context,});

}