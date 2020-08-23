import 'package:flutter/material.dart';
import 'package:football_screens/helpers/requests.dart';

class Message {
  final DateTime time;
  final String sender;
  final int type;
  final String content;
  final int id;
  final String sender_name;
  final String avatarUrl;

  const Message(
      {@required this.time,
      @required this.sender,
      @required this.type,
      @required this.content,
      @required this.id,
      @required this.sender_name,
      @required this.avatarUrl});
  Message.fromJson(Map<String, dynamic> data, {bool history = false})
      : time = data['created_at'] != null
            ? DateTime.parse(data['created_at']
                .toString()
                .replaceAll("+03:00", "")) //Пааааарсииииинг
            : DateTime.now(),
        id = data['sender_id'],
        sender_name = data['sender_name'],
        avatarUrl =
            history ? data['sender_avatar'] : data['sender_avatar']['url'],
        sender = data['sender_type'],
        type = data['type_message'],
        content = data['type_message'] == 2
            ? "http://${Requests.IP}" + data['picture']['url']
            : data['content'] ?? data['message'];
  void printMessage() {
    print('time is $time');
    print('sender is $sender');
    print('type is $type');
    print('content is $content');
  }
}
