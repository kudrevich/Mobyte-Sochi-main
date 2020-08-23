import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/UI/auth_pages_block/auth_page/widgets/auth_text_field.dart';
import 'package:football_screens/UI/constants.dart';
import 'package:football_screens/bloc/auth_bloc/autorisation_bloc.dart';
import 'package:football_screens/helpers/globals.dart';
import 'package:football_screens/main.dart';

import './widgets/auth_text_below.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class AuthPage extends StatefulWidget {
  //для сохранения данных в навбаре
  AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool didAuthenticate;

  @override
  void initState() {
    //  WidgetsBinding.instance
    //   .addPostFrameCallback((_) => fingerprintAuth(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final auth = MyApp.authBloc;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double _adaptationHeight(double mySize) {
      return height * (mySize / 740);
    }

    double _adaptationWidth(double myWidth) {
      return width * (myWidth / 360);
    }

    //вызов TouchID
    return Scaffold(
      key: myGlobals.authKey,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: _adaptationHeight(530),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: _adaptationWidth(20),
                      right: _adaptationWidth(20),
                      bottom: _adaptationHeight(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                          title: Text(
                          "Авторизация",
                          style: Theme.of(context).textTheme.headline,
                        ),
                        trailing: Image.asset('assets/logo.png')
                      ),
                      SizedBox(
                        height: _adaptationHeight(8),
                      ),
                      Container(
                        width: _adaptationWidth(202),
                        child: Text(
                          "Введите свои персональные данные для авторизации",
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ),
                      SizedBox(
                        height: _adaptationHeight(25),
                      ),
                      AuthTextField(height, width),
                      SizedBox(
                        height: _adaptationHeight(14),
                      ),
                      GestureDetector(
                        child: Align(
                          child: Text(
                            "Забыли пароль?",
                            style: TextStyle(
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .subhead
                                  .fontFamily,
                              fontSize: 14,
                              color: Theme.of(context).textTheme.subhead.color,
                            ),
                          ),
                        ),
                        // onTap: () => url.launch('https://walkscreen.afigol.ru/'),
                      ),
                      SizedBox(
                        height: _adaptationHeight(32),
                      ),
                      Container(
                        height: _adaptationHeight(52),
                        width: _adaptationWidth(320),
                        child: RaisedButton(
                          onPressed: () {
                            // MyApp.streamControllerUI.add(UI_Command.unfocusNum);
                            // MyApp.streamControllerUI.add(UI_Command.unfocusPass);
                            // FocusScope.of(context).requestFocus(new FocusNode());
                            auth.add(EnterInProfile(false));
                          },
                          child: Text(
                            "Войти",
                            style: TextStyle(
                              fontFamily:
                                  Theme.of(context).textTheme.body1.fontFamily,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          color: blue,
                        ),
                      ),
                      SizedBox(
                        height: _adaptationHeight(16),
                      ),
                      AuthTextBelow(),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                width: width,
                //хз почему так низко подучается
                top: height * 0.2,
                child: BlocBuilder<AutorisationBloc, AutorisationState>(
                  builder: (context, state) {
                    if (state is StartLoadingState)
                      return Platform.isAndroid
                          ? Center(child: CircularProgressIndicator())
                          : Center(child: CupertinoActivityIndicator());
                    else
                      return Container();
                  },
                ))
          ],
        ),
      ),
    );
    Positioned(
        width: width,
        //хз почему так низко подучается
        top: height * 0.2,
        child: BlocBuilder<AutorisationBloc, AutorisationState>(
          builder: (context, state) {
            if (state is StartLoadingState)
              return Platform.isAndroid
                  ? Center(child: CircularProgressIndicator())
                  : Center(child: CupertinoActivityIndicator());
            else
              return Container();
          },
        ));
  }
}
