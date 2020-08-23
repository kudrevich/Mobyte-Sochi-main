import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_screens/UI/constants.dart';
import 'package:football_screens/bloc/auth_bloc/autorisation_bloc.dart';
import 'package:football_screens/main.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterTextField extends StatefulWidget {
  final double height;
  final double width;

  RegisterTextField(this.height, this.width);

  double _adaptationHeight(double mySize) {
    return height * (mySize / 740);
  }

  double _adaptationWidth(double myWidth) {
    return width * (myWidth / 360);
  }

  @override
  _RegisterTextFieldState createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  String valuePass;
  String valuePhone;
  String valueConfirm;
  var focusPassNode = FocusNode();
  var focusPhoneNode = FocusNode();
  var focusConfirmNode = FocusNode();

  @override
  void dispose() {
    focusPassNode.dispose();
    focusPhoneNode.dispose();
    focusConfirmNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
    // ignore: close_sinks
    final auth = MyApp.authBloc;
    return BlocBuilder<AutorisationBloc, AutorisationState>(
        builder: (context, state) {
      return Column(children: <Widget>[
        Container(
          height: widget._adaptationHeight(52),
          width: widget._adaptationWidth(320),
          padding: EdgeInsets.only(left: widget._adaptationWidth(12)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Colors.black, //Color(HexColor.getColorFromHex("#E2E2E2")),
              width: 1,
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Form(
              child: TextFormField(
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                  fontSize: 16,
                ),
                focusNode: focusPhoneNode,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  focusPassNode.requestFocus();
                },
                inputFormatters: [maskPhone],
                cursorColor: Theme.of(context).accentColor,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color:
                        lightGrey, // Color(HexColor.getColorFromHex("#CDCACA")),
                    fontFamily: Theme.of(context).textTheme.body1.fontFamily,
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
                  //       auth.add(RegisterNumberChange(maskPhone.getUnmaskedText()));
                  auth.add(RegisterNumberChange(value));
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
              color: Colors.black, //Color(HexColor.getColorFromHex("#E2E2E2")),
              width: 1,
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Form(
              child: TextFormField(
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                  fontSize: 16,
                ),
                focusNode: focusPassNode,
                onFieldSubmitted: (_) {
                  focusConfirmNode.requestFocus();
                },
                cursorColor: Theme.of(context).accentColor,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors
                        .black, //Color(HexColor.getColorFromHex("#CDCACA")),
                    fontFamily: Theme.of(context).textTheme.body1.fontFamily,
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
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  auth.add(RegisterPasswordChange(value));
                },
                obscureText: true,
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
              color: Colors.black, //Color(HexColor.getColorFromHex("#E2E2E2")),
              width: 1,
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Form(
              child: TextFormField(
                textInputAction: TextInputAction.go,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                  fontSize: 16,
                ),
                focusNode: focusConfirmNode,
                cursorColor: Theme.of(context).accentColor,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color:
                        lightGrey, // Color(HexColor.getColorFromHex("#CDCACA")),
                    fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  hintText: "Подтвердите пароль",
                ),
                onChanged: (value) {
                  auth.add(ConfirmedPasswordChange(value));
                },
                obscureText: true,
              ),
            ),
          ),
        )
      ]);
    });
  }
}
