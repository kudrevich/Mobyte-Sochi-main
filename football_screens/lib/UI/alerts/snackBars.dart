import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void bottomLoadingBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  key.currentState.removeCurrentSnackBar();
  Scaffold.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 8),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircularProgressIndicator(),
          Text(
            "Идёт авторизация",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              fontSize: 15,
            ),
          ),
        ],
      ),
    ),
  );
}

void bottomSuccess(BuildContext context, GlobalKey<ScaffoldState> key) {
  key.currentState.removeCurrentSnackBar();
  Scaffold.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 2),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.check_circle_outline),
          Text(
            "Вы вошли в аккаунт",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              fontSize: 15,
            ),
          ),
        ],
      ),
    ),
  );
}

void dishAddStatus(
    BuildContext context, bool added, GlobalKey<ScaffoldState> key) {
  key.currentState.removeCurrentSnackBar();
  Scaffold.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 2),
      content: added ? Text("Товар добавлен") : Text("Товар НЕ добавлен"),
    ),
  );
}

void bottomMessage(BuildContext context, String caption, IconData icon,
    GlobalKey<ScaffoldState> key) {
  key.currentState.removeCurrentSnackBar();
  Scaffold.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 2),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon),
          Text(
            caption,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              fontSize: 15,
            ),
          ),
        ],
      ),
    ),
  );
}
