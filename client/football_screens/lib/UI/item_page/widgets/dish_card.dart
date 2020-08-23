import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';
import 'package:google_fonts/google_fonts.dart';

class DishCard extends StatelessWidget {
  final String price;
  final NetworkImage image;
  DishCard({this.price, this.image});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Helpers _helpers = new Helpers(height, width);

    return Container(
      width: _helpers.adaptiveWidth(312),
      height: _helpers.adaptiveHeight(341),
      decoration: BoxDecoration(
          //color: Color(0xffF8FBFE),
          color: Color(0xffF8FBFE),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Stack(
        children: <Widget>[
          Container(
            height: _helpers.adaptiveHeight(281),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: image,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(
              bottom: _helpers.adaptiveHeight(16),
              right: _helpers.adaptiveWidth(20),
              left: _helpers.adaptiveWidth(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Цена: ',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color,
                    fontSize: _helpers.adaptiveHeight(16),
                  ),
                ),
                Text(
                  '$price ₽',
                  style: GoogleFonts.roboto(
                    color: Theme.of(context).textTheme.bodyText1.color,
                    fontSize: _helpers.adaptiveHeight(21),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
