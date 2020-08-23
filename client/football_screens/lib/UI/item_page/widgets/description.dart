import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';

class Description extends StatelessWidget {
  final String description;
  Description(this.description);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Helpers _helpers = new Helpers(height, width);

    return Container(
      padding: EdgeInsets.only(
        right: _helpers.adaptiveWidth(24),
        left: _helpers.adaptiveWidth(24),
        bottom: _helpers.adaptiveHeight(10),
      ),
      child: Column(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Описание',
            style: TextStyle(
              fontSize: _helpers.adaptiveHeight(18),
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
          ),
          SizedBox(
            height: _helpers.adaptiveHeight(6),
          ),
          Text(
            description,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
              fontSize: _helpers.adaptiveHeight(16),
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
