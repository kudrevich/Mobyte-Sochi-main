import 'package:flutter/material.dart';
import 'package:football_screens/UI/item_page/widgets/pop_back_button.dart';
import 'package:football_screens/helpers/helpers.dart';

class AppbarChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Helpers _helpers = new Helpers(height, width);

    return Container(
      padding: EdgeInsets.only(
        left: _helpers.adaptiveWidth(15),
        right: _helpers.adaptiveWidth(15),
        bottom: _helpers.adaptiveHeight(15),
        top: _helpers.adaptiveHeight(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back,
              size: Helpers.responsiveHeight(24, context),
            ),
          ),
          Text(
            "Чат болельщиков",
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              color: Theme.of(context).textTheme.bodyText1.color,
              fontSize: _helpers.adaptiveHeight(21),
            ),
          ),
          SizedBox(
            width: Helpers.responsiveWidth(24, context),
          ),
        ],
      ),
    );
  }
}
