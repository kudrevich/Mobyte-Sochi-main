import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/UI/constants.dart';
import 'package:football_screens/UI/item_page/item_page.dart';
import 'package:football_screens/bloc/item_page_bloc/item_page_bloc.dart';
import 'package:football_screens/models/item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:football_screens/bloc/market_bloc/market_bloc.dart' as market;

import '../../../helpers/helpers.dart';
import '../../../main.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  ItemCard({
    @required this.item,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Helpers _helpers = new Helpers(height, width);

    // var imageHolder = placeholder == null
    //     ? kTransparentImage
    //     : placeholder.buffer.asUint8List();
    return GestureDetector(
      onTap: () async {
        FocusScope.of(context).unfocus();
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider<ItemPageBloc>(
                  create: (context) => ItemPageBloc(
                    item: item,
                  ),
                ),
                BlocProvider.value(value: MyApp.marketBloc),
              ],
              child: ItemPage(),
            ),
          ),
        );
        MyApp.marketBloc.add(market.Update());
      },
      child: Container(
        margin: EdgeInsets.only(
            right: _helpers.adaptiveWidth(24),
            left: _helpers.adaptiveWidth(56)),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: _helpers.adaptiveHeight(18)),
              width: _helpers.adaptiveWidth(280),
              decoration: BoxDecoration(
                color: Color(0xFFF2F3F4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: _helpers.adaptiveWidth(64),
                  ),
                  Container(
                    width: _helpers.adaptiveWidth(216),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                            right: _helpers.adaptiveWidth(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: _helpers.adaptiveHeight(15),
                                ),
                              ),
                              SizedBox(
                                height: _helpers.adaptiveHeight(6),
                              ),
                              Text(
                                item.subName,
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
                            ],
                          ),
                        ),
                        SizedBox(
                          height: _helpers.adaptiveHeight(16),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${item.price} ₽",
                              style: GoogleFonts.roboto(
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                                fontSize: _helpers.adaptiveWidth(18),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                MyApp.marketBloc
                                    .add(market.AddToBasket(dishId: item.id));
                              },
                              child: Container(
                                height: _helpers.adaptiveHeight(40),
                                width: _helpers.adaptiveWidth(56),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: yellow,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: _helpers.adaptiveHeight(24),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              //top: 10,
              left: -_helpers.adaptiveWidth(25),
              // top: _helpers.adaptiveHeight(25),
              child: ClipOval(
                child: FadeInImage(
                  fadeInDuration: Duration(milliseconds: 500),
                  height: _helpers.adaptiveHeight(70),
                  width: _helpers.adaptiveHeight(70),
                  fit: BoxFit.cover,
                  placeholder: AssetImage("assets/images/Frame_73.png"),
                  image: item.image,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
