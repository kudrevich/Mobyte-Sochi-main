import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';

class DishSubtitle extends StatelessWidget {
  final String subtitle;
  DishSubtitle({this.subtitle = '110 г / 319 каллорий'});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    Helpers _helpers = new Helpers(height, 0);

    return Text(
      subtitle,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: _helpers.adaptiveHeight(16),
          color: Color(0xffA3AEB2),
          fontWeight: FontWeight.w300),
    );
  }
}
