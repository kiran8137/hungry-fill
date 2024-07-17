

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
 final String? userid;
 final String? username;
 final String? usermobilenumber;
 final String? useremail;
  

  const UserEntity({
 this.userid,
 this.username,
 this.usermobilenumber,
 this.useremail
 
});

  @override
   
  List<Object?> get props => [
    userid,
    username,
    usermobilenumber,
    useremail
  ];

}


