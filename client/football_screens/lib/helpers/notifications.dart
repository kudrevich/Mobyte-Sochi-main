import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//Должна инишалка запускаться при входе в аккаунт



class FCMNotifications {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  FlutterLocalNotificationsPlugin _fln = new FlutterLocalNotificationsPlugin();


  

  Future<void> onSelectNotification(String payload) async {
    print("____________LOCALNOTIFICATION__________________");
    print("payload is $payload");

  }

  void configLocalNotification() {
    var initializationSettingsAndroid = new AndroidInitializationSettings(
        '@mipmap/ic_launcher'); //иконка в уведомлении
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    _fln.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

 Future initialise() async {
    print('Initializing...');
    configLocalNotification();

    //Обновляем пуш-токен пользователя
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
          Platform.isAndroid ? 'com.dfa.appnis' : 'com.duytq.appnis', 
          'App_nis', 
          'Notification chan',
          playSound: true, 
          enableVibration: true, 
          importance: Importance.High, 
          priority: Priority.High, 
        ); 
        var iOSPlatformChannelSpecifics = new IOSNotificationDetails(); 
        var platformChannelSpecifics = new NotificationDetails(
            androidPlatformChannelSpecifics,
            iOSPlatformChannelSpecifics); 
        var title = message["notification"]["title"];
        var body = message["notification"]["body"];
        _fln.show(1, title, body, platformChannelSpecifics, //!Hueta
            payload: "payload"); 
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        await Future.delayed(Duration(seconds: 2));
      
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        
      },
    );
  }
}