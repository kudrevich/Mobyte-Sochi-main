import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class UserRepository {

  static final storage = new FlutterSecureStorage();
  static int iat_token = 0;

  static Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await storage.delete(key: 'token');
    return;
  }

  static Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await storage.write(key: 'token', value: token);
    var tk = await storage.read(key: 'token');
    // print('///// new token ////');
    // print(tk);
    return;
  }

  static Future<bool> hasToken() async {
    /// read from keystore/keychain
   var token =  await storage.read(key: 'token');
    return token != null;
  }

   static Future<String> getToken() async {
    var token = await storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteNumber() async {
    /// delete from keystore/keychain
    await storage.delete(key: 'number');
    return;
  }

  static Future<void> persistNumber(String number) async {
    /// write to keystore/keychain
    await storage.write(key: 'number', value: number);
    var tk = await storage.read(key: 'number');
    // print(tk);
    return;
  }

  static Future<bool> hasNumber() async {
    /// read from keystore/keychain
   var token =  await storage.read(key: 'number');
    return token != null;
  }

   static Future<String> getNumber() async {
    var token = await storage.read(key: 'number');
    return token;
  }

  static Future<void> deletePassword() async {
    /// delete from keystore/keychain
    await storage.delete(key: 'password');
    return;
  }

  static Future<void> persistPassword(String password) async {
    /// write to keystore/keychain
    await storage.write(key: 'password', value: password);
    var tk = await storage.read(key: 'password');
    // print(tk);
    return;
  }

  static Future<bool> hasPassword() async {
    /// read from keystore/keychain
   var token =  await storage.read(key: 'password');
    return token != null;
  }

   static Future<String> getPassword() async {
    var token = await storage.read(key: 'password');
    return token;
  }

 // токен для пуш-уведомлений
  static Future<void> persistPushToken(String pushToken) async {
    await storage.write(key: 'pushToken', value: pushToken);
    return;
  }

  static Future<bool> hasPushToken() async {
    var pushToken = await storage.read(key: 'pushToken');
    return pushToken !=null;
  }

  static Future<String> getPuchToken() async {
    var pushToken = await storage.read(key: 'pushToken');
    return pushToken;
  }

  static Future<void> deletePushToken() async {
    await storage.delete(key: 'pushToken');
    return;
  }

}


