part of 'market_bloc.dart';

@immutable
abstract class MarketEvent {}

class Update extends MarketEvent {
  final bool logout;

  Update({this.logout = false});

  @override
  List<Object> get props => [];
}

class Search extends MarketEvent {
  final String search;
  Search({this.search});
  @override
  List<Object> get props => [search];
}

class SelectCategory extends MarketEvent {
  final ItemCategory category;
  SelectCategory({this.category});
  @override
  List<Object> get props => [category];
}

class AddToBasket extends MarketEvent {
  final String dishId;

  AddToBasket({@required this.dishId});
  @override
  List<Object> get props => [dishId];
}
