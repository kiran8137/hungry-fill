import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hungry_fill/data/model/user_model/user_model.dart';
import 'package:hungry_fill/domain/repositories/user_repository/user_repo.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserRepository userrepository;
  final FirebaseAuth firebaseauth;
  UsersBloc({required this.userrepository, required this.firebaseauth})
      : super(UsersInitial()) {
    on<UserGetEvent>(getUserdetail);
    on<UserAuthenticatedStatusEvent>(getUsersStatus);
    on<UserUpdateEvent>(updateUserDetails);
  }

  FutureOr<void> getUserdetail(
      UserGetEvent event, Emitter<UsersState> emit) async {
    try {
      UserModel? currentuser = await userrepository.getUserdetail(
          userid: firebaseauth.currentUser!.uid);
      if (currentuser != null) {
        emit(UserLoadedState(userdetails: currentuser));
      } else {
         emit(UserLoadedError());
      }
    } catch (error) {
      log(error.toString());
    }
  }

  FutureOr<void> getUsersStatus(
      UserAuthenticatedStatusEvent event, Emitter<UsersState> emit) async {
    try {
      User? user = await userrepository.getUsersStatus();
      if (user != null) {
        log('user is already signed in');
        emit(UserAuthenticatedStatus());
      } else {
        log("user is not signed in ");
        emit(UserUnauthenticatedStatus());
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  FutureOr<void> updateUserDetails(
      UserUpdateEvent event, Emitter<UsersState> emit) async {
    try {
      UserModel? user = event.updateduserdetails.copywith(
        userid: firebaseauth.currentUser?.uid,
          username: event.updateduserdetails.username,
          usermobilenumber: event.updateduserdetails.usermobilenumber,
          useremail: event.updateduserdetails.useremail);
      await userrepository.updateUserDetails(
          userupdateddetails: user);
          emit(UserUpdateSuccessState());
    } catch (error) {
      emit(UserErrorState());
      log(error.toString());
    }
  }
}
