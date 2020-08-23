import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';

class ExpandedNewsItem extends StatelessWidget {
  final String title;
  final String body;
  final String date;
  //TODO: Передавать сюда просто объект класса News
  ExpandedNewsItem({
    @required this.title,
    @required this.body,
    @required this.date,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //TODO передать сюда картинку
        Container(
          margin: EdgeInsets.only(
            top: Helpers.responsiveHeight(10, context),
          ),
          height: Helpers.responsiveHeight(250, context),
          width: Helpers.responsiveHeight(250, context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage("assets/pic.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: Helpers.responsiveHeight(15, context),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Helpers.responsiveWidth(30, context),
                  ),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: Helpers.responsiveHeight(30, context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Helpers.responsiveWidth(35, context),
                  ),
                  child: Text(
                    body,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: Helpers.responsiveHeight(30, context),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: Helpers.responsiveHeight(10, context),
                  ),
                  child: Text(date),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
