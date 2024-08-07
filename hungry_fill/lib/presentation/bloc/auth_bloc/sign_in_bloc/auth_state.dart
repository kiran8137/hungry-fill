part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable{
  const AuthState();

  @override
  
  List<Object?> get props => [];
}

  class AuthInitial extends AuthState {}

  class AuthOtpSent extends AuthState{}

  // class AuthSuccessfull extends AuthState{
  //   final UserModel user;

  //   AuthSuccessfull(this.user);

  //   @override
   
  // List<Object?> get props => [user];
  //}

  // class OtpVerified extends AuthState{
  //   final String? userid;

  //   const OtpVerified({required this.userid});
  //   @override
   
  // List<Object?> get props => [userid];
  // }

  final class SigInSuccessState extends AuthState{}

  final class LogInSuccessState extends AuthState{}

  class AuthErrorState extends AuthState{
    final String? erromessage;

  const AuthErrorState({required this.erromessage});

  @override
 
  List<Object?> get props => [erromessage];
  }



class FieldsErrorState extends AuthState{}

class UserAuthenticated extends AuthState{}

class UserUnAuthenticated extends AuthState{}

class UserAlreadyRegistered extends AuthState{}

class UserNotRegistered extends AuthState{}

class ResentOtpSentState extends AuthState{}

   
