import 'package:flutter/material.dart';
import 'package:football_screens/UI/constants.dart';
import 'package:football_screens/UI/defaultScreens/cartButton.dart';
import 'package:football_screens/UI/item_page/widgets/pop_back_button.dart';
import 'package:football_screens/UI/stadium_mode_page/stdium_widgets/caraoce.dart';
import 'package:football_screens/helpers/flashlight.dart';
import 'package:football_screens/helpers/helpers.dart';
import 'package:football_screens/models/stadium_event.dart';
import 'package:numberpicker/numberpicker.dart';

class StadiumModePage extends StatefulWidget {
  Widget body;
  StadiumModePage({this.body});
  @override
  _StadiumModePageState createState() => _StadiumModePageState();
}

class _StadiumModePageState extends State<StadiumModePage> {
  @override
  initState() {
    StadiumController.stadiumController.add(WaitScreen());
    super.initState();
  }

  int _sector = 1;
  int _tribuna = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Object>(
          stream: StadiumController.stadiumController.stream,
          builder: (context, snapshot) {
            if (snapshot.data is WaitScreen) {
              return defaultScreen();
            }
            if (snapshot.data is LightShow) {
              Flashlight.runExample();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.only(
                      top: Helpers.responsiveHeight(32, context),
                      right: Helpers.responsiveWidth(24, context),
                      left: Helpers.responsiveWidth(24, context),
                      bottom: Helpers.responsiveHeight(8, context),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PopBackButton(),
                        Text(
                          'На стадионе',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Helpers.responsiveHeight(21, context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Helpers.responsiveHeight(20, context),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Место'),
                        SizedBox(
                          width: Helpers.responsiveWidth(10, context),
                        ),
                        Container(
                          width: Helpers.responsiveWidth(1, context),
                          color: Colors.black,
                          height: Helpers.responsiveHeight(30, context),
                        ),
                        SizedBox(
                          width: Helpers.responsiveWidth(7, context),
                        ),
                        DropdownButton(
                          value: _sector,
                          items: [
                            DropdownMenuItem(
                              child: Text("A"),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text("B"),
                              value: 2,
                            ),
                            DropdownMenuItem(
                              child: Text("C"),
                              value: 3,
                            ),
                            DropdownMenuItem(
                              child: Text("D"),
                              value: 4,
                            ),
                            DropdownMenuItem(
                              child: Text("Vip"),
                              value: 5,
                            ),
                          ],
                          onChanged: (value) {
                            //setState(() {
                            //  _sector = value;
                            //});
                          },
                        ),
                        Container(
                          width: Helpers.responsiveWidth(1, context),
                          color: Colors.black,
                          height: Helpers.responsiveHeight(30, context),
                        ),
                        SizedBox(
                          width: Helpers.responsiveWidth(7, context),
                        ),
                        DropdownButton(
                          value: _tribuna,
                          items: [
                            DropdownMenuItem(
                              child: Text("101"),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text("102"),
                              value: 2,
                            ),
                            DropdownMenuItem(
                              child: Text("103"),
                              value: 3,
                            ),
                            DropdownMenuItem(
                              child: Text("D104"),
                              value: 4,
                            ),
                            DropdownMenuItem(
                              child: Text("105"),
                              value: 5,
                            ),
                            DropdownMenuItem(
                              child: Text("106"),
                              value: 6,
                            ),
                            DropdownMenuItem(
                              child: Text("107"),
                              value: 7,
                            ),
                            DropdownMenuItem(
                              child: Text("108"),
                              value: 8,
                            ),
                            DropdownMenuItem(
                              child: Text("D109"),
                              value: 9,
                            ),
                            DropdownMenuItem(
                              child: Text("301"),
                              value: 10,
                            ),
                            DropdownMenuItem(
                              child: Text("302"),
                              value: 11,
                            ),
                            DropdownMenuItem(
                              child: Text("303"),
                              value: 12,
                            ),
                            DropdownMenuItem(
                              child: Text("304"),
                              value: 13,
                            ),
                            DropdownMenuItem(
                              child: Text("305"),
                              value: 14,
                            ),
                            DropdownMenuItem(
                              child: Text("306"),
                              value: 15,
                            ),
                            DropdownMenuItem(
                              child: Text("307"),
                              value: 16,
                            ),
                            DropdownMenuItem(
                              child: Text("308"),
                              value: 17,
                            ),
                            DropdownMenuItem(
                              child: Text("309"),
                              value: 18,
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                        Container(
                          width: Helpers.responsiveWidth(1, context),
                          color: Colors.black,
                          height: Helpers.responsiveHeight(30, context),
                        ),
                        SizedBox(
                          width: Helpers.responsiveWidth(7, context),
                        ),
                        DropdownButton(
                          value: _sector,
                          items: [
                            DropdownMenuItem(
                              child: Text("1"),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text("2"),
                              value: 2,
                            ),
                            DropdownMenuItem(
                              child: Text("3"),
                              value: 3,
                            ),
                            DropdownMenuItem(
                              child: Text("4"),
                              value: 4,
                            ),
                            DropdownMenuItem(
                              child: Text("5"),
                              value: 5,
                            ),
                            DropdownMenuItem(
                              child: Text("6"),
                              value: 6,
                            ),
                            DropdownMenuItem(
                              child: Text("7"),
                              value: 7,
                            ),
                            DropdownMenuItem(
                              child: Text("8"),
                              value: 8,
                            ),
                            DropdownMenuItem(
                              child: Text("9"),
                              value: 9,
                            ),
                            DropdownMenuItem(
                              child: Text("10"),
                              value: 10,
                            ),
                            DropdownMenuItem(
                              child: Text("11"),
                              value: 11,
                            ),
                            DropdownMenuItem(
                              child: Text("12"),
                              value: 12,
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                        Container(
                          width: Helpers.responsiveWidth(1, context),
                          color: Colors.black,
                          height: Helpers.responsiveHeight(30, context),
                        ),
                        SizedBox(
                          width: Helpers.responsiveWidth(7, context),
                        ),
                        DropdownButton(
                          value: _tribuna,
                          items: [
                            DropdownMenuItem(
                              child: Text("1"),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text("2"),
                              value: 2,
                            ),
                            DropdownMenuItem(
                              child: Text("3"),
                              value: 3,
                            ),
                            DropdownMenuItem(
                              child: Text("4"),
                              value: 4,
                            ),
                            DropdownMenuItem(
                              child: Text("5"),
                              value: 5,
                            ),
                            DropdownMenuItem(
                              child: Text("6"),
                              value: 6,
                            ),
                            DropdownMenuItem(
                              child: Text("7"),
                              value: 7,
                            ),
                            DropdownMenuItem(
                              child: Text("8"),
                              value: 8,
                            ),
                            DropdownMenuItem(
                              child: Text("9"),
                              value: 9,
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Helpers.responsiveHeight(60, context),
                  ),
//TODO: Ниже закоменченные строчки являются наполнением экрана там где лого в фигме
//          Padding(
//            padding: EdgeInsets.symmetric(
//              horizontal: Helpers.responsiveWidth(50, context),
//            ),
//            child: Text(
//              'Администратор скоро запустит флешмоб',
//              textAlign: TextAlign.center,
//              style: TextStyle(
//                color: Color(0xffA3AEB3),
//                fontSize: Helpers.responsiveHeight(24, context),
//              ),
//            ),
//          ),
//          SizedBox(
//            height: Helpers.responsiveHeight(100, context),
//          ),
//          Padding(
//            padding: EdgeInsets.symmetric(
//              horizontal: Helpers.responsiveWidth(50, context),
//            ),
//            child: Text(
//              'Оставайтесь на экране, чтобы принять участие',
//              textAlign: TextAlign.center,
//              style: TextStyle(
//                color: Color(0xffA3AEB3),
//                fontSize: Helpers.responsiveHeight(24, context),
//              ),
//            ),
//          ),
//          SizedBox(
//            height: Helpers.responsiveHeight(60, context),
//          ),
//          Container(
//            height: 177,
//            width: 177,
//            decoration: BoxDecoration(
//              image: DecorationImage(
//                image: AssetImage('assets/logo.png'),
//              ),
//            ),
//          ),
                  //TODO:Все что ниже это второй экран

                  SizedBox(
                    height: Helpers.responsiveHeight(60, context),
                  ),
                  Text(
                    'Световое шоу',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Helpers.responsiveHeight(36, context),
                    ),
                  ),
                  SizedBox(
                    height: Helpers.responsiveHeight(170, context),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Helpers.responsiveWidth(50, context),
                    ),
                    child: Text(
                      'Поднимите экран вспышкой в сторону игрового поля',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xffA3AEB3),
                        fontSize: Helpers.responsiveHeight(24, context),
                      ),
                    ),
                  ),
                ],
              );
            }
            if (snapshot.data is Chant) {
              Chant chant = snapshot.data;

              Future.delayed(Duration(seconds: chant.duration)).then((value) =>
                  StadiumController.stadiumController.add(WaitScreen()));
              return Caraoce();
            }
            return defaultScreen();
          }),
    );
  }

  Widget defaultScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(),
          padding: EdgeInsets.only(
            top: Helpers.responsiveHeight(32, context),
            right: Helpers.responsiveWidth(24, context),
            left: Helpers.responsiveWidth(24, context),
            bottom: Helpers.responsiveHeight(30, context),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PopBackButton(),
              Text(
                'На стадионе',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Helpers.responsiveHeight(21, context),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Место'),
              SizedBox(
                width: Helpers.responsiveWidth(10, context),
              ),
              Container(
                width: Helpers.responsiveWidth(1, context),
                color: Colors.black,
                height: Helpers.responsiveHeight(30, context),
              ),
              SizedBox(
                width: Helpers.responsiveWidth(7, context),
              ),
              DropdownButton(
                value: _sector,
                items: [
                  DropdownMenuItem(
                    child: Text("A"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("B"),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text("C"),
                    value: 3,
                  ),
                  DropdownMenuItem(
                    child: Text("D"),
                    value: 4,
                  ),
                  DropdownMenuItem(
                    child: Text("Vip"),
                    value: 5,
                  ),
                ],
                onChanged: (value) {
                  //setState(() {
                  //  _sector = value;
                  //});
                },
              ),
              Container(
                width: Helpers.responsiveWidth(1, context),
                color: Colors.black,
                height: Helpers.responsiveHeight(30, context),
              ),
              SizedBox(
                width: Helpers.responsiveWidth(7, context),
              ),
              DropdownButton(
                value: _tribuna,
                items: [
                  DropdownMenuItem(
                    child: Text("101"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("102"),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text("103"),
                    value: 3,
                  ),
                  DropdownMenuItem(
                    child: Text("D104"),
                    value: 4,
                  ),
                  DropdownMenuItem(
                    child: Text("105"),
                    value: 5,
                  ),
                  DropdownMenuItem(
                    child: Text("106"),
                    value: 6,
                  ),
                  DropdownMenuItem(
                    child: Text("107"),
                    value: 7,
                  ),
                  DropdownMenuItem(
                    child: Text("108"),
                    value: 8,
                  ),
                  DropdownMenuItem(
                    child: Text("D109"),
                    value: 9,
                  ),
                  DropdownMenuItem(
                    child: Text("301"),
                    value: 10,
                  ),
                  DropdownMenuItem(
                    child: Text("302"),
                    value: 11,
                  ),
                  DropdownMenuItem(
                    child: Text("303"),
                    value: 12,
                  ),
                  DropdownMenuItem(
                    child: Text("304"),
                    value: 13,
                  ),
                  DropdownMenuItem(
                    child: Text("305"),
                    value: 14,
                  ),
                  DropdownMenuItem(
                    child: Text("306"),
                    value: 15,
                  ),
                  DropdownMenuItem(
                    child: Text("307"),
                    value: 16,
                  ),
                  DropdownMenuItem(
                    child: Text("308"),
                    value: 17,
                  ),
                  DropdownMenuItem(
                    child: Text("309"),
                    value: 18,
                  ),
                ],
                onChanged: (value) {},
              ),
              Container(
                width: Helpers.responsiveWidth(1, context),
                color: Colors.black,
                height: Helpers.responsiveHeight(30, context),
              ),
              SizedBox(
                width: Helpers.responsiveWidth(7, context),
              ),
              DropdownButton(
                value: _sector,
                items: [
                  DropdownMenuItem(
                    child: Text("1"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("2"),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text("3"),
                    value: 3,
                  ),
                  DropdownMenuItem(
                    child: Text("4"),
                    value: 4,
                  ),
                  DropdownMenuItem(
                    child: Text("5"),
                    value: 5,
                  ),
                  DropdownMenuItem(
                    child: Text("6"),
                    value: 6,
                  ),
                  DropdownMenuItem(
                    child: Text("7"),
                    value: 7,
                  ),
                  DropdownMenuItem(
                    child: Text("8"),
                    value: 8,
                  ),
                  DropdownMenuItem(
                    child: Text("9"),
                    value: 9,
                  ),
                  DropdownMenuItem(
                    child: Text("10"),
                    value: 10,
                  ),
                  DropdownMenuItem(
                    child: Text("11"),
                    value: 11,
                  ),
                  DropdownMenuItem(
                    child: Text("12"),
                    value: 12,
                  ),
                ],
                onChanged: (value) {},
              ),
              Container(
                width: Helpers.responsiveWidth(1, context),
                color: Colors.black,
                height: Helpers.responsiveHeight(30, context),
              ),
              SizedBox(
                width: Helpers.responsiveWidth(7, context),
              ),
              DropdownButton(
                value: _tribuna,
                items: [
                  DropdownMenuItem(
                    child: Text("1"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("2"),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text("3"),
                    value: 3,
                  ),
                  DropdownMenuItem(
                    child: Text("4"),
                    value: 4,
                  ),
                  DropdownMenuItem(
                    child: Text("5"),
                    value: 5,
                  ),
                  DropdownMenuItem(
                    child: Text("6"),
                    value: 6,
                  ),
                  DropdownMenuItem(
                    child: Text("7"),
                    value: 7,
                  ),
                  DropdownMenuItem(
                    child: Text("8"),
                    value: 8,
                  ),
                  DropdownMenuItem(
                    child: Text("9"),
                    value: 9,
                  ),
                ],
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        SizedBox(
          height: Helpers.responsiveHeight(60, context),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Helpers.responsiveWidth(50, context),
          ),
          child: Text(
            'Администратор скоро запустит флешмоб',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xffA3AEB3),
              fontSize: Helpers.responsiveHeight(24, context),
            ),
          ),
        ),
        SizedBox(
          height: Helpers.responsiveHeight(80, context),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Helpers.responsiveWidth(50, context),
          ),
          child: Text(
            'Оставайтесь на экране, чтобы принять участие',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xffA3AEB3),
              fontSize: Helpers.responsiveHeight(24, context),
            ),
          ),
        ),
        SizedBox(
          height: Helpers.responsiveHeight(60, context),
        ),
        Container(
          height: 177,
          width: 177,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/logo.png'),
            ),
          ),
        ),
      ],
    );
  }
}
