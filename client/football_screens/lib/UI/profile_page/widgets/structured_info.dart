import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_screens/UI/fill_in_the_profile_page/fill_in_the_profile_page.dart';
import 'package:football_screens/bloc/auth_bloc/autorisation_bloc.dart';
import 'package:football_screens/helpers/helpers.dart';
import 'package:football_screens/main.dart';
import 'package:football_screens/models/user.dart';

import './list_item.dart';

class StructuredInfo extends StatelessWidget {
  final double height;
  final double width;

  StructuredInfo(this.height, this.width);

  double _adaptationHeight(double myHeight) {
    return height * (myHeight / 740);
  }

  double _adaptationWidth(double myWidth) {
    return width * (myWidth / 360);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final userData = MyApp.userBloc;
    // ignore: close_sinks
    final auth = MyApp.authBloc;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: _adaptationWidth(20)),
          child: Align(
            alignment: Alignment.topLeft,
            child: ListTile(
                title: Text(
                  "Основные данные",
                  style: Theme.of(context).textTheme.subhead,
                ),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => FillInTheProfilePage()));
                  },
                  child: Image.asset(
                    "assets/edit.png",
                    height: _adaptationHeight(27),
                    width: _adaptationHeight(27),
                  ),
                )),
          ),
        ),
        SizedBox(
          height: _adaptationHeight(12),
        ),
        ListItem("Фамилия", MyApp.user.surname, height, width),
        ListItem("Имя", MyApp.user.name, height, width),
        ListItem(
            "Пол",
            MyApp.user.gender==null?'':MyApp.user.gender == Gender.male ? 'Мужской' : 'Женский',
            height,
            width),
        ListItem("Телефон", MyApp.user.phoneNumber, height, width),
        ListItem("E-mail", MyApp.user.email, height, width),
        ListItem("Дата рождения",  MyApp.user.birthday==null?'':formatDate(
                                  MyApp.user.birthday, [dd, '/', mm, '/', yyyy]), height, width),
  
        SizedBox(
          height: _adaptationHeight(20),
        ),
        FlatButton(
          child: Text(
            "Выйти",
            style: Theme.of(context).textTheme.body2,
          ),
          onPressed: () => Helpers.showRequestExitFromProfileDialog(),
        ),
         SizedBox(
          height: _adaptationHeight(20),
        ),
      ],
    );
  }
}
