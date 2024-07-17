import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'log_in_bloc_event.dart';
part 'log_in_bloc_state.dart';

class LogInBlocBloc extends Bloc<LogInBlocEvent, LogInBlocState> {
  LogInBlocBloc() : super(LogInBlocInitial()) {
    on<LogInBlocEvent>((event, emit) {
       
    });
  }
}
