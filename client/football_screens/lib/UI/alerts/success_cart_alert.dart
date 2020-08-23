import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/bloc/cart_bloc/cart_bloc.dart';

/// алерт для подтверждения
void warningAlert(BuildContext context, String caption, CartBloc bloc) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.green,
        content: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            children: <Widget>[
              Container(
                  decoration: new BoxDecoration(
                    color: Colors.white10,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check)),
              Text(caption),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("Ок"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}
