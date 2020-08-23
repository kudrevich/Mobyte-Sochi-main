import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

import 'package:football_screens/helpers/helpers.dart';
import 'package:football_screens/main.dart';
import 'package:football_screens/models/achivement.dart';
import 'package:football_screens/models/item.dart';
import 'package:football_screens/models/message.dart';
import 'package:football_screens/models/server_category.dart';
import 'package:football_screens/models/temp_user.dart';
import 'package:http/http.dart' as http;

class Requests {
  static const IP = '178.154.255.209:3002';
  static const URL = 'http://$IP';

  // ignore: non_constant_identifier_names
  static String Gtoken;
  // ignore: non_constant_identifier_names
  static String PushToken;

  static void handleTimeOutException() {
    Helpers.showWarningDialog('Ошибка получения данных',
        'Время на загрузку истекло. Повторите попытку.');
  }

  static void handleLostConnection() {
    Helpers.showWarningDialog(
      'Ошибка получения данных',
      'Соединение с сервером потеряно. Проверьте Интернет-соединение и обновите данные.',
    );
  }

  ///Регистрация пользователя по номеру телефона и паролю
  static Future<http.Response> register(
      {@required String phoneNumber, @required String password}) async {
    String body = jsonEncode(<String, dynamic>{
      "user": {"phone_number": phoneNumber, "password": password}
    });

    return http
        .post(URL + '/user',
            body: body,
            headers: <String, String>{'Content-Type': 'application/json'})
        .timeout(Duration(seconds: 10))
        .catchError((_) => handleTimeOutException(),
            test: (e) => e is TimeoutException)
        .catchError((_) {
          handleLostConnection();
        });
  }

  ///авторизация пользователя по номеру телефона и паролю
  static Future<http.Response> logIn(
      {@required String phoneNumber, @required String password}) async {
    String body = jsonEncode(<String, dynamic>{
      "auth": {"phone_number": phoneNumber, "password": password}
    });

    return http
        .post(URL + '/user_token',
            body: body,
            headers: <String, String>{'Content-Type': 'application/json'})
        .timeout(Duration(seconds: 10))
        .catchError((_) => handleTimeOutException(),
            test: (e) => e is TimeoutException)
        .catchError((_) {
          handleLostConnection();
        });
  }

  //получение данных профиля
  static Future<http.Response> getProfile() async {
    return http
        .get(URL + '/user', headers: {HttpHeaders.authorizationHeader: Gtoken})
        .timeout(Duration(seconds: 10))
        .catchError((_) => handleTimeOutException(),
            test: (e) => e is TimeoutException)
        .catchError((_) {
          handleLostConnection();
        });
  }

  ///отправить данные профиля
  static Future<http.Response> sentProfile() async {
    String body = jsonEncode(<String, dynamic>{
      "user": MyApp.user.toMap(),
    });

    return http
        .put(URL + '/user', body: body, headers: {
          HttpHeaders.authorizationHeader: Gtoken,
          'Content-Type': 'application/json'
        })
        .timeout(Duration(seconds: 10))
        .catchError((_) => handleTimeOutException(),
            test: (e) => e is TimeoutException)
        .catchError((_) {
          handleLostConnection();
        });
  }

  ///отправить данные профиля
  static Future<http.Response> sentPushToken() async {
    String body = jsonEncode(<String, dynamic>{
      "user": {'push_token': Requests.PushToken},
    });

    return http
        .put(URL + '/user', body: body, headers: {
          HttpHeaders.authorizationHeader: Gtoken,
          'Content-Type': 'application/json'
        })
        .timeout(Duration(seconds: 10))
        .catchError((_) => handleTimeOutException(),
            test: (e) => e is TimeoutException)
        .catchError((_) {
          handleLostConnection();
        });
  }

  ///отправить данные профиля
  static Future<http.Response> sentAvatar() async {
    String body = jsonEncode(<String, dynamic>{
      "user": {
        'avatar': "data:image/jpeg;base64," + base64Encode(MyApp.user.avatar)
      },
    });
    return http
        .put(URL + '/user', body: body, headers: {
          HttpHeaders.authorizationHeader: Gtoken,
          'Content-Type': 'application/json'
        })
        .timeout(Duration(seconds: 10))
        .catchError((_) => handleTimeOutException(),
            test: (e) => e is TimeoutException)
        .catchError((_) {
          handleLostConnection();
        });
  }

//   ///Получает jwt-токен для дальнейших запросов
//   static Future<void> getToken(
//       {@required String login, @required String password}) async {
//     String body = jsonEncode(<String, dynamic>{
//       "auth": {"phone_number": login, "password": password}
//     });
//     http.Response response = await http.post(URL + '/user_token',
//         body: body,
//         headers: <String, String>{
//           'Content-Type': 'application/json'
//         }).timeout(Duration(milliseconds: 10000));
//     if (response.statusCode == 201) //201 - статус "Ок"
//     {
//       Gtoken = jsonDecode(response.body)["jwt"];
//       String token = await fbm.getToken();
//       Requests.setPushToken(token: token);
//     } else
//       throw new RequestErrorExeption(
//           message:
//               "Ошибка при входе в систему. Проверьте корректность данных.");
//   }

