import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';

class Question extends StatelessWidget {
  Question(
      {this.text =
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras.'});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: Helpers.responsiveHeight(24, context),
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
