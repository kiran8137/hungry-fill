import 'package:firebase_auth/firebase_auth.dart';
abstract class AuthRepository{

  Future<UserCredential> signIn({
    required String emailid,
    required  String password

  });


  Future<UserCredential> logIn({
    required String emailid,
    required String password

  });

  Future<void> signOut();

  Future<void> resetPassword({
    required String email
  });

}