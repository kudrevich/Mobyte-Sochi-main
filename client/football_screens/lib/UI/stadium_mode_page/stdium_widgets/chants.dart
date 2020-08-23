import 'package:flutter/material.dart';
import 'package:football_screens/UI/widgets/animated_text.dart';
import 'package:football_screens/helpers/helpers.dart';
class Chants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            'Кричалка',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: Helpers.responsiveHeight(36, context),
            ),
          ),
          SizedBox(
            height: Helpers.responsiveHeight(29, context),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Helpers.responsiveWidth(50, context),
            ),
            child: Text(
              'Поддержи свою команду:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffA3AEB3),
                fontSize: Helpers.responsiveHeight(24, context),
              ),
            ),
          ),
           SizedBox(
            height: Helpers.responsiveHeight(70, context),
          ),
        Container(
          child:AnimatedText(),
        ),
      ],
    );
  }
}