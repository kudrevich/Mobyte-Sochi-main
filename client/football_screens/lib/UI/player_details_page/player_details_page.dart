import 'package:flutter/material.dart';
import 'package:football_screens/UI/player_details_page/widgets/stat_item.dart';
import 'package:football_screens/UI/widgets/app_bar.dart';

import '../../helpers/helpers.dart';
import '../../helpers/helpers.dart';
import '../../helpers/helpers.dart';
import '../../helpers/helpers.dart';
import '../../helpers/helpers.dart';
import '../../helpers/helpers.dart';
import '../../helpers/helpers.dart';
import '../../helpers/helpers.dart';

class PlayerDetailsPage extends StatelessWidget {
  PlayerDetailsPage(
      {this.name = 'Николай',
      this.secondName = "Заболотный",
      this.ext = 'jpg',
      this.fuck = "",
      this.description =
          "Николай Заболотный начал заниматься футболом в 7 лет. Является воспитанником петербургских спортивных школ «Смена» и «Зенит»."});
  String name;
  String secondName;
  String description;
  String ext;
  String fuck;
  List<StatItem> _items = [
    StatItem(
      title: "Пассы",
      mark: 190,
    ),
    StatItem(),
    StatItem(
      title: "Удаления",
      mark: 3,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: Helpers.responsiveHeight(20, context),
                right: Helpers.responsiveWidth(35, context),
                left: Helpers.responsiveWidth(35, context),
                bottom: Helpers.responsiveHeight(20, context),
              ),
              height: Helpers.responsiveHeight(325, context),
              width: Helpers.responsiveWidth(400, context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      AssetImage('assets/players/${fuck}${secondName}.${ext}'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: Helpers.responsiveWidth(35, context),
                left: Helpers.responsiveWidth(35, context),
              ),
              child: Center(
                child: Text(
                  name + " " + secondName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Helpers.responsiveHeight(30, context),
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: Helpers.responsiveWidth(35, context),
                left: Helpers.responsiveWidth(35, context),
                top: Helpers.responsiveHeight(15, context),
                bottom: Helpers.responsiveHeight(20, context),
              ),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(
                  left: Helpers.responsiveWidth(40, context),
                ),
                child: Text(
                  'Статистика сезона',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: Helpers.responsiveHeight(15, context),
                left: Helpers.responsiveWidth(40, context),
                bottom: Helpers.responsiveHeight(15, context),
              ),
              width: Helpers.responsiveWidth(360, context),
              height: Helpers.responsiveHeight(50, context),
              child: ListView.separated(
                itemBuilder: (_, index) => _items[index],
                separatorBuilder: (_, __) => SizedBox(
                  width: Helpers.responsiveWidth(20, context),
                ),
                itemCount: _items.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
