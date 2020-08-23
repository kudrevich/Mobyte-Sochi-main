import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterTextBelow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "Уже есть аккаунт? ",
              style: Theme.of(context).textTheme.body1,
            ),
            TextSpan(
              text: "Войти",
              style: Theme.of(context).textTheme.body2,
              recognizer: TapGestureRecognizer()..onTap = () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
