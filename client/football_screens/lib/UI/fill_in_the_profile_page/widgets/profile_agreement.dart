import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/bloc/user_bloc/user_bloc.dart';
import 'package:football_screens/main.dart';

class ProfileAgreement extends StatefulWidget {
  final double size;
  final double width;

  ProfileAgreement(this.size, this.width);

  double _adaptationHeight(double mySize) {
    return size * (mySize / 740);
  }

  double _adaptationWidth(double myWidth) {
    return width * (myWidth / 360);
  }

  @override
  _ProfileAgreementState createState() => _ProfileAgreementState();
}

class _ProfileAgreementState extends State<ProfileAgreement> {
  var value = false;

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final userData = MyApp.userBloc;
    return Column(
      children: <Widget>[
        // Row(
        //   children: <Widget>[
        //     Checkbox(
        //       onChanged: (val) {
        //         setState(() {
        //           value = val;
        //         });
        //       },
        //       value: value,
        //       activeColor: Theme.of(context).primaryColor,
        //       autofocus: true,
        //     ),
        //     SizedBox(
        //       width: widget._adaptationHeight(12),
        //     ),
        //     Container(
        //       width: widget._adaptationHeight(250),
        //       child: GestureDetector(
        //         onTap: () {
        //           setState(() {
        //             value = !value;
        //           });
        //         },
        //         child: RichText(
        //           text: TextSpan(
        //             children: <TextSpan>[
        //               TextSpan(
        //                 text: "Я согласен с ",
        //                 style: TextStyle(
        //                   fontFamily:
        //                       Theme.of(context).textTheme.body1.fontFamily,
        //                   fontSize: 12,
        //                   color: Theme.of(context).accentColor,
        //                 ),
        //               ),
        //               TextSpan(
        //                 recognizer: null,
        //                 text: "правилами сервиса",
        //                 style: TextStyle(
        //                   fontFamily:
        //                       Theme.of(context).textTheme.body1.fontFamily,
        //                   fontSize: 12,
        //                   color: Theme.of(context).accentColor,
        //                   decoration: TextDecoration.underline,
        //                 ),
        //               ),
        //               TextSpan(
        //                 text:
        //                     " и даю согласие на обработку моих персональных данных.",
        //                 style: TextStyle(
        //                   fontFamily:
        //                       Theme.of(context).textTheme.body1.fontFamily,
        //                   fontSize: 12,
        //                   color: Theme.of(context).accentColor,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        SizedBox(
          height: widget._adaptationHeight(29),
        ),
        Container(
          height: widget._adaptationHeight(52),
          width: widget._adaptationWidth(320),
          child: RaisedButton(
            onPressed: value
                ? () {
                      userData.add(SentDataToServer());  
                  }
                : null,
            child: Text(
              "Сохранить",
              style: TextStyle(
                fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            color: Theme.of(context).accentColor,
          ),
        ),
      ],
    );
  }
}
