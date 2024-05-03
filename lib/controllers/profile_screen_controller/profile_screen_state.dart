part of 'profile_screen_cubit.dart';

@immutable
abstract class ProfileScreenState {}

class ProfileScreenInitial extends ProfileScreenState {}
class ProfileGetImageSuccessState extends ProfileScreenState {}
class ProfileGetImageErrorState extends ProfileScreenState {}
