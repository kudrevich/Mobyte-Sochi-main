import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/UI/cart/cart.dart';
import 'package:football_screens/UI/constants.dart';
import 'package:football_screens/bloc/cart_bloc/cart_bloc.dart';
import 'package:football_screens/bloc/item_page_bloc/item_page_bloc.dart'
    as item;
import 'package:football_screens/bloc/market_bloc/market_bloc.dart';
import 'package:football_screens/helpers/helpers.dart';

import '../../main.dart';

Widget cartButton(BuildContext context, double height, double width,
    {item.ItemPageBloc itemBloc, bool isItem = false}) {
  return GestureDetector(
    onTap: () async {
      FocusScope.of(context).unfocus();
      Scaffold.of(context).removeCurrentSnackBar();
      final page = BlocProvider<CartBloc>(
          create: (BuildContext context) =>
              CartBloc() //Передаём ему список всех блюд
                ..add(Start()),
          child: CartPage());
      await Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
      if (isItem) itemBloc.add(item.Update());
      MyApp.marketBloc.add(Update());
    },
    child: Container(
      padding: EdgeInsets.symmetric(
        vertical: Helpers.responsiveHeight(10, context),
      ),
      width: Helpers.responsiveWidth(54, context),
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/icons/qwe.png',
            width: Helpers.responsiveHeight(16, context),
            height: Helpers.responsiveHeight(16, context),
          ),
          Text(
            "${MyApp.user.basket.length}", //Лютый тернарник на избежание проблем с get from null
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    ),
  );
}
