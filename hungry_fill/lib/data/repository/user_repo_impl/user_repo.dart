
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hungry_fill/data/user_model/user_model.dart';
import 'package:hungry_fill/domain/repositories/user_repository/user_repo.dart';

class UserRepoImplementation extends UserRepository {
FirebaseFirestore firestore;
FirebaseAuth firebaseauth; 

UserRepoImplementation({required this.firestore , required this.firebaseauth});


  @override
  Future<UserModel?> getUserdetail({required String userid}) async{
    
    

    try{
      DocumentSnapshot<Map<String , dynamic>> documentsnapshot = await firestore.collection("Users").doc(userid).get();
       if(documentsnapshot.exists){
      return UserModel.fromJson(json: documentsnapshot.data()!);
    }else{
      log("No user with the usesrid $userid");
    }
    }
    catch (error){
      log("error while getting user info $error");
      throw Exception("error while getting user info $error");
    }
   
  }

  @override
  Future<User?> getUsersStatus() async{
    
    try{
      User? user = await FirebaseAuth.instance.currentUser;
      return user;
    }catch(error){
      throw Exception(error.toString());
    }
  }
  
  @override
  Future<void> updateUserDetails( {required UserModel userupdateddetails}) async {
     
     try{
       await firestore.collection("Users")
       .doc(firebaseauth.currentUser?.uid)
       .update(userupdateddetails.toJson());
     }catch(error){
      throw Exception("could'nt update the user");
     }

  }

  

  
}