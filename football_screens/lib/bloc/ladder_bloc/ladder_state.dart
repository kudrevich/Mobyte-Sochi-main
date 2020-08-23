part of 'ladder_bloc.dart';

abstract class LadderState extends Equatable {
  const LadderState();
}

class InitialLadderState extends LadderState {
  final BlocKey key;

  InitialLadderState(this.key);

  @override
  List<Object> get props => [key];
}

class LadderLoading extends LadderState {
  @override
  List<Object> get props => [];
}
