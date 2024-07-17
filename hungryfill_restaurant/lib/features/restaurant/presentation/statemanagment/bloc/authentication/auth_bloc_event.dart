part of 'auth_bloc_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends AuthEvent{
 
 final String? emailid;
 final String? password;

 const SignInEvent({required this.emailid, required this.password});


  @override
   
  List<Object> get props => [];
}


class CreateResDetailEvent extends AuthEvent{
   final String? restaurantname;
   final String? address;
   final String? mobilenumber;

 const CreateResDetailEvent({required this.restaurantname, required this.address, required this.mobilenumber});

}

class LogInEvent extends AuthEvent{
  final String? emailid;
  final String? password;

 const LogInEvent({required this.emailid, required this.password});

  
}


class ResDetailAddEvent extends AuthEvent{
  final RestaurantModel restaurantmodel;

 const ResDetailAddEvent({required this.restaurantmodel});


}


class SignOutEvent extends AuthEvent{}