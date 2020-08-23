import 'package:flutter/material.dart';
import 'package:football_screens/UI/chat_page/widgets/appbar_chat.dart';
import 'package:football_screens/UI/chat_page/widgets/list_of_messages.dart';
import 'package:football_screens/UI/chat_page/widgets/navbar_chat.dart';
import 'package:football_screens/UI/widgets/app_bar.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar:getAppBar(context, 'Chat'),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBarChat(),
              Expanded(
                child: ListOfMessages(),
              ),
              NavbarChat(),
            ],
          ),
        ),
      ),
    );
  }
}
