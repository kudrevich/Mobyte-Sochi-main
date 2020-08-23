import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/UI/constants.dart';
import 'package:football_screens/bloc/auth_bloc/autorisation_bloc.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../main.dart';



class AuthTextField extends StatefulWidget {
  final double height;
  final double width;
 //TODO избавиться от этого говна
 

  AuthTextField(this.height, this.width);
  double _adaptationHeight(double mySize) {
    return height * (mySize / 740);
  }

  double _adaptationWidth(double myWidth) {
    return width * (myWidth / 360);
  }

  @override
  _AuthTextFieldState createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {

  _AuthTextFieldState();
  final passwordController = TextEditingController();
  final numberContoller = TextEditingController();
 // StreamSubscription listenUI;
  FocusNode focusPassNode=FocusNode();
  FocusNode focusPhoneNode=FocusNode();
  @override
  void dispose() {
  //  listenUI.cancel();
    focusPassNode.dispose();
    focusPhoneNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // ignore: close_sinks
    final auth =MyApp.authBloc;
    /*
    listenUI=MyApp.streaamUI.listen((event) {
      if(event == UI_Command.unfocusNum){
         focusPhoneNode.unfocus();
      } else if(event ==UI_Command.unfocusPass){
        focusPassNode.unfocus();
      }
     });
     */
    auth.add(LoadData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final auth =MyApp.authBloc;
    var threeSample = Text(
      "###",
      style: TextStyle(
        decoration: TextDecoration.underline,
      ),
    );
    var fourSample = Text(
      "####",
      style: TextStyle(
        decoration: TextDecoration.underline,
      ),
    );
    var maskPhone = MaskTextInputFormatter(
        mask: "+#(${threeSample.data}) ${threeSample.data}-${fourSample.data}");
    return BlocBuilder<AutorisationBloc, AutorisationState>(
      builder: (context, state) {
        if(state is LoadDataState)
        {
           numberContoller.text=state.number;
           passwordController.text=state.password;
           auth.add(FinishLoadData());
         //  numberContoller.selection=TextSelection.fromPosition(TextPosition(offset:state.number.length));
        }
          return Column(
            children: <Widget>[
              Container(
                height: widget._adaptationHeight(52),
                width: widget._adaptationWidth(320),
                padding: EdgeInsets.only(left: widget._adaptationWidth(12)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: Colors.black,
                    //Color(HexColor.getColorFromHex("#E2E2E2")),
                    width: 1,
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Form(
                    child: TextFormField(
                      controller: numberContoller,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily:
                            Theme.of(context).textTheme.body1.fontFamily,
                       
                        fontSize: 16,
                      ),
                      focusNode: focusPhoneNode,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        if(!(state is LoadDataState))
                        focusPassNode.requestFocus();
                      },
                      inputFormatters: [maskPhone],
                      cursorColor: Theme.of(context).accentColor,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color:lightGrey,// Color(HexColor.getColorFromHex("#CDCACA")),
                          fontFamily:
                              Theme.of(context).textTheme.body1.fontFamily,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        hintText: "Телефон",
                      ),
                      onChanged: (value) {
                        auth.add(NumberChange(value));
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: widget._adaptationHeight(12),
              ),
              Container(
                height: widget._adaptationHeight(52),
                width: widget._adaptationWidth(320),
                padding: EdgeInsets.only(left: widget._adaptationWidth(12)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color:Colors.black,// Color(HexColor.getColorFromHex("#E2E2E2")),
                    width: 1,
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Form(
                    child: TextFormField(
                      controller: passwordController,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily:
                            Theme.of(context).textTheme.body1.fontFamily,
                       
                        fontSize: 16,
                      ),
                      focusNode: focusPassNode,
                      textInputAction: TextInputAction.go,
                      cursorColor: Theme.of(context).accentColor,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color:lightGrey ,// Color(HexColor.getColorFromHex("#CDCACA")),
                          fontFamily:
                              Theme.of(context).textTheme.body1.fontFamily,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        hintText: "Пароль",
                      ),
                      onChanged: (value) {
                        auth.add(PasswordChange(value));
                      },
                      obscureText: true,
                    ),
                  ),
                ),
              )
            ],
          );
      },
    );
  }
}
