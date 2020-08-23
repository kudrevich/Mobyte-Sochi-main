import 'package:flutter/material.dart';
import 'package:football_screens/UI/alerts/success_cart_alert.dart';
import 'package:football_screens/bloc/cart_bloc/cart_bloc.dart';
import 'package:football_screens/main.dart';
import 'package:football_screens/models/order.dart';

void empty(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.red[200],
        content: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white10,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.clear),
              ),
              Text(
                "Корзина пуста!",
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1.color,
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Ок",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1.color,
                fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                fontSize: 16,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          )
        ],
      );
    },
  );
}

Future<void> showEnableLocationDialog(BuildContext context) async {
  var height = MediaQuery.of(context).size.height;
  double elevation = 0;
  double _adaptiveHeight(double size) => height * (size / 740);
  return showDialog<void>(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Theme.of(context).cardColor,
          title: Text(
            'Внимание!',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              color: Theme.of(context).textTheme.bodyText1.color,
              fontSize: _adaptiveHeight(16),
            ),
          ),
          content: Text(
            'Необходимо включить передачу геоданных',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              color: Theme.of(context).textTheme.bodyText1.color,
              fontSize: _adaptiveHeight(16),
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              elevation: elevation,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Theme.of(context).primaryColor,
              child: Text(
                'Настройки',
                style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                  color: Colors.white,
                  fontSize: _adaptiveHeight(14),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}

Future<void> showMyDialog(
    BuildContext context, Order order, CartBloc bloc) async {
  double elevation = 0;
  var height = MediaQuery.of(context).size.height;
  double _adaptiveHeight(double size) => height * (size / 740);
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Theme.of(context).cardColor,
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                "Заказ принят",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                  color: Theme.of(context).textTheme.bodyText1.color,
                  fontSize: _adaptiveHeight(14),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          RaisedButton(
            elevation: elevation,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Theme.of(context).primaryColor,
            child: Text(
              'Ок',
              style: TextStyle(
                fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                color: Colors.white,
                fontSize: _adaptiveHeight(14),
              ),
            ),
            onPressed: () {
              //sendOrder(order);
              //bloc.user.clearBasket();
              MyApp.user.clearBasket();
              Navigator.pop(context);
              bloc.add(ExitCart());
            },
          ),
        ],
      );
    },
  );
}
