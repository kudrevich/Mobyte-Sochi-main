import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';
import 'package:football_screens/main.dart';
import 'package:football_screens/models/user.dart';



class ChooseGender extends StatefulWidget {
  ChooseGender({Key key}) : super(key: key);

  @override
  _ChooseGenderState createState() => _ChooseGenderState();
}

class _ChooseGenderState extends State<ChooseGender> {
  Gender _character = MyApp.user.gender;

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('Пол:'),
          ListTile(
            title: const Text('Мужской'),
            leading: Radio(
              value: Gender.male,
              groupValue: _character,
              onChanged: (Gender value) {
                setState(() {
                  _character = value;
                  MyApp.user.gender=value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Женский'),
            leading: Radio(
              value: Gender.female,
              groupValue: _character,
              onChanged: (Gender value) {
                setState(() {
                  _character = value;
                   MyApp.user.gender=value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}