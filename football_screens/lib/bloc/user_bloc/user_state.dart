part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class LoadingUserData extends UserState {}

class UserDataHasLoaded extends UserState{}
