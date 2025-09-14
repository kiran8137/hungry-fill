import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
 
import 'package:hungry_fill/data/model/user_model/user_model.dart';
import 'package:hungry_fill/domain/repositories/auth_repository/auth_repo.dart';
import 'package:hungry_fill/presentation/bloc/auth_bloc/sign_in_bloc/auth_event.dart';
 

part 'auth_state.dart';
 

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authrepository;
  AuthBloc(this.authrepository) : super(AuthInitial()) {
    //  on<SendOtpEvent>(sendOtp);
    //  on<VerifyOtpEvent>(verifyOtp);
     on<UserLoggedStatusEvent>(getUserLoggedStatus);
     //on<UserRegisteredEvent>(checkUserRegistered);
    //  on<ResentOtpEvent>(resentOtp);

    on<SignInEvent>(signIn);
    on<LogInEvent>(logIn);
    on<HideTextEvent>(hideText);
    on<ChangeAuthType>(changeAuthType);
    on<SendResetPasswordEmail>(sendResetPasswordEmail);
  }


  // FutureOr<void> sendOtp(SendOtpEvent event , Emitter<AuthState> emit) async{

  //   try{
  //   //   if(event.phonenumber!=null ){
      
  //   //  await authrepository.sendOtp(phoneNumber: event.phonenumber! , context: event.context , username: event.username , useremail: event.useremail);
  //   //   emit(AuthOtpSent());
  //   // } 
  //   bool result =  await authrepository.checkUserAlreadyRegistered(phonenumber: event.phonenumber);
  //   if(result == true){
  //     emit(UserAlreadyRegistered());
  //   }else{
  //     await authrepository.sendOtp(phoneNumber: event.phonenumber! , context: event.context , username: event.username , useremail: event.useremail);
  //     emit(AuthOtpSent());
  //   }
  //   // if(event.phonenumber == null){
  //   //   emit(FieldsErrorState());
  //   // }
  //   // if(event.phonenumber!.length >=14){
  //   //   emit(FieldsErrorState());
  //   // }
  //   }
  //   catch(e){
  //     log(e.toString());
  //     emit(AuthErrorState(erromessage: e.toString()));
  //   }
    

  // }


  // Future<FutureOr<void>> verifyOtp(VerifyOtpEvent event , Emitter<AuthState> emit) async{

  //   emit(AuthInitial());
  //   try{
  //      if(event.otpCode.length == 6){
  //     final usercredentials = await authrepository.verifyOtp(verificationId: event.verificationid, otpCode: event.otpCode );
  //     UserModel usermodel = UserModel(
  //       userid: usercredentials.user?.uid ,
  //       username: event.username,
  //       usermobilenumber: usercredentials.user?.phoneNumber,
  //       useremail: event.useremail
        
  //     );
  //     authrepository.saveUserToDatabase(usermodel: usermodel);
  //     authrepository.setUserLoggedIn(isloggedIn: true);
  //     emit(OtpVerified(userid: usercredentials.user?.uid));
  //   }
  //   }
  //   catch(e){
  //     log(e.toString());
  //     emit(AuthErrorState(erromessage: e.toString()));
  //   }
   
  // }


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

  // FutureOr<void> checkUserRegistered(UserRegisteredEvent event, Emitter<AuthState> emit) async{

  //   try{
  //     bool result = await authrepository.checkUserAlreadyRegistered(phonenumber: event.phonenumber);

  //     if(result == false){
  //       emit(UserNotRegistered());
  //     }else{
  //       // await authrepository.sendOtpLogInPage(phonenumber: event.phonenumber);
  //        emit(AuthOtpSent());
  //     }
  //   }
  //   catch(error){
  //     log(error.toString());
      
  //   }
  // }

  // FutureOr<void> resentOtp(ResentOtpEvent event, Emitter<AuthState> emit) async {

  //   await authrepository.resentOtpSent(phoneNumber: event.phonenumber!, username: event.username, useremail: event.useremail, forceresendingtoken: event.forceresendingtoken);
    
  // }

  FutureOr<void> signIn(SignInEvent event, Emitter<AuthState> emit) async{
    try{

       bool result =  await authrepository.checkUserAlreadyRegistered(emailid: event.emailid);
       if(result == true){
      emit(UserAlreadyRegistered());
       }else{
        
        UserCredential? usercred = await authrepository.signIn(emailid: event.emailid!, password: event.password!);
            UserModel usermodel = UserModel(
        userid: usercred.user?.uid ,
        username: event.username,
        usermobilenumber: event.phonenumber,
        useremail: event.emailid
        
      );
      authrepository.saveUserToDatabase(usermodel: usermodel);
      authrepository.setUserLoggedIn(isloggedIn: true);
        if(usercred.user!=null){
          emit(SigInSuccessState());
        }
       }

       
     
    }catch(error){
      log(" usersignIn error${error.toString()}");
      emit(AuthErrorState(erromessage: error.toString()));
    }
  }

  FutureOr<void> logIn(LogInEvent event, Emitter<AuthState> emit)async {
     emit(AuthInitial());
    try{

      
       bool result =  await authrepository.checkUserAlreadyRegistered(emailid: event.emailid);
       if(result == false){
      emit(UserAlreadyRegistered());
       }else{
         UserCredential? usercred = await authrepository.logIn(emailid: event.emailid!, password: event.password!);
      await authrepository.setUserLoggedIn(isloggedIn: true);
      
      if(usercred.user!=null){
        log("already logged user");
        emit(LogInSuccessState());
      }
       }

       

    }catch(error){
      log(error.toString());
    }
  }

   

  FutureOr<void> hideText(HideTextEvent event, Emitter<AuthState> emit) {
    emit(HideTextSuccessState(isTextHide: event.currentBool ));
  }

  FutureOr<void> changeAuthType(ChangeAuthType event, Emitter<AuthState> emit){
    emit(ChangeAuthTypeSuccess(isLogIn: event.isLogIn ? false : true));
  }

  FutureOr<void> sendResetPasswordEmail(SendResetPasswordEmail event, Emitter<AuthState> emit) async{
    final result = await authrepository.resetPassword(email: event.email);
    result ? emit(SendResetPasswordEmailSuccess()) : emit(SendResetPasswordEmailError());
  }
}
