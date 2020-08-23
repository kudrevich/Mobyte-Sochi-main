import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:football_screens/UI/chat_page/chat_page.dart';
import 'package:football_screens/UI/home_page/home_page.dart';
import 'package:football_screens/UI/main_menu_page/main_menu_page.dart';
import 'package:football_screens/UI/profile_page/profile_page.dart';
import 'package:football_screens/UI/stadium_mode_page/stadium_mode_page.dart';
import 'package:football_screens/UI/stadium_mode_page/stdium_widgets/chants.dart';
import 'package:football_screens/UI/widgets/custom_navigation_bar.dart';
import 'package:football_screens/bloc/ladder_bloc/ladder_bloc.dart';
import 'package:football_screens/bloc/market_bloc/market_bloc.dart';
import 'package:football_screens/helpers/globals.dart';
import 'package:football_screens/helpers/helpers.dart';
import 'package:football_screens/helpers/socket.dart';
import 'package:football_screens/models/navbar_item_data.dart';

import '../main.dart';
import 'chat/chat.dart';
import 'home_page/home_page.dart';
import 'ladder_page/ladder_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  GifController _controller;
  int _selectedIndex = 0;
  void _tapHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<NavbarItemData> _items;
  @override
  void initState() {
    _controller = GifController(vsync: this);
    MyApp.marketBloc.add(Update());
    MyApp.ladderBloc.add(LadderUpdate());

    _items = [
      NavbarItemData(icon: 'home', text: "Дом"),
      NavbarItemData(icon: 'ladder', text: "Лидеры"),
      NavbarItemData(icon: 'ladder', text: "Matches", flag: true),
      NavbarItemData(icon: 'market', text: "Магазин"),
      NavbarItemData(icon: 'profile', text: "профиль"),
    ];
    super.initState();
  }

  List<Widget> pages = [
    HomePage(),
    LadderPage(),
    HomePage(),
    MainMenuPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          SocketStream ss = SocketStream();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => StadiumModePage(),
            ),
          );
        },
        child: GifImage(
          width: Helpers.responsiveHeight(26, context),
          height: Helpers.responsiveHeight(26, context),
          image: AssetImage('assets/ball.gif'),
          controller: _controller
            ..repeat(
              min: 0,
              max: 28,
              period: Duration(milliseconds: 1300),
            ),
        ),
      ),
      key: myGlobals.profileKey,
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _selectedIndex,
        itemTapped: _tapHandler,
        items: _items,
      ),
      body: Center(
        child: IndexedStack(
          children: pages,
          index: _selectedIndex,
        ),
      ),
    );
  }
}
