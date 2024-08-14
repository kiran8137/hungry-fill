 

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class AuthEvent extends Equatable{

 @override
   
  List<Object?> get props => [];
}

// class SendOtpEvent extends AuthEvent{

//   final String? phonenumber;
//   final BuildContext context;
//   final String? username;
//   final String? useremail;
   
//   SendOtpEvent( {this.username, this.useremail, required this.phonenumber , required this.context});

//   @override
  
//   List<Object?> get props => [phonenumber];
// }


// class VerifyOtpEvent extends AuthEvent{

   
//   final String otpCode;
//   final String verificationid;
//   final String? username;
//   final String? useremail;
   

//   VerifyOtpEvent({required this.otpCode, required this.verificationid , required this.username , required this.useremail});

//   @override
  
//   List<Object?> get props => [otpCode , verificationid ];
  

// }

class UserLoggedStatusEvent extends AuthEvent{}

// class UserAlreadyRegisteredEvent extends AuthEvent{

//   final String phonenumber;

//   UserAlreadyRegisteredEvent({required this.phonenumber});
// }

class UserRegisteredEvent extends AuthEvent{
   final String phonenumber;

   UserRegisteredEvent({required this.phonenumber});


   @override
  // TODO: implement props
  List<Object?> get props => [phonenumber];
}

// class ResentOtpEvent extends AuthEvent{
//   final int? forceresendingtoken ;
//   final String? username;
//   final String? useremail;
//   final String? phonenumber;

//   ResentOtpEvent({this.username, this.useremail, this.forceresendingtoken , this.phonenumber});

//   @override
 
//   List<Object?> get props => [forceresendingtoken];
// }

class SignInEvent extends AuthEvent{
 
 final String? emailid;
 final String? password;
 final String? username;
 final String? phonenumber;

   SignInEvent({required this.emailid, required this.password , required this.username , required this.phonenumber});


  @override
   
  List<Object> get props => [emailid! , password! , username! ,phonenumber!];
}

class LogInEvent extends AuthEvent{
  final String? emailid;
  final String? password;

   LogInEvent({required this.emailid, required this.password});

  
}