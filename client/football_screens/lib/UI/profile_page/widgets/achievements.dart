import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';

class Achievements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          width: Helpers.responsiveWidth(300, context),
          height: Helpers.responsiveHeight(100, context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
        ),
        Container(
          width: Helpers.responsiveWidth(300, context),
          height: Helpers.responsiveHeight(100, context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
        ),
        Positioned(
          top: -Helpers.responsiveHeight(6, context),
          left: Helpers.responsiveWidth(15, context),
          child: Container(
            width: Helpers.responsiveWidth(90, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Text(
              'Достижения',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 11,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
