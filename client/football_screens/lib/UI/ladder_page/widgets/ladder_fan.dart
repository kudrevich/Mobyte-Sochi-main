import 'package:flutter/material.dart';
import 'package:football_screens/UI/constants.dart';

import '../../../helpers/helpers.dart';
import '../../../helpers/helpers.dart';
import '../../../helpers/helpers.dart';
import '../../../helpers/helpers.dart';

class LadderFan extends StatelessWidget {
  LadderFan({this.name, this.secondName, this.score, this.place, this.url});
  String name;
  String secondName;
  int score;
  String url;
  int place;
  @override
  Widget build(BuildContext context) {
    print(url);
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: Helpers.responsiveHeight(64, context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          place <= 3
              ? Positioned(
                  left: Helpers.responsiveHeight(8, context),
                  child: Container(
                    child: Image.asset(
                      'assets/${place}_place.png',
                    ),
                  ),
                )
              : Positioned(
                  left: Helpers.responsiveWidth(4, context),
                  child: Container(
                    constraints: BoxConstraints(
                        minWidth: Helpers.responsiveWidth(32, context)),
                    margin: EdgeInsets.only(
                      right: Helpers.responsiveWidth(8, context),
                    ),
                    child: Center(
                      child: Text(
                        place.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
          Positioned(
            left: Helpers.responsiveWidth(57, context),
            child: Container(
              width: Helpers.responsiveHeight(32, context),
              height: Helpers.responsiveHeight(32, context),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(url),
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: Helpers.responsiveWidth(104, context),
            child: Container(
              width: Helpers.responsiveWidth(163, context),
              child: Text(
                name + " " + secondName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            right: Helpers.responsiveWidth(30, context),
            child: Text(
              score.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
