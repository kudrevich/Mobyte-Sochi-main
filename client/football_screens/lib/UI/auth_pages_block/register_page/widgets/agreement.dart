import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/UI/auth_pages_block/verification_code_page/verification_code_page.dart';
import 'package:football_screens/UI/constants.dart';
import 'package:football_screens/bloc/auth_bloc/autorisation_bloc.dart';
import 'package:url_launcher/url_launcher.dart' as url;

import '../../../../main.dart';

class Agreement extends StatefulWidget {
  final double height;
  final double width;

  Agreement(this.height, this.width);

  double _adaptationHeight(double mySize) {
    return height * (mySize / 740);
  }

  double _adaptationWidth(double myWidth) {
    return width * (myWidth / 360);
  }

  @override
  _AgreementState createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
  var value = false;
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final auth = MyApp.authBloc;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Checkbox(
              onChanged: (val) {
                setState(() {
                  value = val;
                });
              },
              value: value,
              activeColor: Theme.of(context).primaryColor,
              autofocus: true,
            ),
            SizedBox(
              width: widget._adaptationWidth(12),
            ),
            Container(
              width: widget._adaptationWidth(250),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    value = !value;
                  });
                },
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Я согласен с ",
                        style: TextStyle(
                          fontFamily:
                              Theme.of(context).textTheme.body1.fontFamily,
                          fontSize: 12,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      TextSpan(
                        recognizer: new TapGestureRecognizer()..onTap = () => url.launch('https://walkscreen.afigol.ru/'),
                        text: "правилами сервиса",
                        style: TextStyle(
                          fontFamily:
                              Theme.of(context).textTheme.body1.fontFamily,
                          fontSize: 12,
                          color: Theme.of(context).accentColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text:
                            " и даю согласие на обработку моих персональных данных.",
                        style: TextStyle(
                          fontFamily:
                              Theme.of(context).textTheme.body1.fontFamily,
                          fontSize: 12,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: widget._adaptationHeight(29),
        ),
        Container(
          height: widget._adaptationHeight(52),
          width: widget._adaptationWidth(320),
          child: BlocListener<AutorisationBloc, AutorisationState>(
            listener: (context, state) {
              if(state is RegisterSuccess)
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>VerificationCodePage('1')));
            },
            child: RaisedButton(
            onPressed: value
                ? () {
                    auth.add(Register());
                  }
                : null,
            child: Text(
              "Создать аккаунт",
              style: TextStyle(
                fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            color: blue,
          ),
          ) 
        ),
      ],
    );
  }
}
