import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';

class AppBarChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Helpers.responsiveHeight(35, context),
        horizontal: Helpers.responsiveWidth(30, context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.arrow_back,
          ),
          Text(
            'Es ist ein lang',
          ),
          Icon(
            Icons.search,
          ),
        ],
      ),
    );
  }
}
