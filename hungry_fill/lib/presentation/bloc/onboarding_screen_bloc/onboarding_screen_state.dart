part of 'onboarding_screen_bloc.dart';

sealed class OnboardingScreenState extends Equatable {
  const OnboardingScreenState();
  
  @override
  List<Object> get props => [];
}

final class OnboardingScreenInitial extends OnboardingScreenState {}

final class GetPageViewPageIndexSuccess extends OnboardingScreenState{
  final int index;

  const GetPageViewPageIndexSuccess({required this.index});
  
  @override
  // TODO: implement props
  List<Object> get props => [index];
}