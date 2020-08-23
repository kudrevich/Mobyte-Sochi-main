import 'dart:async';

abstract class StadiumEvent {}

class Chant extends StadiumEvent {
  final String title;
  final int duration;
  final String body;
  final bool flashLight;

  Chant(this.title, this.body, this.flashLight, this.duration);

  Chant.fromData(Map<String, dynamic> data)
      : title = data["title"],
        body = data["chant"],
        flashLight = data["flash_light"] == 1,
        duration = data["duration"];
}

class LightShow extends StadiumEvent {
  final int mode;

  LightShow(this.mode);

  LightShow.fromData(Map<String, dynamic> data) : mode = data["mode"];
}

class WaitScreen extends StadiumEvent {}

class StadiumController {
  static final stadiumController = StreamController<StadiumEvent>.broadcast();
}
