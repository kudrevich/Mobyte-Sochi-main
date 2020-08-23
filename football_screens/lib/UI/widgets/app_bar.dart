import 'package:flutter/material.dart';
import 'package:football_screens/UI/chat/chat.dart';
import 'package:football_screens/UI/chat_page/chat_page.dart';
import 'package:football_screens/UI/tests_page/tests_page.dart';
import 'package:football_screens/UI/widgets/animated_text.dart';
import 'package:football_screens/bloc/auth_bloc/autorisation_bloc.dart';
import 'package:football_screens/helpers/helpers.dart';
import 'package:football_screens/main.dart';

import '../../helpers/helpers.dart';

Widget getAppBar(BuildContext context, String title) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Chat(),
          ),
        );
      },
      icon: Icon(
        Icons.message,
        color: Colors.black,
      ),
    ),
    actions: [
      // GestureDetector(
      //   onTap: () => Helpers.showWarningDialog('Внимание', 'Куку'),
      //   // () => Navigator.push(
      //   //   context,
      //   //   MaterialPageRoute(
      //   //     builder: (context) => TestsPage(),
      //   //   ),
      //   // ),
      //   child: Container(
      //     margin: EdgeInsets.only(
      //         right: Helpers.responsiveWidth(
      //       15,
      //       context,
      //     )),
      //     child: Icon(
      //       Icons.play_circle_outline,
      //       color: Colors.black,
      //       size: Helpers.responsiveHeight(34, context),
      //     ),
      //   ),
      // ),
      // Padding(
      //   padding: EdgeInsets.only(right: Helpers.responsiveWidth(15, context)),
      //   child: GestureDetector(
      //     onTap: () => Navigator.of(context)
      //         .push(MaterialPageRoute(builder: (context) => AnimatedText())),
      //     //Helpers.showWarningDialog('Внимание', 'Куку'),
      //     child: CircleAvatar(
      //       radius: Helpers.responsiveHeight(17, context),
      //       backgroundColor: Colors.black,
      //     ),
      //   ),
      // ),
    ],
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: Helpers.responsiveWidth(14, context),
      ),
    ),
  );
}
