import 'package:flutter/material.dart';
import 'package:football_screens/helpers/hex_color.dart';


class ListItem extends StatelessWidget {
  final String type;
  final String value;
  final double height;
  final double width;

  ListItem(this.type, this.value, this.height, this.width);

  double _adaptationHeight(double myHeight){
    return height * (myHeight / 740);
  }
  
  double _adaptationWidth(double myWidth) {
    return width * (myWidth / 360);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 0.5,
          color: Color(HexColor.getColorFromHex("#E5E5E5")),
        )
      ),
      height: _adaptationHeight(60),
      padding: EdgeInsets.symmetric(horizontal: _adaptationWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            type,
            style: Theme.of(context).textTheme.body1,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.body1,
          ),
        ],
      ),
    );
  }
}
