import 'package:flutter/material.dart';
import 'package:football_screens/UI/item_page/widgets/pop_back_button.dart';
import 'package:football_screens/UI/widgets/animated_text.dart';
import 'package:football_screens/helpers/helpers.dart';


class Caraoce extends StatefulWidget {
  Widget body;
  Caraoce({this.body});
  @override
  _CaraoceState createState() => _CaraoceState();
}

class _CaraoceState extends State<Caraoce> {
  int _sector = 1;
  int _tribuna = 1;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow()]
            ),
            padding: EdgeInsets.only(
              top: Helpers.responsiveHeight(32, context),
              right: Helpers.responsiveWidth(24, context),
              left: Helpers.responsiveWidth(24, context),
              bottom: Helpers.responsiveHeight(8, context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PopBackButton(),
                Text(
                  'На стадионе',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Helpers.responsiveHeight(21, context),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Helpers.responsiveHeight(20, context),
          ),
          SizedBox(
            height: Helpers.responsiveHeight(60, context),
          ),
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
      ),
    );
  }
}
