part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetProfile extends UserEvent{}

class SentDataToServer extends UserEvent{}

class AvatarChanged extends UserEvent{}
