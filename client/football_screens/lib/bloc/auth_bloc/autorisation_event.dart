part of 'autorisation_bloc.dart';

abstract class AutorisationEvent extends Equatable {
  const AutorisationEvent();
  @override
  List<Object> get props => [];
}

class NumberChange extends AutorisationEvent {
  final String data;
  const NumberChange(this.data);
  @override
  List<Object> get props => [data];
}

class PasswordChange extends AutorisationEvent {
  final String data;
  const PasswordChange(this.data);
  @override
  List<Object> get props => [data];
}

class RegisterNumberChange extends AutorisationEvent {
  final String data;
  const RegisterNumberChange(this.data);
  @override
  List<Object> get props => [data];
}

class RegisterPasswordChange extends AutorisationEvent {
  final String data;
  const RegisterPasswordChange(this.data);
  @override
  List<Object> get props => [data];
}

class ConfirmedPasswordChange extends AutorisationEvent {
  final String data;
  const ConfirmedPasswordChange(this.data);
  @override
  List<Object> get props => [data];
}

class EnterInProfile extends AutorisationEvent {
  final bool isReg;
  EnterInProfile(this.isReg);
}

class AuthStatusChanged extends AutorisationEvent {
  final bool hasAuth;
  const AuthStatusChanged(this.hasAuth);

  @override
  List<Object> get props => [hasAuth];
}



class Register extends AutorisationEvent {

  const Register();
  @override
  List<Object> get props => [];
}

class DataLoaded extends AutorisationEvent {}

class LogOut extends AutorisationEvent {}

class LoadData extends AutorisationEvent {}

class FinishLoadData extends AutorisationEvent {}



