import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';

class DishName extends StatelessWidget {
  final String title;
  DishName({this.title = 'Aнна Павловна'});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    Helpers _helpers = new Helpers(height, 0);

    return Text(
      title,
      style: TextStyle(
        color: Theme.of(context).textTheme.bodyText1.color,
        fontSize: _helpers.adaptiveHeight(21),
      ),
    );
  }
}
