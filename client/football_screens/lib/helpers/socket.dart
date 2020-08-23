import 'dart:convert';

import 'package:action_cable/action_cable.dart';
import 'package:football_screens/helpers/requests.dart';
import 'package:football_screens/models/stadium_event.dart';

import 'MatchStream.dart';

class SocketStream {
  static String WS = 'ws://${Requests.IP}/cable';

  ActionCable cable;

  void connect() {
    cable =
        ActionCable.Connect("$WS?token=${Requests.Gtoken}", onConnected: () {
      print("Connected");
    }, onCannotConnect: () {
      print("Cannot connect");
    }, onConnectionLost: () {
      print("ConnectionLost");
    });

    cable.subscribe("CommandChannel", onSubscribed: () {},
        onMessage: (message) {
      print(message);
      if (message["type_event"] == "chant") {
        StadiumController.stadiumController
            .add(new Chant.fromData(message["params"]));
      } else if (message["type_event"] == "lightshow") {
        StadiumController.stadiumController
            .add(new LightShow.fromData(message["params"]));
      }
      if (message["sender_type"] == "Superuser") {
        //MatchStream.matchStream.add(message["count_online"]);
      }
    });
  }

  SocketStream() {
    connect();
  }
//TODO: запустить по окончанию ивента
  sendData(String data) {
    cable.performAction("CommandChannel",
        action: 'send', actionParams: {'check_in': 'ok'});
  }
}
