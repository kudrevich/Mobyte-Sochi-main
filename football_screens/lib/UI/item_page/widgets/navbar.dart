import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/UI/constants.dart';
import 'package:football_screens/bloc/item_page_bloc/item_page_bloc.dart';
import 'package:football_screens/helpers/helpers.dart';

import '../../../main.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Helpers _helpers = new Helpers(height, width);

    // ignore: close_sinks
    var itemPage = BlocProvider.of<ItemPageBloc>(context);

    return Container(
      padding: EdgeInsets.only(left: _helpers.adaptiveWidth(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              itemPage.add(RemFromBasket(itemId: itemPage.item.id));
            },
            child: Icon(
              Icons.remove,
              color: Color(0xffA3AEB2),
              size: _helpers.adaptiveHeight(24),
            ),
          ),
          Container(
            child: Text(
              MyApp.user.basket.containsKey(itemPage.item.id)
                  ? MyApp.user.basket[itemPage.item.id].toString()
                  : "0",
              style: TextStyle(
                fontSize: _helpers.adaptiveHeight(18),
                color: Theme.of(context).textTheme.bodyText1.color,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              itemPage.add(AddToBasket(itemId: itemPage.item.id));
            },
            child: Icon(
              Icons.add,
              size: _helpers.adaptiveHeight(24),
              color: Color(0xffA3AEB2),
            ),
          ),
          SizedBox(
            width: _helpers.adaptiveWidth(5),
          ),
          GestureDetector(
            onTap: () {
              itemPage.add(AddToBasket(itemId: itemPage.item.id));
            },
            child: Container(
              width: _helpers.adaptiveWidth(220),
              height: _helpers.adaptiveHeight(52),
              decoration: BoxDecoration(
                color: yellow,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_helpers.adaptiveWidth(10)),
                    bottomLeft: Radius.circular(_helpers.adaptiveWidth(10))),
              ),
              child: Center(
                child: Text(
                  'Добавить',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyText1.color,
                    fontSize: _helpers.adaptiveHeight(18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
