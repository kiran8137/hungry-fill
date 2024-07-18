import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hungry_fill/domain/repositories/auth_repository/auth_repo.dart';

part 'log_in_bloc_event.dart';
part 'log_in_bloc_state.dart';

class LogInBloc extends Bloc<LogInBlocEvent, LogInBlocState> {

final AuthRepository authrepository;
  
  LogInBloc(this.authrepository) : super(LogInBlocInitial()) {
     
     on<SendOtpEventLogin>(sendotplogIn);
  }

  FutureOr<void> sendotplogIn(SendOtpEventLogin event, Emitter<LogInBlocState> emit) async{

    try{
      bool result = await authrepository.checkUserAlreadyRegistered(phonenumber: event.phonenumber);

      if(result == false){
        //call the function for send otp for log in page
        await authrepository.sendOtpLogin(context: event.context , phonenumber: event.phonenumber!);
        emit(OtpSentStateLogin());
      }else{
        emit(UserNotRegisteredStateLogin());
      }
    }catch(error){
      log(error.toString());
    }
  }
}
