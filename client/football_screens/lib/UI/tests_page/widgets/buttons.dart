import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Helpers.responsiveHeight(50, context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
          child: Center(
            child: Text(
              'Continue',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Helpers.responsiveHeight(18, context),
              ),
            ),
          ),
        ),
        SizedBox(
          height: Helpers.responsiveHeight(15, context),
        ),
        Container(
          height: Helpers.responsiveHeight(50, context),
          width: Helpers.responsiveWidth(140, context),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).accentColor),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              'Skip',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: Helpers.responsiveHeight(18, context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
