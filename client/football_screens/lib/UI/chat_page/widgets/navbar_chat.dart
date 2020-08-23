import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';

class NavbarChat extends StatefulWidget {
  @override
  _NavbarChatState createState() => _NavbarChatState();
}

class _NavbarChatState extends State<NavbarChat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Helpers.responsiveWidth(15, context)),
      color: Theme.of(context).accentColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Helpers.responsiveWidth(280, context),
            child: TextField(
              minLines: 1,
              maxLines: 10,
              decoration: InputDecoration(hintText: 'Glauben oder nicht'),
            ),
          ),
          Icon(
            Icons.send,
          ),
        ],
      ),
    );
  }
}
