import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/res_user/res_user_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/domain/repositories/auth_repository.dart';
import 'package:hungryfill_restaurant/features/restaurant/domain/repositories/res_user_repository.dart';
 

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository;
  
  RestaurantUserRepository restaurantrespository;
  AuthBloc(this.authRepository , this.restaurantrespository) : super(AuthInitial()) {
    on<SignInEvent>(signIn);
    on<LogInEvent>(logIn);
    on<ResDetailAddEvent>(addResDetail);
    on<SignOutEvent>(signOut);
    on<ResetPasswordEvent>(resetPassword);

  }

  FutureOr<void> signIn(SignInEvent event, Emitter<AuthState> emit) async {

    try{
      UserCredential? usercred = await authRepository.signIn(emailid: event.emailid!, password: event.password!);
      
      if(usercred.user != null){
        log("new user");
        emit(SigInSuccessState());
      }
    }catch(error){
      log(error.toString());
      emit(ErrorState(errormessage: error.toString()));
    }
    
    
     
  }

  FutureOr<void> logIn(LogInEvent event, Emitter<AuthState> emit) async {
    try{
      UserCredential? usercred = await authRepository.logIn(emailid: event.emailid!, password: event.password!);
      await restaurantrespository.setRestaurantLoggedStatus(isLoggedin: true);
      
      if(usercred.user!=null){
        log("already logged user");
        emit(LogInSuccessState());
      }

    }catch(error){
      log(error.toString());
    }
  }



  FutureOr<void> addResDetail(ResDetailAddEvent event, Emitter<AuthState> emit) async{
    try{
      await restaurantrespository.saveRestaurantToDb(restaurantmodel: event.restaurantmodel);
      restaurantrespository.setRestaurantLoggedStatus(isLoggedin: true);
      emit(ResDetailSuccessState());
    }catch(error){
      log(error.toString());
    }
  }

  FutureOr<void> signOut(SignOutEvent event, Emitter<AuthState> emit) async {

    try{
      await authRepository.signOut();
      await restaurantrespository.setRestaurantLoggedStatus(isLoggedin: false);
      emit(SignOutSuccesState());

    }catch(error){
      emit(const ErrorState());
      log(error.toString());
    }
  }

  FutureOr<void> resetPassword(ResetPasswordEvent event, Emitter<AuthState> emit) async{

    try{
      await authRepository.resetPassword(email: event.email!);
      emit(ResetPassowrdEmailSendState());
    }catch(error){
      emit(const ErrorState());
      log(error.toString());
    }
  }
}
