part of 'log_in_bloc_bloc.dart';

sealed class LogInBlocEvent extends Equatable {
  const LogInBlocEvent();

  @override
  List<Object?> get props => [];
}


class SendOtpEventLogin extends LogInBlocEvent{

  final String? phonenumber;
  final BuildContext context;
   
   
   
 const SendOtpEventLogin( { required this.phonenumber , required this.context});

  @override
  // TODO: implement props
  List<Object?> get props => [phonenumber ];
  
   
}

// class VerifyOtpEvent extends LogInBlocEvent{

//    final String otpCode;
//   final String verificationid;

//  const VerifyOtpEvent({required this.otpCode, required this.verificationid});

// }