  ///Получить информацию о пользователе
  // static Future<User> getProfile() async {
  //   http.Response response = await http.get(URL + "/user", headers: {
  //     HttpHeaders.authorizationHeader: Gtoken
  //   }).timeout(Duration(milliseconds: 10000));

  // }

//   ///Устанавливает пуш-токен для неавторизованного пользователя
//   static Future<bool> setTempPushToken() async {
//     String token = await fbm.getToken();
//     http.Response response = await http
//         .post(URL + "/temp_users",
//             headers: {
//               'Accept': '*/*',
//               'Content-Type': 'application/json',
//             },
//             body: jsonEncode({
//               'push_token': (token ?? "0"),
//             }))
//         .timeout(Duration(milliseconds: 10000));
//     if (response.statusCode == 201 || response.statusCode == 208) {
//       return true;
//     } else {
//       throw new RequestErrorExeption(
//           message: "Ошибка во время выполнения запроса.");
//     }
//   }

//   ///Изменение PushToken
//   static Future<bool> setPushToken({@required String token}) async {
//     var jsonen = jsonEncode(
//       <String, dynamic>{
//         "user": {"push_token": token}
//       },
//     );
//     http.Response response = await http
//         .put(
//           URL + "/user",
//           headers: {
//             HttpHeaders.authorizationHeader: Gtoken,
//             'Content-Type': 'application/json'
//           },
//           body: jsonen,
//         )
//         .timeout(Duration(milliseconds: 10000));

//     return response.statusCode == 200
//         ? true
//         : throw new RequestErrorExeption(
//             message: "Ошибка во время выполнения запроса.");
//   }

  ///Загрузка локальной корзины на сервер
  static Future<bool> updateBasket(Map<String, int> basket) async {
    var body = jsonEncode({"basket": basket});
    http.Response response = await http
        .post(URL + "/user/update_basket",
            headers: {
              HttpHeaders.authorizationHeader: Gtoken,
              'Accept': '*/*',
              'Content-Type': 'application/json',
            },
            body: body)
        .timeout(Duration(milliseconds: 10000));
    return response.statusCode == 200
        ? true
        : throw new RequestErrorExeption(
            message: response.statusCode.toString());
  }

  ///Запрос на получение всех блюд
  static Future<List<Item>> getItems() async {
    List<Item> res = new List<Item>();
    http.Response response = await http
        .get(
          URL + "/products",
        )
        .timeout(Duration(milliseconds: 10000));

    if (response.statusCode == 200) {
      List<dynamic> temp = jsonDecode(response.body);
      temp.forEach((elem) {
        res.add(new Item.fromData(elem));
      });
      return res;
    }
    if (response.statusCode == 204) {
      return res;
    } else
      throw new RequestErrorExeption(message: response.statusCode.toString());
  }

  static Future<CategoryTable> getCatTable() async {
    http.Response response = await http
        .get(URL + "/categories")
        .timeout(Duration(milliseconds: 10000));

    if (response.statusCode == 204) {
      return CategoryTable.fromDate();
    }
    if (response.statusCode == 200) {
      return CategoryTable.fromDate(data: jsonDecode(response.body));
    } else
      throw new RequestErrorExeption(message: response.statusCode.toString());
  }

  ///Загружает историю сообщений данного чатика
  static Future<List<Message>> getHistory({int page = 1}) async {
    List<Message> result = new List<Message>();
    http.Response response = await http.get(
      URL + "/messages/get_history_general?page=$page",
      headers: {
        HttpHeaders.authorizationHeader: Gtoken,
      },
    ).timeout(Duration(milliseconds: 10000));

    if (response.statusCode == 204)
      return null;
    else if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> messageHistory = jsonDecode(response.body);
      messageHistory.forEach((message) {
        result.add(new Message.fromJson(message, history: true));
      });
      return result;
    } else
      throw new RequestErrorExeption(message: "Неизвестная ошибка.");
  }

  static Future<List<tempUser>> getRating(int page) async {
    List<tempUser> users = [];
    http.Response response = await http.get(
      URL + "/user/get_rating?page=$page",
      headers: {
        HttpHeaders.authorizationHeader: Gtoken,
      },
    ).timeout(Duration(milliseconds: 10000));

    if (response.statusCode == 200) {
      List<dynamic> usersJson = jsonDecode(response.body);
      usersJson.forEach((user) {
        users.add(new tempUser.fromJson(user));
      });
      return users;
    } else
      return null;
  }

  static Future<List<Achivement>> getAchivements() async {
    List<Achivement> achivements = [];
    http.Response response = await http.get(
      URL + "/achievements",
      headers: {
        HttpHeaders.authorizationHeader: Gtoken,
      },
    ).timeout(Duration(milliseconds: 10000));

    if (response.statusCode == 200) {
      List<dynamic> achiveJson = jsonDecode(response.body);
      achiveJson.forEach((achive) {
        achivements.add(new Achivement.fromJson(achive));
      });
    } else
      return null;
  }

//   static Future<void> getShopData() async {
//     http.Response response = await http.get(URL + "/user/location_shop");
//     print(response.body);
//     Map<String, dynamic> answer = jsonDecode(response.body);
//     Constants.positionOfOwner = LatLng(answer['latitude'], answer['longitude']);
//     Constants.rubPerKm = answer['price_km'];
//   }
}

class RequestErrorExeption implements Exception {
  final String message;

  const RequestErrorExeption({@required this.message});
}
