import 'package:flutter/material.dart';

Widget loadingScreen(
    {@required String caption, @required BuildContext context}) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            caption,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 65,
            width: 65,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
              backgroundColor: Theme.of(context).accentColor,
              strokeWidth: 8,
            ),
          ),
        ],
      ),
    ),
  );
}
