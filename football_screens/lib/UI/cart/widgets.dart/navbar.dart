import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/UI/alerts/snackBars.dart';
import 'package:football_screens/UI/constants.dart';
import 'package:football_screens/bloc/cart_bloc/cart_bloc.dart';
import 'package:football_screens/helpers/helpers.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';

class Navbar extends StatelessWidget {
  Navbar(this._scaffoldKey);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Helpers _helpers = new Helpers(height, width);

    return Container(
      padding: EdgeInsets.only(left: _helpers.adaptiveWidth(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Итого:',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2.color,
                  fontFamily: Theme.of(context).textTheme.bodyText2.fontFamily,
                  fontSize: _helpers.adaptiveHeight(16),
                ),
              ),
              Text(
                cartBloc.order.getPrice(),
                style: GoogleFonts.roboto(
                  fontSize: _helpers.adaptiveHeight(20),
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              if (MyApp.user.basket.length > 0)
                cartBloc.add(CheckoutEvent());
              else
                bottomMessage(
                    context, "Корзина пуста", Icons.clear, _scaffoldKey);
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
                  'Заказать',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color,
                    fontSize: _helpers.adaptiveWidth(18),
                    fontWeight: FontWeight.bold,
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
