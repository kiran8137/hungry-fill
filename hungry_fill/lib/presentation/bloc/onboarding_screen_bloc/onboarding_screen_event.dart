part of 'onboarding_screen_bloc.dart';

sealed class OnboardingScreenEvent extends Equatable {
  const OnboardingScreenEvent();

  @override
  List<Object> get props => [];
}

class GetPageViewPageIndex extends OnboardingScreenEvent{
  final int currentIndex;

  const GetPageViewPageIndex({required this.currentIndex});
  
}
