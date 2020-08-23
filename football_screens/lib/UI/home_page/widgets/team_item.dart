import 'package:flutter/material.dart';
import 'package:football_screens/UI/player_details_page/player_details_page.dart';
import 'package:football_screens/helpers/helpers.dart';

class TeamItem extends StatelessWidget {
  final String text;
  final String description;
  final String name;
  final String fuck;
  final String ext;
  TeamItem({
    @required this.text,
    this.name = "",
    this.ext = 'jpg',
    this.description,
    this.fuck = "",
  });

  @override
  Widget build(BuildContext context) {
    //TODO картинку передавать здесь
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PlayerDetailsPage(
                name: name,
                fuck: fuck,
                secondName: text,
                description: description,
                ext: ext,
              ),
            ),
          ),
          child: Container(
            height: Helpers.responsiveHeight(60, context),
            width: Helpers.responsiveHeight(60, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/players/${fuck}${text}.${ext}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: Helpers.responsiveHeight(5, context),
        ),
        Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(
            maxWidth: Helpers.responsiveWidth(65, context),
          ),
          child: Container(
            height: Helpers.responsiveHeight(20, context),
            alignment: Alignment.center,
            child: FittedBox(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
