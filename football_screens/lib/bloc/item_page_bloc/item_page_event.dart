part of 'item_page_bloc.dart';

abstract class ItemPageEvent extends Equatable {
  const ItemPageEvent();
}

class AddToBasket extends ItemPageEvent {
  final String itemId;

  AddToBasket({@required this.itemId});
  @override
  List<Object> get props => [itemId];
}

class RemFromBasket extends ItemPageEvent {
  final String itemId;

  RemFromBasket({@required this.itemId});
  @override
  List<Object> get props => [itemId];
}

class Update extends ItemPageEvent
{
  @override
  List<Object> get props => throw UnimplementedError();
}