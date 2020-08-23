import 'dart:convert';
import 'dart:typed_data';

import 'package:football_screens/helpers/requests.dart';

enum Gender { male, female }

class User {
  int id;
  String name = '';
  String surname = '';
  String email = '';
  String phoneNumber = '';
  String caption = '';
  Gender gender;
  // List<String> achievments = [];
  double rank = 0;
  String avatarUrl;
  Uint8List avatar;
  DateTime birthday;
  int place;
  double sale = 0.0;

  Map<String, int> basket;
  Map<int, bool> achivements;

  void getInfoFromMap(Map<String, dynamic> json) {
    id = json["id"];
    name = json['name'];
    surname = json['surname'];
    email = json['email'];
    gender = json['gender'] == "male"
        ? Gender.male
        : json['gender'] == '' ? null : Gender.female;
    phoneNumber = json['phone_number'];
    rank = json['rank'];
    caption = json['caption'];
    avatarUrl = json['avatar']['url'];
    basket = {};
    place = json["place"] ?? 0;
    print(place);
    if (place != 0 && place <= 10) sale = 15.0;
    final b = (json['birthday'] as String).split(' ');
    if (b.length != 1)
      birthday = DateTime(int.parse(b[0]), int.parse(b[1]), int.parse(b[2]));
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surname': surname,
      'email': email,
      'caption': caption,
      'birthday': birthday == null
          ? ''
          : birthday.year.toString() +
              ' ' +
              birthday.month.toString() +
              ' ' +
              birthday.day.toString(),
      'gender': gender == Gender.male ? 'male' : 'female',
    };
  }

  void clear() {
    name = '';
    surname = '';
    email = '';
    phoneNumber = '';
    gender = null;
    //achievments = [];
    gender = null;
    rank = 0;
    avatar = null;
  }

  /// Добавление единицы блюда в корзину
  void addToBasket({String itemID}) {
    if (basket.containsKey(itemID)) if (basket[itemID] < 99)
      basket[itemID]++;
    else
      return;
    else
      basket[itemID] = 1;

    Requests.updateBasket(basket);
  }

  /// Удаление едицницы блюда из корзины
  void decDishFromBasket({String itemID}) {
    if (basket.containsKey(itemID)) if (basket[itemID] > 1)
      basket[itemID]--;
    else {
      basket.remove(itemID);
    }

    Requests.updateBasket(basket);
  }

  /// Удаление блюда из корзины
  void remFromBasket({String itemID}) {
    if (basket.containsKey(itemID)) basket.remove(itemID);

    Requests.updateBasket(basket);
  }

  ///Очистка корзины
  void clearBasket() {
    basket.clear();
    Requests.updateBasket(basket);
  }
}
