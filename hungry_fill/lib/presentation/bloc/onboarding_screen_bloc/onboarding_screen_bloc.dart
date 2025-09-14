import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_screen_event.dart';
part 'onboarding_screen_state.dart';

class OnboardingScreenBloc extends Bloc<OnboardingScreenEvent, OnboardingScreenState> {
  OnboardingScreenBloc() : super(OnboardingScreenInitial()) {
    
    on<GetPageViewPageIndex>(_getPageViewIndex);
  }

  FutureOr<void> _getPageViewIndex(GetPageViewPageIndex event, Emitter<OnboardingScreenState> emit) {
    emit(GetPageViewPageIndexSuccess(index: event.currentIndex));
  }
}
