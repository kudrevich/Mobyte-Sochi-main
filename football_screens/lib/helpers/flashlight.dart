import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:football_screens/models/stadium_event.dart';
import 'package:lamp/lamp.dart';

class Flashlight {
  static const _platform =
      MethodChannel('com.example.football_screens/flashlight');
  static StreamController<int> _controller;
  static int _index = 0;
  static void _turnOn() {
    if (Platform.isIOS) {
      Lamp.turnOn();
    } else {
      _turnOnAndroid();
    }
  }

  static void _turnOff() {
    if (Platform.isIOS) {
      Lamp.turnOff();
    } else {
      _turnOffAndroid();
    }
  }

  static void _turnOnAndroid() {
    try {
      _platform.invokeMethod('turnOnFlashlight');
    } on PlatformException catch (error) {
      print(error.message);
    } catch (e) {
      print(e.toString());
    }
  }

  static void _turnOffAndroid() {
    try {
      _platform.invokeMethod('turnOffFlashlight');
    } on PlatformException catch (error) {
      print(error.message);
    } catch (e) {
      print(e.toString());
    }
  }

  static Stream<int> _timedCounter(Duration interval, [int maxCount]) {
    var controller = StreamController<int>();
    int counter = 0;
    void tick(Timer timer) {
      counter++;
      controller.add(counter); // Ask stream to send counter values as event.
      if (maxCount != null && counter >= maxCount * 2) {
        timer.cancel();
        controller.close(); // Ask stream to shut down and tell listeners.
      }
    }

    int d = (interval.inMilliseconds / 2).round();
    Timer.periodic(Duration(milliseconds: d),
        tick); // BAD: Starts before it has subscribers.
    return controller.stream;
  }

  static void _startFlash(FlashEvent flashEvent) async {
    var counterStream =
        _timedCounter(flashEvent.duration, flashEvent.countTicks);
    counterStream.listen((elem) {
      if (elem % 2 == 0)
        Flashlight._turnOff();
      else
        Flashlight._turnOn();
    }).onDone(() {
      Flashlight._index++;
      Flashlight._controller.add(_index);
    });
  }

  static void processSequence(List<FlashEvent> events) {
    Flashlight._controller = StreamController<int>();
    if (Flashlight._index == 0) _startFlash(events[Flashlight._index]);
    Flashlight._controller.stream.listen((event) {
      if (Flashlight._index < events.length) {
        _startFlash(events[Flashlight._index]);
      } else {
        Flashlight._index = 0;
        _controller.close();
      }
    });
  }

  // static void loopSequence(List<FlashEvent> events, Duration duration) {
  //   //Future.doWhile(() => Future.delayed(futures) processSequence(events);)
  //   Timer(duration: duratio)
  // }

  static void runExample() async {
    //while (true)
    processSequence(example1);
    Future.delayed(Duration(milliseconds: _countTimeEvents(example1) + 5000),
            () => processSequence(example2))
        .then((value) => Future.delayed(
            Duration(milliseconds: _countTimeEvents(example2) + 50),
            () => processSequence(example3)).then((value) => Future.delayed(Duration(milliseconds: _countTimeEvents(example3)+50), () => StadiumController.stadiumController.add(WaitScreen()))));
  }

  static void runExample1() async {
    processSequence(example1);
  }

  static void runExample2() async {
    processSequence(example2);
  }

  static void runExample3() async {
    processSequence(example3);
  }

  static int _countTime(FlashEvent flashEvent) {
    return flashEvent.duration.inMilliseconds * flashEvent.countTicks;
  }

  static int _countTimeEvents(List<FlashEvent> events) {
    int count = 0;
    for (int i = 0; i < events.length; i++) count += _countTime(events[i]);
    return count;
  }
}

class FlashEvent {
  Duration duration;
  int countTicks;
  FlashEvent({@required this.duration, @required this.countTicks});
}

var example1 = [
  FlashEvent(duration: Duration(milliseconds: 2500), countTicks: 1)
];

var example2 = [
  FlashEvent(
      duration: Duration(
        milliseconds: 500,
      ),
      countTicks: 3),
  FlashEvent(
      duration: Duration(
        milliseconds: 1000,
      ),
      countTicks: 3),
  FlashEvent(
      duration: Duration(
        milliseconds: 500,
      ),
      countTicks: 3),
  FlashEvent(
      duration: Duration(
        milliseconds: 1000,
      ),
      countTicks: 3),
  FlashEvent(
      duration: Duration(
        milliseconds: 500,
      ),
      countTicks: 3),
  FlashEvent(
      duration: Duration(
        milliseconds: 1000,
      ),
      countTicks: 3)
];

var example3 = [
  FlashEvent(
      duration: Duration(
        milliseconds: 300,
      ),
      countTicks: 2),
  FlashEvent(
      duration: Duration(
        milliseconds: 100,
      ),
      countTicks: 5),
  FlashEvent(
      duration: Duration(
        milliseconds: 300,
      ),
      countTicks: 2),
  FlashEvent(
      duration: Duration(
        milliseconds: 100,
      ),
      countTicks: 5),
  FlashEvent(
      duration: Duration(
        milliseconds: 300,
      ),
      countTicks: 2),
  FlashEvent(
      duration: Duration(
        milliseconds: 100,
      ),
      countTicks: 5),
  FlashEvent(
      duration: Duration(
        milliseconds: 300,
      ),
      countTicks: 2),
  FlashEvent(
      duration: Duration(
        milliseconds: 100,
      ),
      countTicks: 5),
  FlashEvent(
      duration: Duration(
        milliseconds: 300,
      ),
      countTicks: 2),
  FlashEvent(
      duration: Duration(
        milliseconds: 100,
      ),
      countTicks: 5),
  FlashEvent(
      duration: Duration(
        milliseconds: 300,
      ),
      countTicks: 2),
  FlashEvent(
      duration: Duration(
        milliseconds: 100,
      ),
      countTicks: 5),
  FlashEvent(
      duration: Duration(
        milliseconds: 300,
      ),
      countTicks: 2),
  FlashEvent(
      duration: Duration(
        milliseconds: 100,
      ),
      countTicks: 5),
  FlashEvent(
      duration: Duration(
        milliseconds: 300,
      ),
      countTicks: 2),
  FlashEvent(
      duration: Duration(
        milliseconds: 100,
      ),
      countTicks: 5),
  FlashEvent(
      duration: Duration(
        milliseconds: 300,
      ),
      countTicks: 2),
  FlashEvent(
      duration: Duration(
        milliseconds: 100,
      ),
      countTicks: 5)
];
