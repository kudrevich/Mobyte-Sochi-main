import 'package:flutter/material.dart';
import 'package:football_screens/UI/main_page.dart';
import 'package:football_screens/bloc/auth_bloc/autorisation_bloc.dart';
import 'package:football_screens/helpers/hex_color.dart';
import 'package:football_screens/main.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class EnterCodeTextField extends StatefulWidget {
  final double height;
  final double width;


  EnterCodeTextField(this.height, this.width);

  @override
  _EnterCodeTextFieldState createState() => _EnterCodeTextFieldState();
}

class _EnterCodeTextFieldState extends State<EnterCodeTextField> {
  String _code;

  var focus = FocusNode();

  double _adaptationHeight(double mySize) {
    return widget.height * (mySize / 740);
  }

  double _adaptationWidth(double myWidth) {
    return widget.width * (myWidth / 360);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _adaptationHeight(220),
      child: PinCodeTextField(
        focusNode: focus,
              backgroundColor: Color(HexColor.getColorFromHex("#FAFAFA")),
              length: 4,
              onChanged: (value){
                setState(() {
                  _code = value;
                });
                  
              },
              onCompleted: (_){
                focus.unfocus();
                MyApp.authBloc.add(EnterInProfile(true));
              },
              pinTheme: PinTheme(
                inactiveColor: Color(HexColor.getColorFromHex("#E2E2E2")),
                selectedColor:Color(HexColor.getColorFromHex("#CDCACA")),
                activeColor: Color(HexColor.getColorFromHex("#E2E2E2")),
                shape: PinCodeFieldShape.box,
                fieldHeight: 52,
                fieldWidth: 40,
                borderRadius: BorderRadius.circular(10)
              ),
              textInputType:TextInputType.number,
            ),
    );
  }
}
