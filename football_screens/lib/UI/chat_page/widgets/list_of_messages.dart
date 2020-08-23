import 'package:flutter/material.dart';
import 'package:football_screens/UI/chat_page/widgets/chat_message.dart';

class ListOfMessages extends StatelessWidget {
  final List<ChatMessage> _messages = [
    ChatMessage(
      flag: true,
      text:
          'Es gibt viele Variationen der Passages des Lorem Ipsum, aber der Hauptteil erlitt Änderungen in irgendeiner Form, durch Humor oder zufällige Wörter welche nicht einmal ansatzweise glaubwürdig aussehen.',
    ),
    ChatMessage(
      flag: true,
      text: 'Es gibt viele Variationen',
    ),
    ChatMessage(
      flag: false,
    ),
    ChatMessage(
      flag: true,
    ),
    ChatMessage(
      flag: true,
    ),
    ChatMessage(
      flag: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      reverse: true,
      child: Column(
        children: _messages,
      ),
    );
  }
}
