part of 'log_in_bloc_bloc.dart';

sealed class LogInBlocState extends Equatable {
  const LogInBlocState();
  
  @override
  List<Object> get props => [];
}

final class LogInBlocInitial extends LogInBlocState {}
