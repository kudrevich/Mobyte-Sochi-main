import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';
import 'package:football_screens/main.dart';
import 'package:football_screens/models/message.dart';

class ChatMessage extends StatelessWidget {
  final Message message;
  final bool date;
  final DateTime timeOfMessage;
  ChatMessage({
    this.message,
    this.date = false,
  }) : this.timeOfMessage = message.time;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Helpers _helpers = new Helpers(height, width);

    var minutes = message.time.minute;
    var displayedMinutes = minutes >= 0 && minutes <= 9
        ? "0" + minutes.toString()
        : minutes.toString();
    var hours = message.time.hour;
    var displayedHours =
        hours >= 0 && hours <= 9 ? "0" + hours.toString() : hours.toString();
    String _getMonth() {
      switch (message.time.month) {
        case 1:
          return 'Января';
          break;
        case 2:
          return 'Февраля';
          break;
        case 3:
          return 'Марта';
          break;
        case 4:
          return 'Апреля';
          break;
        case 5:
          return 'Мая';
          break;
        case 6:
          return 'Июня';
          break;
        case 7:
          return 'Июля';
          break;
        case 8:
          return 'Августа';
          break;
        case 9:
          return 'Сентября';
          break;
        case 10:
          return 'Октября';
          break;
        case 11:
          return 'Ноября';
          break;
        default:
          return 'Декабря';
      }
    }

    String month = _getMonth();

    Widget _getTime({bool flag = false}) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            displayedHours + ':',
            style: TextStyle(
              fontSize: _helpers.adaptiveHeight(10),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              color: flag
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyText2.color,
            ),
          ),
          Text(
            displayedMinutes,
            style: TextStyle(
              fontSize: _helpers.adaptiveHeight(10),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              color: flag
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyText2.color,
            ),
          ),
        ],
      );
    }

    if (!date) {
      return Container(
        margin: EdgeInsets.only(
          bottom: _helpers.adaptiveHeight(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: message.id != MyApp.user.id
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: <Widget>[
            message.id != MyApp.user.id
                ? Container(
                    margin: EdgeInsets.only(left: _helpers.adaptiveWidth(3)),
                    child: CircleAvatar(
                      radius: _helpers.adaptiveHeight(25),
                      backgroundImage: ResizeImage(
                        NetworkImage(
                            "http://178.154.255.209:3002" + message.avatarUrl),
                        height: (_helpers.adaptiveHeight(25) * 4).ceil(),
                        width: (_helpers.adaptiveHeight(25) * 4).ceil(),
                      ),
                    ),
                  )
                : Container(),
            Container(
              margin: EdgeInsets.only(
                right:
                    message.sender == 'User' ? _helpers.adaptiveWidth(15) : 0,
                left: message.sender == 'User' ? _helpers.adaptiveWidth(5) : 0,
              ),
              child: message.type == 1 || message.type == 3
                  ? Container(
                      constraints: BoxConstraints(
                        maxWidth: _helpers.adaptiveWidth(285),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffF8FBFE),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: _helpers.adaptiveWidth(3),
                          left: _helpers.adaptiveWidth(6),
                          bottom: _helpers.adaptiveHeight(5),
                          top: _helpers.adaptiveHeight(3),
                        ),
                        child: message.id != MyApp.user.id
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    message.sender_name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        constraints: BoxConstraints(
                                          maxWidth: _helpers.adaptiveWidth(225),
                                        ),
                                        child: Text(
                                          message.content,
                                          // textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize:
                                                _helpers.adaptiveHeight(18),
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .color,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: _helpers.adaptiveWidth(5),
                                      ),
                                      _getTime(),
                                    ],
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        constraints: BoxConstraints(
                                          maxWidth: _helpers.adaptiveWidth(225),
                                        ),
                                        child: Text(
                                          message.content,
                                          // textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize:
                                                _helpers.adaptiveHeight(18),
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .color,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: _helpers.adaptiveWidth(5),
                                      ),
                                      _getTime(),
                                    ],
                                  ),
                                ],
                              ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Hero(
                                tag: message.content + message.time.toString(),
                                child: Card(
                                  child: Image.network(
                                    message.content,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Hero(
                            tag: message.content + message.time.toString(),
                            child: Container(
                              height: _helpers.adaptiveHeight(210),
                              width: _helpers.adaptiveWidth(255),
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(message.content),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              right: _helpers.adaptiveWidth(7),
                              bottom: _helpers.adaptiveHeight(1),
                            ),
                            margin: EdgeInsets.only(
                              right: _helpers.adaptiveWidth(10),
                              bottom: _helpers.adaptiveHeight(10),
                            ),
                            width: _helpers.adaptiveWidth(40),
                            height: _helpers.adaptiveHeight(20),
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(child: _getTime(flag: true)),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(
          bottom: _helpers.adaptiveHeight(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              message.time.day.toString() + message.sender_name,
              style: TextStyle(
                fontSize: _helpers.adaptiveHeight(10),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.bodyText2.color,
              ),
            ),
            SizedBox(
              width: _helpers.adaptiveWidth(2),
            ),
            Text(
              month,
              style: TextStyle(
                fontSize: _helpers.adaptiveHeight(10),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.bodyText2.color,
              ),
            ),
          ],
        ),
      );
    }
  }
}
