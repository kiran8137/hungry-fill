import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:hungry_fill/core/otp_model/otp_model.dart';
import 'package:hungry_fill/data/model/user_model/user_model.dart';
import 'package:hungry_fill/domain/repositories/auth_repository/auth_repo.dart';
import 'package:hungry_fill/presentation/pages/user_auth/otp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String userloggedkey = 'islogged';

class AuthenticationRepoImplement extends AuthRepository {
  final FirebaseAuth firebaseauth;
  final FirebaseFirestore firestore;

  AuthenticationRepoImplement(
      {required this.firestore, required this.firebaseauth});

  // @override
  // Future<void> sendOtp(
  //     {required String phoneNumber,
  //     required BuildContext context,
  //     required String? username,
  //     required String? useremail}) async {
  //   try {
  //     await firebaseauth.verifyPhoneNumber(
  //         phoneNumber: phoneNumber,
  //         verificationCompleted: (phoneAuthCredential) {},
  //         verificationFailed: (error) {
  //           print(error.toString());
  //         },
  //         codeSent: (verificationId, forceResendingToken) {
  //           log(forceResendingToken.toString());
  //           //navigate to the otp page
  //           Navigator.push(
  //               context,
  //               (MaterialPageRoute(
  //                   builder: (context) => (OtpScreen(
  //                         username: username,
  //                         useremail: useremail,
  //                         otpdata: OTPModel(
  //                           phonenumber: phoneNumber,
  //                             verificationId: verificationId,
  //                             forceResendingToken: forceResendingToken),
  //                       )))));
  //         },
  //         codeAutoRetrievalTimeout: (verificationId) {});
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  // @override
  // Future<UserCredential> verifyOtp(
  //     {required String verificationId, required String otpCode}) async {
  //   try {
  //     final credentials = PhoneAuthProvider.credential(
  //         verificationId: verificationId, smsCode: otpCode);

  //     Future<UserCredential> userdetail =
  //         firebaseauth.signInWithCredential(credentials);

  //     return userdetail;
  //   } catch (e) {
  //     log(e.toString());
  //     throw Exception(e);
  //   }
  // }


  @override
  Future<UserCredential> signIn({required String emailid, required String password})async{
      try{

     UserCredential usercred =  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailid, password: password);
     return usercred;
     }catch(error){
      log(error.toString());
      throw Exception(error.toString());
     }
  }

  
 @override
  Future<UserCredential> logIn({required String emailid, required String password}) async{

    try{
       UserCredential usercred = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailid, password: password);
      return usercred;

    }catch(error){
      log(error.toString());
      throw Exception(error.toString());
    }
  }
  

  @override
  Future<void> saveUserToDatabase({required UserModel usermodel}) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(usermodel.userid)
          .set(usermodel.toJson());
    } catch (e) {
      log("error while adding userdata $e");
      throw Exception("error while adding userdata $e");
    }
  }

  // @override
  // Future<UserModel?> signInFaceBook() {

  // }
  @override
  Future<void> setUserLoggedIn({required bool isloggedIn}) async {
    SharedPreferences sharedpref = await SharedPreferences.getInstance();
    await sharedpref.setBool(userloggedkey, isloggedIn);
  }

  @override
  Future<bool> getUserLoggedStatus() async {
    SharedPreferences sharedpref = await SharedPreferences.getInstance();
    return sharedpref.getBool(userloggedkey) ?? false;
  }

  @override
  Future<bool> checkUserAlreadyRegistered(
      {required String? emailid}) async {
    try {
      final result = await firestore
          .collection("Users")
          .where("useEmail", isEqualTo: emailid)
          .get();

      if (result.docs.isEmpty) {
        return false;
      } else {
        return true;
      }
    } catch (error) {
      log(error.toString());
      throw Exception(error.toString());
    }
  }

  @override
  Future<void> sendOtpLogin({required String phonenumber , required BuildContext context}) async {
    try {
      await firebaseauth.verifyPhoneNumber(
          phoneNumber: phonenumber,
          verificationCompleted: (phoneAuthCredential) {},
          verificationFailed: (error) {
            debugPrint(error.toString());
          },
          codeSent: (verificationId, forceResendingToken) {
              Navigator.push(
                context,
                (MaterialPageRoute(
                    builder: (context) => (OtpScreen(
                          
                          otpdata: OTPModel(
                              verificationId: verificationId,
                              forceResendingToken: forceResendingToken),
                        )))));
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } catch (error) {
      log(error.toString());
    }
  }
  
  @override
  Future<void> resentOtpSent({required String phoneNumber, required String? username, required String? useremail , required int? forceresendingtoken}) async{
     
     try{
      await firebaseauth.verifyPhoneNumber(
        forceResendingToken: forceresendingtoken,
        phoneNumber: phoneNumber,
          verificationCompleted: (phoneAuthCredential) {},
          verificationFailed: (error) {
            debugPrint(error.toString());
          },
          codeSent: (verificationId, forceResendingtoken) {
             log(forceResendingtoken.toString());

             
            

          },
            codeAutoRetrievalTimeout: (verificationId) {}
      );
     }catch(error){
      throw Exception(error.toString());

     }
  }
  
  
  
  
}
