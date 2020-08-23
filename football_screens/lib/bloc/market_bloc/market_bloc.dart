import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:football_screens/helpers/requests.dart';
import 'package:football_screens/models/blocKey.dart';
import 'package:football_screens/models/item.dart';
import 'package:football_screens/models/itemcategory.dart';
import 'package:football_screens/models/server_category.dart';
import 'package:meta/meta.dart';

import '../../helpers/helpers.dart';
import '../../main.dart';

part 'market_event.dart';
part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  MarketBloc() : super(Loading(caption: ""));

  int selectedIndex = 0;

  CategoryTable _categoryTable;
  CategoryTable get categoryTable => this._categoryTable;

  List<ItemCategory> _categories;
  List<ItemCategory> get categories => this._categories;

  @override
  Stream<MarketState> mapEventToState(
    MarketEvent event,
  ) async* {
    if (event is Update) {
      List<Item> listOfItems = List<Item>();
      try {
        print("1");
        listOfItems = await Requests.getItems();
        _categoryTable = await Requests.getCatTable();
        print("2");
        _categories =
            Helpers.getDishCategories(listOfItems, _categoryTable.categories);
        selectedIndex = 0; //Переключаемся обратно на категорию "Все"

        yield MarketInitial(
          key: BlocKey(),
          category: _categories[0],
        );
      } catch (e) {
        yield errorHandler(e);
      }
    }
    if (event is SelectCategory) {
      yield MarketInitial(key: BlocKey(), category: event.category);
    }
    if (event is Search) {
      String name = "custom"; //Название категории
      var temp = Helpers.getCustomDishes(event.search, _categories[0].items);
      ItemCategory customCategory =
          ItemCategory(name: name, items: temp, iconIndex: 0);
      selectedIndex = 0;

      yield MarketInitial(key: BlocKey(), category: customCategory);
    }
    if (event is AddToBasket) {
      try {
        MyApp.user.addToBasket(itemID: event.dishId);
        yield Loading(caption: "Добавление");
        yield MarketInitial(
            key: BlocKey(),
            category: _categories[selectedIndex],
            dishAdding: true,
            dishAddedSuccessfully: true);
      } on TimeoutException {
        yield MarketInitial(
            key: BlocKey(),
            category: _categories[selectedIndex],
            dishAdding: true,
            dishAddedSuccessfully: false);
      } on RequestErrorExeption {
        yield MarketInitial(
            key: BlocKey(),
            category: _categories[selectedIndex],
            dishAdding: true,
            dishAddedSuccessfully: false);
      } on SocketException catch (_) {
        yield EState(caption: "Ошибка подключения");
      }
    }
  }

  errorHandler(e) {}
}
