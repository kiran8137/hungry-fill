
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hungryfill_restaurant/features/restaurant/domain/repositories/auth_repository.dart';

class AuthRepoImplementation extends AuthRepository{
  




  @override
  Future<UserCredential> signIn({required String emailid, required String password}) async{
     try{

     UserCredential usercred =  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailid, password: password);
     return usercred;
     }catch(error){
      log(error.toString());
      throw Exception(error.toString());
     }
  }
  
  @override
  Future<UserCredential> logIn({required String emailid, required String password}) async {
     
     try{
      UserCredential usercred = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailid, password: password);
      return usercred;

     }catch(error){
      log(error.toString());
      throw Exception(error.toString());
     }
    
  }
  
  @override
  Future<void> signOut()async {
     
     try{
      await FirebaseAuth.instance.signOut();
     }catch(error){
      log(error.toString());
     }
  }
  
  @override
  Future<void> resetPassword({required String email}) async {
     
     try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

     }catch(error){
      log(error.toString());
     }
  }
  
}