import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:football_screens/UI/auth_pages_block/register_page/register_page.dart';



class AuthTextBelow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "Новый пользователь? ",
              style: Theme.of(context).textTheme.body1,
            ),
            TextSpan(
              text: "Создайте аккаунт",
              style: Theme.of(context).textTheme.body2,
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => RegisterPage())),
            ),
          ],
        ),
      ),
    );
  }
}
