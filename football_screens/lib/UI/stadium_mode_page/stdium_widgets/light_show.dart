import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';
class LightShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: Helpers.responsiveHeight(60, context),
          ),
          Text(
            'Световое шоу',
            style: TextStyle(
              color: Colors.black,
              fontSize: Helpers.responsiveHeight(36, context),
            ),
          ),
          SizedBox(
            height: Helpers.responsiveHeight(200, context),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Helpers.responsiveWidth(50, context),
            ),
            child: Text(
              'Поднимите экран вспышкой в сторону игрового поля',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffA3AEB3),
                fontSize: Helpers.responsiveHeight(24, context),
              ),
            ),
          ),
      ],
      
    );
  }
}