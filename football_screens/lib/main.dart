import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/UI/auth_pages_block/auth_page/auth_page.dart';
import 'package:football_screens/UI/constants.dart';
import 'package:football_screens/UI/main_page.dart';
import 'package:football_screens/bloc/auth_bloc/autorisation_bloc.dart';
import 'package:football_screens/helpers/flashlight.dart';
import 'package:football_screens/helpers/globals.dart';
import 'package:lamp/lamp.dart';
import 'package:torch_compat/torch_compat.dart';
import 'package:football_screens/bloc/ladder_bloc/ladder_bloc.dart';
import 'package:football_screens/bloc/user_bloc/user_bloc.dart';
import 'package:football_screens/helpers/globals.dart';
import 'package:football_screens/helpers/ui_commands.dart';
import 'package:football_screens/models/achivement.dart';
import 'package:football_screens/models/user.dart';

import 'bloc/market_bloc/market_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: close_sinks
  static final authBloc = AutorisationBloc();

  // ignore: close_sinks
  static final streamControllerUI = StreamController<UI_Command>.broadcast();

  // ignore: close_sinks
  static final userBloc = UserBloc();

  static final streaamUI = streamControllerUI.stream;

  static final MarketBloc marketBloc = MarketBloc();
  static final LadderBloc ladderBloc = LadderBloc();

  static List<Achivement> achivements = [];

  static final User user = User();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GestureDetector(
      onTap: () {
        //расфокусирование и борьба с появляющейся клавиатурой
        FocusScope.of(context).requestFocus(new FocusNode());
        // FocusScopeNode currentFocus = FocusScope.of(context);
        // currentFocus.unfocus();
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AutorisationBloc>(
            create: (_) => MyApp.authBloc,
          ),
          BlocProvider<UserBloc>(
            create: (_) => MyApp.userBloc,
          ),
          BlocProvider<MarketBloc>(
            create: (_) => MyApp.marketBloc,
          ),
          BlocProvider(
            create: (_) => MyApp.ladderBloc,
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            backgroundColor: lightGrey,
            scaffoldBackgroundColor: Colors.white,
            accentColor: blue,
            primaryColor: yellow,
          ),
          title: 'Football',
          home: AuthPage(),
        ),
      ),
    );
  }
}
