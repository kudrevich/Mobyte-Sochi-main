import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:football_screens/models/blocKey.dart';
import 'package:football_screens/models/item.dart';

import '../../main.dart';

part 'item_page_event.dart';
part 'item_page_state.dart';

class ItemPageBloc extends Bloc<ItemPageEvent, ItemPageState> {
  Item _item;
  Item get item => this._item;

  ItemPageBloc({@required Item item}) : super(ItemPageInitial(BlocKey())) {
    _item = item;
  }

  @override
  Stream<ItemPageState> mapEventToState(
    ItemPageEvent event,
  ) async* {
    if (event is AddToBasket) {
      try {
        MyApp.user.addToBasket(itemID: event.itemId);
      } finally {
        yield ItemPageInitial(BlocKey());
      }
    }

    if (event is RemFromBasket) {
      try {
        MyApp.user.decDishFromBasket(itemID: event.itemId);
      } finally {
        yield ItemPageInitial(BlocKey());
      }
    }
    if (event is Update) {
      yield ItemPageInitial(BlocKey());
    }
  }
}
