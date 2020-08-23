import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:football_screens/UI/constants.dart';
import 'package:football_screens/helpers/helpers.dart';

class AnimatedText extends StatefulWidget {
  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  int ind = 0;
  final list = ['СО -', 'ЧИ,', 'ВПЕ -', 'РЁД!'];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FadeAnimatedTextKit(
      repeatForever: true,
      key: ValueKey(1600),
      onTap: () {
        print("Tap Event");
      },
      text: list,
      // onFinished: () {
      //   setState(() {
      //     if (ind % 4 == 0 || ind % 4 == 2)
      //       ind++;
      //     else if (ind % 4 == 1 || ind % 4 == 3)
      //       Future.delayed(Duration(milliseconds: 500), () {
      //         setState(() {
      //           ind++;
      //         });
      //       });
      //   });
      //},
      textStyle: TextStyle(fontSize: Helpers.responsiveHeight(92, context)),
      textAlign: TextAlign.center,
      duration: Duration(milliseconds: 700),
    )
        //  alignment: AlignmentDirectional.topStart // or Alignment.topLeft

        );
  }
}
