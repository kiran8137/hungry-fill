import 'package:hungry_fill_admin/domain/entities/users_entity.dart';


 
 

class UserModel extends UserEntity{
  
  const UserModel({
    super.userid,
    super.username,
    super.usermobilenumber,
    super.useremail,
    super.noOfOrders,
    super.total
  });

   factory UserModel.fromJson({required Map<String, dynamic> json}){
    return UserModel(
      userid: json["userId"],
      username: json["userName"],
      usermobilenumber: json["userMobileNumber"],
      useremail: json["userEmail"],
    );
     
   }


    
   
}