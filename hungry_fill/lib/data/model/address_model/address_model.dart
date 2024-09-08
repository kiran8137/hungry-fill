

import 'package:hungry_fill/domain/entities/address_entity/address_entity.dart';

class AddressModel extends AddressEntity{
  
 const AddressModel({
    super.addressid,
    super.latitude,
    super.longitude,
    super.userid,
    super.username,
    super.userMobileNumber,
    super.houseNo,
    super.street,
    super.district,
    super.state
  });

 

  factory AddressModel.fromJson({required Map<String , dynamic> json}){
    
    return AddressModel(

      addressid: json['addressId'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      userid: json['userId'],
      username: json['userName'],
      userMobileNumber: json['userMobileNumber'],
      houseNo: json['houseNo'],
      street: json['street'],
      district: json['district'],
      state: json['state']
    );
  }


  Map<String,dynamic> toJson(){
    return {
      'addressId' : addressid,
      'latitude' : latitude,
      'longitude': longitude,
      'userId' : userid,
      'userName': username,
      'userMobileNumber' : userMobileNumber,
      'houseNo': houseNo,
      'street' : street,
      'district' : district,
      'state' : state
    };
  }

  

  



}