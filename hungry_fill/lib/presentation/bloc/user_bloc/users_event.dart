part of 'users_bloc.dart';

sealed class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}


class UserGetEvent extends UsersEvent{
  
}

class UserAuthenticatedStatusEvent extends UsersEvent{}

class UserUnauthenticatedStatusEvent extends UsersEvent{}

class UserUpdateEvent extends UsersEvent{
  
  final UserModel updateduserdetails;

  const UserUpdateEvent(this.updateduserdetails);

  @override
  
  List<Object> get props => [updateduserdetails];
}

