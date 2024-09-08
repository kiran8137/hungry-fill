

 

class AddressModel {
 
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
  

const AddressModel({
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
 
  
  

  
}