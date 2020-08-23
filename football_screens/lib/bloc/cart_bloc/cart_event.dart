part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class UpdateEvent extends CartEvent {
  @override
  List<Object> get props => null;
}

class RemoveEvent extends CartEvent {
  final String itemID;

  RemoveEvent({this.itemID});

  @override
  List<Object> get props => [itemID];
}

class AddEvent extends CartEvent {
  final String itemID;

  AddEvent({this.itemID});

  @override
  List<Object> get props => [itemID];
}

class DecrementEvent extends CartEvent {
  final String itemID;

  DecrementEvent({this.itemID});

  @override
  List<Object> get props => throw UnimplementedError();
}

class CloseCartEvent extends CartEvent {
  @override
  List<Object> get props => null;
}

class CheckoutEvent extends CartEvent {
  CheckoutEvent();

  @override
  List<Object> get props => null;
}

class CorrectData extends CartEvent {
  CorrectData();

  @override
  List<Object> get props => throw UnimplementedError();
}

class AfterGeoCheckout extends CartEvent {
  final Order order;

  AfterGeoCheckout({this.order});

  @override
  List<Object> get props => [order];
}

class FinalCheck extends CartEvent {
  final Order order;

  FinalCheck(this.order);

  @override
  List<Object> get props => [order];
}

class ToChat extends CartEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}

class Start extends CartEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}

class ExitCart extends CartEvent {
  @override
  List<Object> get props => [];
}
