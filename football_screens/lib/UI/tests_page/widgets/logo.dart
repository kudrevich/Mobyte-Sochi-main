import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Helpers.responsiveHeight(145, context),
      width: Helpers.responsiveHeight(145, context),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/item.jpg")
        )
      ),
    );
  }
}
