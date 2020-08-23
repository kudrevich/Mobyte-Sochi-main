import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/UI/widgets/back_arrow.dart';
import 'package:football_screens/bloc/auth_bloc/autorisation_bloc.dart';
import './widgets/agreement.dart';
import './widgets/register_text_field.dart';
import './widgets/register_text_below.dart';

class RegisterPage extends StatelessWidget {
  static String routeName = '/registerPage';

  

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double _adaptationHeight(double mySize) {
      return height * (mySize / 740);
    }

    double _adaptationWidth(double myWidth) {
      return width * (myWidth / 360);
    }

    Widget _adaptiveScaffoldChild()
  {
     return Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: _adaptationHeight(66),
                  left: _adaptationWidth(20),
                  right: _adaptationWidth(20),
                  bottom: _adaptationHeight(30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BackArrow(),
                  SizedBox(
                    height: _adaptationHeight(17),
                  ),
                  ListTile(
                          title: Text(
                          "Регистрация",
                          style: Theme.of(context).textTheme.headline,
                        ),
                        trailing: Image.asset('assets/logo.png')
                      ),
                  SizedBox(
                    height: _adaptationHeight(8),
                  ),
                  Text(
                    "Введите свои персональные данные для создания нового аккаунта",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  SizedBox(
                    height: _adaptationHeight(25),
                  ),
                  RegisterTextField(height, width),
                  SizedBox(
                    height: _adaptationHeight(16),
                  ),
                  Agreement(height, width),
                  SizedBox(
                    height: _adaptationHeight(16),
                  ),
                  RegisterTextBelow(),
                ],
              ),
            ),
          ),
          Positioned(
              width: width,
              top: height * 0.4,
              child: BlocBuilder<AutorisationBloc, AutorisationState>(
                builder: (context, state) {
                  if (state is StartLoadingState)
                    return Platform.isAndroid ? Center(child: CircularProgressIndicator())
                  : Center(child: CupertinoActivityIndicator());
                  else
                    return Container();
                },
              ))
        ],
      );
  }

    return Scaffold(
      body: SafeArea(
      child: _adaptiveScaffoldChild()
    )    
    );
  }
}
