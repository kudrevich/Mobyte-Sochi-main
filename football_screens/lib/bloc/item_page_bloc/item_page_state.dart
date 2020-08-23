part of 'item_page_bloc.dart';

abstract class ItemPageState extends Equatable {
  const ItemPageState();
}

class ItemPageInitial extends ItemPageState {
  final BlocKey key;

  ItemPageInitial(this.key);
  @override
  List<Object> get props => [key];
}

class Loading extends ItemPageState {
  final String caption;

  Loading(this.caption);

  @override
  List<Object> get props => [caption];
}

class OnDispose extends ItemPageState {
  @override
  List<Object> get props => [];
}
