import 'package:flutter/material.dart';

import '../../../helpers/helpers.dart';

class NameBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Helpers _helpers = new Helpers(height, width);

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: _helpers.adaptiveWidth(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Футбольный клуб",
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2.color,
                  fontFamily: Theme.of(context).textTheme.bodyText2.fontFamily,
                  fontSize: _helpers.adaptiveHeight(18),
                ),
              ),
              SizedBox(
                height: _helpers.adaptiveHeight(4),
              ),
              Text(
                "Сочи",
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1.color,
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: _helpers.adaptiveHeight(32),
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: _helpers.adaptiveHeight(38),
            backgroundImage: ResizeImage(
              AssetImage('assets/icons/sochi.png'),
              height: (_helpers.adaptiveHeight(38) * 4).ceil(),
              width: (_helpers.adaptiveHeight(38) * 4).ceil(),
            ),
          ),
        ],
      ),
    );
  }
}
