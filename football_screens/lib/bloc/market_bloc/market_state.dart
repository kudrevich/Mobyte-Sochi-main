part of 'market_bloc.dart';

@immutable
abstract class MarketState {}

class InitialMarketState extends MarketState {}

class MarketInitial extends MarketState {
  final BlocKey key;

  final ItemCategory category;
  final bool dishAddedSuccessfully;
  final bool dishAdding;

  final String errorCaption;

  MarketInitial({
    this.key,
    this.category,
    this.errorCaption = "",
    this.dishAdding = false,
    this.dishAddedSuccessfully = false,
  });
  @override
  List<Object> get props => [
        key,
        category,
        errorCaption,
        dishAdding,
        dishAddedSuccessfully,
      ];
}

class Loading extends MarketState {
  final String caption;
  Loading({this.caption});
  @override
  List<Object> get props => [caption];
}

class EState extends MarketState {
  final String caption;

  EState({@required this.caption});

  @override
  List<Object> get props => [caption];
}
