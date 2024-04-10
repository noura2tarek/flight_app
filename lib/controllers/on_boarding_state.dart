part of 'on_boarding_cubit.dart';

@immutable
abstract class OnBoardingState {}

class OnBoardingInitialState extends OnBoardingState {}
class ChangePageState extends OnBoardingState {}
class OnBoardingNextState extends OnBoardingState {}
class OnBoardingSkipState extends OnBoardingState {}
