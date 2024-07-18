part of 'auth_bloc_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}


final class SigInSuccessState extends AuthState{}

final class SucessState extends AuthState{}

final class ErrorState extends AuthState{
  final String? errormessage;

  const ErrorState({ this.errormessage});

}

final class LogInSuccessState extends AuthState{}


final class ResDetailSuccessState extends AuthState{}

final class SignOutSuccesState extends AuthState{}

final class ResetPassowrdEmailSendState extends AuthState{}

final class ResetPasswordSuccesState extends AuthState{}