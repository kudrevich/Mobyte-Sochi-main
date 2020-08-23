part of 'ladder_bloc.dart';

abstract class LadderEvent extends Equatable {
  const LadderEvent();
}

class LadderUpdate extends LadderEvent {
  @override
  List<Object> get props => [];
}
