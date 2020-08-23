import 'package:flutter/cupertino.dart';

class News {
  String title;
  String body;
  DateTime date;
  String picUrl;
  ImageProvider picture;

  News(
      {@required this.title,
      @required this.body,
      @required this.date,
      @required picUrl}) {
    if (picUrl != null) {
      picture = NetworkImage(picUrl);
    } else {
      picture = AssetImage('assets/pic.jpg');
    }
  }

  News.fromData(Map<String, dynamic> data)
      : title = data['title'],
        body = data['body'],
        date = DateTime.parse(data['date']);

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'date': date.toString(),
    };
  }
}
