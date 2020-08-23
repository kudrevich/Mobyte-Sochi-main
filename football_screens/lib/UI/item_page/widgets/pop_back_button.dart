import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';

class PopBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    Helpers _helpers = new Helpers(height, 0);

    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: _helpers.adaptiveHeight(40),
        width: _helpers.adaptiveHeight(40),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFD3DADD),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        child: Icon(Icons.keyboard_arrow_left),
      ),
    );
  }
}
