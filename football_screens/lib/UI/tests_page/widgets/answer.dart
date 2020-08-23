import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';

class Answer extends StatelessWidget {
  Answer({this.text = '1'});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Helpers.responsiveHeight(80, context),
      width: Helpers.responsiveHeight(80, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).accentColor,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: Helpers.responsiveHeight(30, context),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
