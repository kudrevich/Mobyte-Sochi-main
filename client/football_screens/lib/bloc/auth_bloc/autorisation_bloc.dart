import 'dart:async';
import "dart:convert";
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_screens/UI/auth_pages_block/auth_page/auth_page.dart';
import 'package:football_screens/UI/main_page.dart';
import 'package:football_screens/bloc/user_bloc/user_bloc.dart';
import 'package:football_screens/helpers/globals.dart';
import 'package:football_screens/helpers/helpers.dart';
import 'package:football_screens/helpers/notifications.dart';
import 'package:football_screens/helpers/requests.dart';
import 'package:football_screens/helpers/user_repository.dart';
import 'package:football_screens/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
part 'autorisation_event.dart';
part 'autorisation_state.dart';

class AutorisationBloc extends Bloc<AutorisationEvent, AutorisationState> {
  String _enteredNumber = ''; //введенный номер
  String _password = '';

  String _registerPassword = '';
  String _registerNumber = '';

  String _confirmedPassword = '';
  //String _savedNumber; //для TouchID

  AutorisationBloc() : super(AutorisationInitial(' ', ' '));

  Stream<AutorisationState> enterInProfile(bool isReg) async* {
    var onlyNum = Helpers.getOnlyNumber(_enteredNumber);
    if (onlyNum.length != 11) {
      Helpers.showWarningDialog('Ошибка ввода', 'Номер ввведён некорректно');
      return;
    }
    if (_password.length == 0) {
      Helpers.showWarningDialog('Ошибка ввода', 'Пароль не введён');
      return;
    }

    if (_password.length < 8) {
      Helpers.showWarningDialog(
          'Ошибка авторизации', 'Пароль должен содержать не менее 8 символов');
      return;
    }

    var r = RegExp('[A-Za-zА-Яа-я]');
    if (!r.hasMatch(_password)) {
      Helpers.showWarningDialog(
          'Ошибка авторизации', 'Пароль должен содержать хотя бы одну букву');
      return;
    }

    var isConnetection = await Helpers.checkInternetConnection();
    if (isConnetection) {
      yield StartLoadingState(_password, _enteredNumber);
      http.Response response = await Requests.logIn(
          phoneNumber: _enteredNumber, password: _password);
      yield FinishLoadingState(_password, _enteredNumber);
      //если есть соединение
      if (response != null) {
        if (response.statusCode != 201) {
          //ошибка
          Helpers.showWarningDialog(
              "Ошибка авторизации", 'Неверный логин или пароль');
        } else {
          if (isReg) {
            Navigator.of(myGlobals.globalKey.currentContext).pop();
            Navigator.of(myGlobals.globalKey.currentContext).pop();
          }
          var body = Helpers.getResponseBody(response.body);
          //нет ошибки
          Navigator.of(myGlobals.globalKey.currentContext)
              .pushReplacement(MaterialPageRoute(builder: (_) => MainPage()));
          myGlobals.auth = false;
          String token = body['jwt'];
          Requests.Gtoken = token;

          UserRepository.persistNumber(_enteredNumber);
          UserRepository.persistPassword(_password);
          UserRepository.persistToken(token);
          MyApp.userBloc.add(GetProfile());
          MyApp.ladderBloc.page = 1;
          //инициализация уведомлений
          var notifications = new FCMNotifications();
          notifications.initialise();
          final fbm = FirebaseMessaging();
          Requests.PushToken = await fbm.getToken();
          Requests.sentPushToken();

          // await notifications.initialise();
          yield FinishLoadingState(_password, _enteredNumber);
        }
      }
    } else //нет соединения
    {
      Helpers.showWarningDialog(
          'Ошибка получения данных', 'Отсутствует подключение к Интернету');
    }
  }

  Stream<AutorisationState> register() async* {
    if (Helpers.getOnlyNumber(_registerNumber).length != 11) {
      Helpers.showWarningDialog(
          'Ошибка регистрации', 'Номер введён неправильно');
      return;
    }

    if (_registerPassword.length < 8) {
      Helpers.showWarningDialog(
          'Ошибка регистрации', 'Пароль должен содержать не менее 8 символов');
      return;
    }

    var r = RegExp('[A-Za-zА-Яа-я]');
    if (!r.hasMatch(_registerPassword)) {
      Helpers.showWarningDialog(
          'Ошибка регистрации', 'Пароль должен содержать хотя бы одну букву');
      return;
    }

    //кнопка "Создать аккаунт"
    if (_registerPassword != _confirmedPassword) //проверка подтверждения пароля
    {
      Helpers.showWarningDialog(
          'Ошибка регистрации', 'Введённые пароли не совпадают');
      return;
    }
    var isConnetection = await Helpers.checkInternetConnection();
    if (isConnetection) {
      //есть соединение
      yield StartLoadingState(_registerPassword, _registerNumber);
      var response = await Requests.register(
          phoneNumber: _registerNumber, password: _registerPassword);
      yield FinishLoadingState(_registerPassword, _registerNumber);
      if (response != null) {
        if (response.statusCode != 200) {
          if (response.statusCode == 400) {
            Helpers.showWarningDialog(
                'Ошибка!', 'На данный номер уже зарегистрирован аккаунт');
          }
          //ошибка
        } else {
          //нет ошибки
          _enteredNumber = _registerNumber;
          _password = _registerPassword;
          yield RegisterSuccess(_enteredNumber, _password);
        }
      }
    } else //нет соединения
    {
      Helpers.showWarningDialog(
          'Ошибка получения данных', 'Отсутствует подключение к Интернету');
    }
  }

  Stream<AutorisationState> logout() async* {
    if (await UserRepository.hasPushToken()) UserRepository.deletePushToken();
    Navigator.of(myGlobals.globalKey.currentContext)
        .pushReplacement(MaterialPageRoute(builder: (_) => AuthPage()));
    myGlobals.auth = true;
    yield AutorisationInitial(_password, _enteredNumber);
  }

  @override
  Stream<AutorisationState> mapEventToState(
    AutorisationEvent event,
  ) async* {
    if (event is NumberChange) {
      _enteredNumber = event.data;
      yield AutorisationInitial(_password, _enteredNumber);
    } else if (event is PasswordChange) {
      _password = event.data;
      yield AutorisationInitial(_password, _enteredNumber);
    }
    if (event is RegisterNumberChange) {
      _registerNumber = event.data;
      yield AutorisationInitial(_password, _enteredNumber);
    } else if (event is RegisterPasswordChange) {
      _registerPassword = event.data;
      yield AutorisationInitial(_password, _enteredNumber);
    } else if (event is ConfirmedPasswordChange) {
      _confirmedPassword = event.data;
    } else if (event is LogOut) {
    } else if (event is EnterInProfile) {
      //запрос login /нажатие на "Войти"
      yield* enterInProfile(event.isReg);
    } else if (event is Register) {
      yield* register();
    } else if (event is DataLoaded) {
      yield AutorisationInitial(_password, _enteredNumber);
    } else if (event is LoadData) {
      if (await UserRepository.hasPassword()) {
        _password = await UserRepository.getPassword();
      }
      if (await UserRepository.hasNumber()) {
        _enteredNumber = await UserRepository.getNumber();
      }
      ///////////////
      yield LoadDataState(_password, _enteredNumber);
    }
    if (event is LogOut) {
      yield* logout();
    }
    if (event is FinishLoadData) {
      yield AutorisationInitial(_password, _enteredNumber);
    }
  }
}
