import 'package:flutter/material.dart';
import 'package:football_screens/UI/constants.dart';
import 'package:football_screens/helpers/helpers.dart';
import 'package:google_fonts/google_fonts.dart';

class DishCard extends StatelessWidget {
  final String id;
  final String name;
  final String price;
  final String caption;
  final int count; //Кол-во в заказе на данный момент
  final Function pressUp; // Плюсик
  final Function pressDown; //Минусик
  final NetworkImage image;
  //final Function pressDel;

  const DishCard(
      {Key key,
      this.id,
      this.name,
      this.price,
      this.caption,
      this.count,
      this.pressUp,
      this.pressDown,
      this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Helpers _helpers = new Helpers(height, width);

    return Container(
      margin: EdgeInsets.only(
        left: _helpers.adaptiveWidth(56),
        bottom: _helpers.adaptiveHeight(16),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            width: _helpers.adaptiveWidth(309),
            decoration: BoxDecoration(
              color: yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    width: _helpers.adaptiveWidth(241),
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F3F4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          width: _helpers.adaptiveWidth(64),
                        ),
                        Container(
                          width: _helpers.adaptiveWidth(173),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: _helpers.adaptiveHeight(16),
                              ),
                              Text(
                                name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: _helpers.adaptiveHeight(18),
                                ),
                              ),
                              SizedBox(
                                height: _helpers.adaptiveHeight(4),
                              ),
                              Text(
                                caption,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .color,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .fontFamily,
                                  fontSize: _helpers.adaptiveHeight(12),
                                ),
                              ),
                              SizedBox(
                                height: _helpers.adaptiveHeight(6),
                              ),
                              Text(
                                '$price ₽',
                                style: GoogleFonts.roboto(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color,
                                  fontSize: _helpers.adaptiveHeight(18),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: _helpers.adaptiveWidth(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: pressUp,
                          child: Icon(
                            Icons.add,
                            size: _helpers.adaptiveHeight(24),
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          count.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: _helpers.adaptiveHeight(18),
                          ),
                        ),
                        GestureDetector(
                          onTap: pressDown,
                          child: Icon(
                            Icons.remove,
                            size: _helpers.adaptiveHeight(24),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: _helpers.adaptiveWidth(-30.4),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: _helpers.adaptiveHeight(38),
              backgroundImage: image,
            ),
          ),
        ],
      ),
    );
  }
}

/*
Padding(
                  padding: EdgeInsets.only(
                    left: _helpers.adaptiveWidth(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: pressUp,
                        child: Icon(
                          Icons.add,
                          size: _helpers.adaptiveHeight(24),
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        count.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: _helpers.adaptiveHeight(18),
                        ),
                      ),
                      GestureDetector(
                        onTap: pressDown,
                        child: Icon(
                          Icons.remove,
                          size: _helpers.adaptiveHeight(24),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )*/
