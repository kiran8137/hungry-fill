import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
 
import 'package:hungry_fill/data/user_model/user_model.dart';
import 'package:hungry_fill/domain/repositories/auth_repository/auth_repo.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/sign_inauth_event.dart';
 

part 'sign_in_auth_state.dart';
 

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authrepository;
  AuthBloc(this.authrepository) : super(AuthInitial()) {
     on<SendOtpEvent>(sendOtp);
     on<VerifyOtpEvent>(verifyOtp);
     on<UserLoggedStatusEvent>(getUserLoggedStatus);
     on<UserRegisteredEvent>(checkUserRegistered);

  }


  FutureOr<void> sendOtp(SendOtpEvent event , Emitter<AuthState> emit) async{

    try{
    //   if(event.phonenumber!=null ){
      
    //  await authrepository.sendOtp(phoneNumber: event.phonenumber! , context: event.context , username: event.username , useremail: event.useremail);
    //   emit(AuthOtpSent());
    // } 
    bool result =  await authrepository.checkUserAlreadyRegistered(phonenumber: event.phonenumber);
    if(result == true){
      emit(UserAlreadyRegistered());
    }else{
      await authrepository.sendOtp(phoneNumber: event.phonenumber! , context: event.context , username: event.username , useremail: event.useremail);
      emit(AuthOtpSent());
    }
    // if(event.phonenumber == null){
    //   emit(FieldsErrorState());
    // }
    // if(event.phonenumber!.length >=14){
    //   emit(FieldsErrorState());
    // }
    }
    catch(e){
      log(e.toString());
      emit(AuthErrorState(erromessage: e.toString()));
    }
    

  }


  Future<FutureOr<void>> verifyOtp(VerifyOtpEvent event , Emitter<AuthState> emit) async{

    emit(AuthInitial());
    try{
       if(event.otpCode.length == 6){
      final usercredentials = await authrepository.verifyOtp(verificationId: event.verificationid, otpCode: event.otpCode );
      UserModel usermodel = UserModel(
        userid: usercredentials.user?.uid ,
        username: event.username,
        usermobilenumber: usercredentials.user?.phoneNumber,
        useremail: event.useremail
        
      );
      authrepository.saveUserToDatabase(usermodel: usermodel);
      authrepository.setUserLoggedIn(isloggedIn: true);
      emit(OtpVerified(userid: usercredentials.user?.uid));
    }
    }
    catch(e){
      log(e.toString());
      emit(AuthErrorState(erromessage: e.toString()));
    }
   
  }


  FutureOr<void> getUserLoggedStatus(UserLoggedStatusEvent event, Emitter<AuthState> emit) async {

    try{
      bool userloggestatus = await authrepository.getUserLoggedStatus();
    if(userloggestatus == true){
      emit(UserAuthenticated());
    }else{
      emit(UserUnAuthenticated());
    }
    }
    catch (error){
      log(error.toString());
      emit(AuthErrorState(erromessage: error.toString()));
    }
    
  }

  FutureOr<void> checkUserRegistered(UserRegisteredEvent event, Emitter<AuthState> emit) async{

    try{
      bool result = await authrepository.checkUserAlreadyRegistered(phonenumber: event.phonenumber);

      if(result == false){
        emit(UserNotRegistered());
      }else{
         await authrepository.sendOtpLogInPage(phonenumber: event.phonenumber);
         emit(AuthOtpSent());
      }
    }
    catch(error){
      log(error.toString());
      
    }
  }
}
