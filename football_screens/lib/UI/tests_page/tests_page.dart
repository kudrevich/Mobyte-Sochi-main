import 'package:flutter/material.dart';
import 'package:football_screens/UI/tests_page/widgets/answer.dart';
import 'package:football_screens/UI/tests_page/widgets/buttons.dart';
import 'package:football_screens/UI/tests_page/widgets/question.dart';
import 'package:football_screens/helpers/helpers.dart';

import 'widgets/logo.dart';

class TestsPage extends StatelessWidget {
  final List<Answer> _answers = [
    Answer(),
    Answer(text: "2",),
    Answer(text: "3",),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          left: Helpers.responsiveWidth(24, context),
          right: Helpers.responsiveWidth(24, context),
          top: Helpers.responsiveHeight(45, context),
        ),
        child: Column(
          children: [
            Logo(),
            SizedBox(
              height: Helpers.responsiveHeight(35, context),
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: Helpers.responsiveHeight(25, context),
            ),
            Question(),
            SizedBox(
              height: Helpers.responsiveHeight(15, context),
            ),
            Text(
              'Lorem ipsum dolor sit amet.',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: Helpers.responsiveHeight(35, context),
            ),
            Container(
              height: Helpers.responsiveWidth(80, context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _answers,
              )
            ),
            SizedBox(
              height: Helpers.responsiveHeight(40, context),
            ),
            Buttons(),
          ],
        ),
      ),
    );
  }
}
