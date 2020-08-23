import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';

class WaitFleshmob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Helpers.responsiveWidth(50, context),
        ),
        child: Text(
          'Администратор скоро запустит флешмоб',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xffA3AEB3),
            fontSize: Helpers.responsiveHeight(24, context),
          ),
        ),
      ),
      SizedBox(
        height: Helpers.responsiveHeight(100, context),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Helpers.responsiveWidth(50, context),
        ),
        child: Text(
          'Оставайтесь на экране, чтобы принять участие',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xffA3AEB3),
            fontSize: Helpers.responsiveHeight(24, context),
          ),
        ),
      ),
      SizedBox(
        height: Helpers.responsiveHeight(60, context),
      ),
      Container(
        height: 177,
        width: 177,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logo.png'),
          ),
        ),
      ),
    ]);
  }
}
