import 'dart:typed_data';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:football_screens/bloc/auth_bloc/autorisation_bloc.dart';
import 'package:football_screens/helpers/globals.dart';
import 'package:football_screens/models/item.dart';
import 'dart:convert';

import 'package:football_screens/models/itemcategory.dart';
import 'package:football_screens/models/server_category.dart';

import 'package:football_screens/main.dart';
import 'package:image_picker/image_picker.dart';

class Helpers {
  static String getOnlyNumber(String number) {
    var a = number.split(new RegExp('[ --+()]'));
    String result = '';
    for (var c in a) result += c;
    return result;
  }

  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await (DataConnectionChecker().hasConnection);
    return connectivityResult;
  }

  static Map<String, dynamic> getResponseBody(String responseBody) {
    return json.decode(responseBody);
  }

  static void showRequestExitFromProfileDialog() {
    // ignore: close_sinks
    final auth = MyApp.authBloc;
    var context = myGlobals.globalKey.currentContext;
    showDialog(
        context: context,
        child: Platform.isAndroid
            ? AlertDialog(
                content: Text(
                  'Вы уверены?',
                  style: TextStyle(
                    fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                    fontSize: 16,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                      child: Text(
                        'Да',
                        style: TextStyle(
                          fontFamily:
                              Theme.of(context).textTheme.body2.fontFamily,
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        auth.add(LogOut());
                        //userData.add(Exit());
                      }),
                  FlatButton(
                      child: Text(
                        'Нет',
                        style: TextStyle(
                          fontFamily:
                              Theme.of(context).textTheme.body2.fontFamily,
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              )
            : CupertinoAlertDialog(
                content: Text(
                  'Вы уверены?',
                  style: TextStyle(
                    fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                    fontSize: 16,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                      child: Text(
                        'Да',
                        style: TextStyle(
                          fontFamily:
                              Theme.of(context).textTheme.body2.fontFamily,
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        auth.add(LogOut());
                        //   userData.add(Exit());
                      }),
                  FlatButton(
                      child: Text(
                        'Нет',
                        style: TextStyle(
                          fontFamily:
                              Theme.of(context).textTheme.body2.fontFamily,
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              ));
  }

  static void showWarningDialog(String title, String body) {
    showDialog<void>(
      context: myGlobals.globalKey.currentContext,
      builder: (BuildContext context) {
        return Platform.isAndroid
            ? AlertDialog(
                title: Text(title),
                content: Text(
                  body,
                  style: Theme.of(context).textTheme.body1,
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      'Ок',
                      style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.body2.fontFamily,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            : CupertinoAlertDialog(
                title: Text(title),
                content: Text(
                  body,
                  style: Theme.of(context).textTheme.body1,
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      'Ок',
                      style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.body2.fontFamily,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
      },
    );
  }

  double height, width;
  Helpers(this.height, this.width);

  double adaptiveHeight(double size) {
    return height * (size / 740);
  }

  double adaptiveWidth(double size) {
    return width * (size / 360);
  }

  /// Получение блюд по запросу(поиск)
  static List<Item> getCustomDishes(String request, List<Item> dishes) {
    Set<Item> customDishes = {};
    request = request.toLowerCase();
    var reqWords = request.split(" ");

    for (var word in reqWords)
      for (var dish in dishes) {
        String name = dish.name.toLowerCase();
        String caption1 = dish.caption1.toLowerCase();
        String caption2 = dish.caption2.toLowerCase();
        String caption3 = dish.caption3.toLowerCase();
        if (name.contains(word))
          customDishes.add(dish);
        else if (caption1.contains(word))
          customDishes.add(dish);
        else if (caption2.contains(word))
          customDishes.add(dish);
        else if (caption3.contains(word)) customDishes.add(dish);
      }

    return customDishes.toList();
  }

  /// Получение списка DishCategory
  static List<ItemCategory> getDishCategories(
      List<Item> items, Map<int, ServerCategory> categories) {
    List<ItemCategory> dishCategories = [];
    dishCategories.add(
        ItemCategory(name: categories[0].name, items: items, iconIndex: 0));
    for (var key in categories.keys) {
      if (key == 0 ||
          items.where((x) => x.categoryId == key).toList().length == 0)
        continue;
      var catdishes = items.where((x) => x.categoryId == key).toList();
      dishCategories.add(ItemCategory(
          name: categories[key].name,
          items: catdishes,
          iconIndex: categories[key].iconIndex));
    }
    return dishCategories;
  }

  static double responsiveHeight(double size, BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return height * (size / 740);
  }

  static double responsiveWidth(double size, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width * (size / 360);
  }

  static Future<Uint8List> getImage() async {
    ImagePicker imagePicker = ImagePicker();
    ImageSource source = ImageSource.gallery;

    var timg = await ImagePicker.pickImage(source: source, imageQuality: 20);
    if (timg == null)
      return null;
    else
      return await timg.readAsBytes();
  }
}
