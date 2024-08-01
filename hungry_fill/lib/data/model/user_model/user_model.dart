
 
import 'package:hungry_fill/domain/entities/user_entity/user_entity.dart';

class UserModel extends UserEntity{
  
  const UserModel({
    super.userid,
    super.username,
    super.usermobilenumber,
    super.useremail
  });

   factory UserModel.fromJson({required Map<String, dynamic> json}){
    return UserModel(
      userid: json["userId"],
      username: json["userName"],
      usermobilenumber: json["userMobileNumber"],
      useremail: json["useEmail"]

    );
     
   }


   Map<String , dynamic > toJson(){
    return {
      "userId" : userid,
      "userName" : username,
      "userMobileNumber" : usermobilenumber,
      "useEmail" : useremail
    };
     
   }

   UserModel copywith({
    String? userid,
    String? username,
    String? usermobilenumber,
    String? useremail,
   
 
  
   }){
    return UserModel(
      userid: userid ?? this.userid,
      username: username ?? this.username,
      usermobilenumber: usermobilenumber ?? this.usermobilenumber,
      useremail: useremail ?? this.useremail,
      
    );
   }
}