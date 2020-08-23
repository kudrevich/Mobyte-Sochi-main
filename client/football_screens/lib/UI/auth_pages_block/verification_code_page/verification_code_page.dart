
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/UI/widgets/back_arrow.dart';
import 'package:football_screens/bloc/auth_bloc/autorisation_bloc.dart';

import './widgets/enter_code_text_field.dart';


class VerificationCodePage extends StatelessWidget {
  String number;
  VerificationCodePage(this.number);

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

   
    

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: _adaptationHeight(40),
                  left: _adaptationWidth(20),
                  right: _adaptationWidth(20),
                  top: _adaptationHeight(66)),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: BackArrow(),
                  ),
                   ListTile(
                          title: Text(
                          "Введите код",
                          style: Theme.of(context).textTheme.headline,
                        ),
                        trailing: Image.asset('assets/logo.png')
                      ),
                  SizedBox(
                    height: _adaptationHeight(16),
                  ),
                  EnterCodeTextField(height, width),
                  SizedBox(
                    height: _adaptationHeight(24),
                  ),
                  Text(
                    "Мы отправили вам код подтверждения на номер" + number,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.body1,
                  ),
                  SizedBox(
                    height: _adaptationHeight(16),
                  ),
                  Row(children: [
                    Text(
                      "Получить новый код можно через   ",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.body1,
                    ),
                    // Center(
                    //   child: BlocBuilder<TimerBloc, TimerState>(
                    //     builder: (context, state) {
                    //       final String minutesStr = ((state.duration / 60) % 60)
                    //           .floor()
                    //           .toString()
                    //           .padLeft(2, '0');
                    //       final String secondsStr = (state.duration % 60)
                    //           .floor()
                    //           .toString()
                    //           .padLeft(2, '0');
                    //       return Text(
                    //         '$minutesStr:$secondsStr',
                    //       );
                    //     },
                    //   ),
                    // ),
                  ]),
                  SizedBox(
                    height: _adaptationHeight(12),
                  ),
                  GestureDetector(
                    onTap: () {
                      // ignore: close_sinks
                   //   var timerBloc = MyApp.timerBloc;
                      // ignore: close_sinks
                      // var auth =MyApp.authBloc;
                      // if(timerBloc.state is TimerRunComplete)
                      // {
                      //   //timerBloc.add(TimerStarted(duration: 10));
                      //   auth.add(GetOTP(false));
                      // }
                    },
                    child: Text(
                      "Получить новый код",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ),
                ],
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
                          : Center(child:CupertinoActivityIndicator(
                            ));
                    else
                      return Container();
                  },
                ))
        ],
        
      ),
    );
  }
}
