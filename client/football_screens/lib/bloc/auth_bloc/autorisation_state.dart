
part of 'autorisation_bloc.dart';


abstract class AutorisationState extends Equatable {

  final String password;
  final String number;

  AutorisationState( this.password, this.number);

    @override
  List<Object> get props => [password,number];
  
  }


class AutorisationInitial extends AutorisationState {
  AutorisationInitial( String password, String number) : super( password, number);
}

class StartLoadingState extends AutorisationState{
 StartLoadingState( String password, String number) : super( password, number);
}

class FinishLoadingState extends AutorisationState{
 FinishLoadingState( String password, String number) : super( password, number);
}

class LoadDataState extends AutorisationState{
  LoadDataState( String password, String number) : super( password, number);
}

class RegisterSuccess extends AutorisationState{
  RegisterSuccess( String password, String number) : super( password, number);
}





