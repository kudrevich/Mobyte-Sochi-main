import 'package:flutter/material.dart';

import '../../../helpers/helpers.dart';
import '../../../helpers/helpers.dart';
import '../../../helpers/helpers.dart';
import '../../../helpers/helpers.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: Helpers.responsiveHeight(32, context),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: Helpers.responsiveWidth(13, context),
              right: Helpers.responsiveWidth(13, context),
            ),
            child: Text(
              '№',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            color: Theme.of(context).backgroundColor,
            width: Helpers.responsiveWidth(2, context),
          ),
          Container(
            width: Helpers.responsiveWidth(188, context),
            margin: EdgeInsets.only(
              left: Helpers.responsiveWidth(11, context),
              right: Helpers.responsiveWidth(11, context),
            ),
            child: Text(
              'Болельщик',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            color: Theme.of(context).backgroundColor,
            width: Helpers.responsiveWidth(2, context),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(
              left: Helpers.responsiveWidth(28, context),
              right: Helpers.responsiveWidth(28, context),
            ),
            child: Text(
              'Очки',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
