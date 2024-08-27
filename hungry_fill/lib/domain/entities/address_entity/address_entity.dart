
import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable{
 
 final String? addressid;
 final String? latitude;
 final String? longitude;
 final String? userid;
 final String? username;
 final String? userMobileNumber;
 final String? houseNo;
 final String? street;
 final String? district;
 final String? state;
  

const AddressEntity({
  this.addressid,
  this.latitude,
  this.longitude,
  this.userid,
  this.username,
  this.userMobileNumber,
  this.houseNo,
  this.street,
  this.district,
  this.state
});


  
  @override
   
  List<Object?> get props => [latitude , longitude ,userid,username,userMobileNumber , houseNo, street , district , state];


  
}