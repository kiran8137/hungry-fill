
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungry_fill_admin/data/models/user_model.dart';
import 'package:hungry_fill_admin/domain/repositories/users_repository.dart';

class UsersRepoImpl extends UsersRepository{
  @override
  Future<List<UserModel>> getUsersFromDb()async {
    List<UserModel> usersList = [];
      String? grandTotal;
      List<dynamic> totalList;
    
    try{
      final result = await FirebaseFirestore.instance.collection('Users').get();
      final usersdetail = result.docs.map((user)=> UserModel.fromJson(json: user.data())).toList();

    for(var user in usersdetail){
      var userid = user.userid;

      final orderdetails = await FirebaseFirestore.instance.collection('OrderCollection').where('userId' , isEqualTo: userid ).get();
      if(orderdetails.docs.isNotEmpty){
           totalList = orderdetails.docs.map((i)=> i['grandTotal']).toList();
        grandTotal = totalList.reduce((i,j)=> i + j ).toString();
      }
     
      usersList.add(UserModel(
        userid: userid,
        username: user.username,
        useremail: user.useremail,
        usermobilenumber: user.usermobilenumber,
        noOfOrders:  orderdetails.docs.length.toString(),
        total: orderdetails.docs.isEmpty ? 0.toString() : grandTotal.toString()
        
      ));

     
    }

      return usersList;


    }catch(error){
      log(error.toString());
      throw Exception(error);
    }
  }
}