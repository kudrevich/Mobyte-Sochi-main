import 'package:flutter/material.dart';

Widget requestErrorScreen(
    {@required String caption,
    Function onPressed,
    Function onLongPress,
    @required BuildContext context}) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            caption,
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              color: Theme.of(context).textTheme.bodyText2.color,
              fontSize: MediaQuery.of(context).size.height * (21 / 1000),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            child: Text(
              "Обновить",
              style: TextStyle(
                fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                color: Theme.of(context).textTheme.bodyText1.color,
                fontSize: MediaQuery.of(context).size.height * (24 / 740),
              ),
            ),
            onPressed: onPressed,
          )
        ],
      ),
    ),
  );
}
