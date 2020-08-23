import 'package:flutter/material.dart';
import 'package:football_screens/UI/chat/widgets/appbar_chat.dart';
import 'package:football_screens/UI/chat/widgets/list_of_messages_and_navbar_chat.dart';
import 'package:football_screens/models/order.dart';

class Chat extends StatelessWidget {
  final bool sendMessage;
  final Order order;

  const Chat({Key key, this.sendMessage = false, this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              AppbarChat(),
              Expanded(
                child: ListOfMessagesAndNavbarChat(sendMessage, order),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
