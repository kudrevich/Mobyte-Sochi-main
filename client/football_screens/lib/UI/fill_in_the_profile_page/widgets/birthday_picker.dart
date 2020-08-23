import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:football_screens/helpers/globals.dart';
import 'package:football_screens/main.dart';




class BirthdayPicker extends StatefulWidget {
  @override
  _BirthdayPickerState createState() => _BirthdayPickerState();
}

class _BirthdayPickerState extends State<BirthdayPicker> {
  void _showPicker() {
   
    showDatePicker(
      context: myGlobals.globalKey.currentContext,
      initialDate:
          MyApp.user.birthday == null
                          ? DateTime(1980)
                          : MyApp.user.birthday,
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    ).then((DateTime value) {
      setState(() {
        
      });
      MyApp.user.birthday=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('День рождения'),
        ListTile(
                      title: Text(
                         MyApp.user.birthday == null
                              ? 'Выбрать дату'
                              : formatDate(
                                  MyApp.user.birthday, [dd, '/', mm, '/', yyyy]),
                          style: Theme.of(context).textTheme.subtitle),
                      trailing: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: _showPicker,
                      ),
                    ),
      ],
    );
  }
}
