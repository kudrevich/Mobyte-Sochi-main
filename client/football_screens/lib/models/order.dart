import 'package:flutter/cupertino.dart';

import 'item.dart';
import 'user.dart';

class Order {
  double _price;
  Map<Item, int> _basket;

  @required
  final User user;

  Order({
    @required this.user,
    @required List<Item> dishList,
  }) {
    this._basket = {};
    _price = 0.0;
    for (var dishKey in user.basket.keys) {
      if (dishKey == " ") continue;
      _price += double.parse(
              // заполнение цены => цена = цена_блюда*кол-во_единиц_блюда
              dishList.where((x) => x.id == dishKey).toList()[0].price) *
          user.basket[dishKey];
      this._basket[dishList.where((x) => x.id == dishKey).toList()[0]] =
          user.basket[dishKey];
    }

    _price -= _price * user.sale / 100;
  }

  double getRealPrice() {
    return _price;
  }

  String getPrice() {
    return _price.toString() + "0" + "₽";
  }

  String makeCheck() {
    String check = "";
    check += "Заказ:\n";

    for (var dishKey in _basket.keys) {
      check +=
          dishKey.name + " кол - во: " + _basket[dishKey].toString() + "\n";
    }

    check += "Итоговая стоимость: " + _price.toString() + " рублей\n";

    return check;
  }
}
