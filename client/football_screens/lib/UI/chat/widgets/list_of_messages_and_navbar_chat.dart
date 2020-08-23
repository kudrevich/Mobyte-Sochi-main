import 'dart:convert';
import 'dart:typed_data';
import 'package:action_cable/action_cable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:football_screens/UI/constants.dart';
import 'package:football_screens/UI/defaultScreens/loadingScreen.dart';
import 'package:football_screens/helpers/helpers.dart';

import 'package:football_screens/helpers/requests.dart';
import 'package:football_screens/main.dart';
import 'package:football_screens/models/message.dart';
import 'package:football_screens/models/order.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';

import 'chat_message.dart';

enum States {
  //состояния подключения к сокету
  connected,
  disconnected,
  cantconnect,
}

// ignore: must_be_immutable
class ListOfMessagesAndNavbarChat extends StatefulWidget {
  bool sendMessage;

  final Order order;

  ListOfMessagesAndNavbarChat(this.sendMessage, this.order, {Key key})
      : super(key: key); //Отправляем сообщение при заходе из корзины
  @override
  _ListOfMessagesAndNavbarChatState createState() =>
      _ListOfMessagesAndNavbarChatState();
}

class _ListOfMessagesAndNavbarChatState
    extends State<ListOfMessagesAndNavbarChat> {
  TextEditingController textEditingController = TextEditingController();
  ScrollController _controller = ScrollController();
  RefreshController _refreshController = RefreshController();
  List<ChatMessage> _listOfMessages =
      List<ChatMessage>(); //Список всех сообщений-виджетов

  static const WS = 'ws://${Requests.IP}/cable'; //Адрес веб-сокета

  //WebSocket — протокол связи поверх TCP-соединения, предназначенный для обмена сообщениями между браузером и веб-сервером в режиме реального времени

  ActionCable
      _cable; //штука, с помощью которой обеспечивается соединение с веб-соектом (подписка на веб-сокет)

  States _state = States.disconnected;

  ////////////////////////////////////////////////////////////////////////////////
  Uint8List _image; //отправляемая картинка

  bool _historyLoad = false; //прогружена ди история

  int _pageIndex =
      1; // индекс подружаемой страницы сообщений. История сообщений получается порционно. Когда мы прокрутили вверх все загруженные сообщения,
  //загружаем страницу с индексом pageIndex+1

  List<Message> _chatHistory = List<Message>(); //Последняя "порция" сообщений
  //////////////////////////////////////////////////////////////////////////////

  void _connect() {
    //инициализируем _cable
    _cable = ActionCable.Connect(
      "$WS?token=${Requests.Gtoken}",
      onConnected: () {
        _state = States.connected;
        print("Connected");
      },
      onCannotConnect: () {
        _state = States.cantconnect;
        print("i can't connect");
      },
      onConnectionLost: () {
        _state = States.disconnected;
        print('Disconnected');
        _userChat();
      },
    );
  }

  _userChat() {
    _connect();
    _cable.subscribe(
      //подписываемся на сокет
      "GeneralChannel", //название канала, как и другие парамерты, добавляются по договоренности с разработчиком сервера
      onSubscribed: () async {
        //обработка подписки на сокет
        print("Subscribed on channel Chat");
        var mes = await Requests.getHistory(
            page:
                _pageIndex); //Request - класс со статическими http-запросами. Получаем с помощью запроса первую страницу истории
        // т.е. последнюю порцию сообщений
        // т.к. _pageIndex вначале равен единице
        if (mes != null) {
          mes = mes.reversed.toList();
          for (int i = 0; i < mes.length; i++) {
            if (mes[i].type != 4) {
              _listOfMessages.add(ChatMessage(message: mes[i]));
            }
          }
        }

        _pageIndex++; //увеличиваем, чтобы потом получить следующую страницу истории
        _chatHistory = mes;
        _historyLoad = true;

        if (widget.sendMessage) {
          //автоотправка сообщения с заказом при открытии страницы
          _sendMessage(
            widget.order.makeCheck(),
            type: 3,
            price: widget.order.getRealPrice().round(),
          ); //Отправляет на сервер сообщение-заказ, на которое приходит специальный ответ
        }
        setState(() {});
      },
      onMessage: (message) {
        //обработка получения сообщения
        print("Got some message!\n$message");
        Message msg = Message.fromJson(message);
        setState(() {
          if (msg.sender != "System" && msg.type != 4) {
            _listOfMessages.add(ChatMessage(message: msg));
            _image = null;
          }
        });
      },
    );
  }

  _sendMessage(String msg, {int type = 1, int price = 0, int dprice = 0}) {
    //отправка сообщения
    _cable.performAction("GeneralChannel",
        action: "receive",
        channelParams: {},
        actionParams: type == 1 //параметры - по договорённости с сервером
            ? {
                "message": msg,
                "type_message": type,
                'sender_name': MyApp.user.name,
                'sender_avatar': MyApp.user.avatarUrl,
              }
            : {
                "message": msg,
                "type_message":
                    type, //type_message: 1 - обычное текстовое сообщение
                //type_message: 2 - картинка
                //type_message: 3 - сообщение с заказом
                'price': price, //цена
                'd_price': dprice //цена доставки
              });
  }

  _sendImage(Uint8List img) {
    //отправка картинки
    _cable.performAction("GeneralChannel", action: "receive", actionParams: {
      "picture": "data:image/jpeg;base64," + base64Encode(img),
      "type_message": 2,
    });
  }

  @override
  void dispose() {
    //диспозим всё что можно во избежание утечек памяти и отписываемся от канала
    _controller.dispose();
    _refreshController.dispose();
    textEditingController.dispose();
    _cable.unsubscribe("GeneralChannel");
    _cable.disconnect();
    super.dispose();
  }

  @override
  void initState() {
    _userChat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    double _adaptiveHeight(double size) {
      return height * (size / 740);
    }

    double _adaptiveWidth(double size) {
      return width * (size / 360);
    }

    if (_historyLoad)
      return Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: _adaptiveHeight(5),
              ),
              height: _adaptiveHeight(576),
              child: SmartRefresher(
                //нужен для догрузки истории при пролистывании её вверх
                enablePullUp: true, //
                enablePullDown:
                    false, //делаем, чтоб обновление происходило при пролистывании вверх
                reverse: true, //
                footer: CustomFooter(
                  //виджет, отображающийся вверху истории при подгрузке новых сообщений
                  builder: (context, mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Text(""); //TODO: Подумать, что выводить
                    } else if (mode == LoadStatus.loading) {
                      body = CircularProgressIndicator(
                        backgroundColor: Theme.of(context).accentColor,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor),
                      );
                    } else if (mode == LoadStatus.failed) {
                      body = Text("Load Failed!Click retry!");
                    } else if (mode == LoadStatus.canLoading) {
                      body = Text("");
                    } else {
                      body = Text("No more Data");
                    }
                    return Container(
                      height: _adaptiveHeight(50),
                      child: Center(child: body),
                    );
                  },
                ),
                header: null,
                controller: _refreshController,
                onLoading: () async {
                  //Helpers.vibrate();
                  await SystemChannels.platform
                      .invokeMethod<void>('HapticFeedback.mediumImpact');
                  //подгрузка сообщений
                  if (_state == States.cantconnect)
                    _userChat(); //если не удалось подключиться к сокету, пробуем заново
                  //Если _state==States.disconnect, подключаться заново не надо
                  else if (_chatHistory != null) {
                    print("Page index = " + _pageIndex.toString());
                    _chatHistory = await Requests.getHistory(
                        page: _pageIndex); //получаем следующую порцию истории
                    _pageIndex++;
                    if (_chatHistory != null) {
                      for (int i = 0; i < _chatHistory.length; i++) {
                        if (_chatHistory[i].type !=
                            4) // 4 тип - автоответ от пользователя после заказа
                        {
                          _listOfMessages.insert(
                              0, ChatMessage(message: _chatHistory[i]));
                        }
                      }
                      setState(() {}); //для ребилда
                    }
                  }
                  _refreshController
                      .loadComplete(); //прекращение действия раюоты контроллера
                },
                child: ListView.builder(
                  controller: _controller,
                  itemCount: _listOfMessages.length,
                  itemBuilder: (c, i) =>
                      _listOfMessages[_listOfMessages.length - 1 - i],
                ),
              ),
            ),
          ),
          Container(
            width: width,
            padding: EdgeInsets.only(
              left: _adaptiveWidth(10),
            ),
            child: Row(
              //навбвр чата - выбор картинки, текстовое поле, кнопка отправки ссообщения
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: _adaptiveHeight(40),
                  width: _adaptiveHeight(40),
                  decoration: BoxDecoration(
                    color: Color(0xff98D2F5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: GestureDetector(
                      //отправка изображения
                      onTap: () async {
                        _image = await Helpers.getImage();
                        if (_image != null) _sendImage(_image);
                      },
                      child: Icon(
                        Icons.image,
                        color: Colors.white,
                        size: _adaptiveHeight(18),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: _adaptiveWidth(230),
                  child: TextField(
                    //поле для ввода сообщения
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    minLines: 1,
                    maxLines: 4,
                    controller: textEditingController,
                    textInputAction: TextInputAction.send,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    onSubmitted: (_) {
                      if (textEditingController.value.text.trim().isNotEmpty) {
                        _sendMessage(textEditingController.value.text);
                        textEditingController.text = "";
                      }
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        //говорим, что нужно вызвать функцию
                        //после выполения метода build() - иначе не заработает
                        setState(() {
                          _controller.animateTo(
                              0, //прокручиваем вниз до самого последнего сообщения
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInCubic);
                        });
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Введите сообщение...',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).textTheme.bodyText2.color,
                        fontFamily:
                            Theme.of(context).textTheme.bodyText2.fontFamily,
                        fontSize: _adaptiveHeight(16),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  //отправка сообщения
                  onTap: () {
                    if (textEditingController.value.text.trim().isNotEmpty) {
                      _sendMessage(textEditingController.value.text);
                      textEditingController.text = "";
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        //говорим, что нужно вызвать функцию
                        //после выполения метода build() - иначе не заработает
                        setState(() {
                          _controller.animateTo(
                              0, //прокручиваем вниз до самого последнего сообщения
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInCubic);
                        });
                      });
                    }
                  },
                  child: Container(
                    width: _adaptiveWidth(50),
                    height: _adaptiveHeight(40),
                    decoration: BoxDecoration(
                      color: Color(0xffFFEE94),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.send,
                        size: _adaptiveHeight(21),
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    else
      return loadingScreen(caption: "Загрузка", context: context);
  }
}
