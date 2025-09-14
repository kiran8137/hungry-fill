part of 'users_bloc.dart';

sealed class UsersState extends Equatable {
  const UsersState();
  
  @override
  List<Object> get props => [];
}

final class UsersInitial extends UsersState {}

final class UserLoadedState extends UsersState{
 final UserModel userdetails;

 const UserLoadedState({required this.userdetails});

 @override
   
  List<Object> get props => [userdetails];
}

final class UserLoadedError extends UsersState{}

final class UserAuthenticatedStatus extends UsersState{}

final class UserUnauthenticatedStatus extends UsersState{}

final class UserUpdatedState extends UsersState{}

final class UserUpdateSuccessState extends UsersState{}

final class UserErrorState extends UsersState{}


