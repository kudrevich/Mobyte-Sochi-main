import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:football_screens/UI/defaultScreens/cartButton.dart';
import 'package:football_screens/bloc/item_page_bloc/item_page_bloc.dart';
import 'package:football_screens/helpers/helpers.dart';

import 'widgets/pop_back_button.dart';

import 'widgets/description.dart';
import 'widgets/dish_card.dart';
import 'widgets/dish_name.dart';
import 'widgets/dish_subtitle.dart';
import 'widgets/navbar.dart';

class ItemPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Helpers _helpers = new Helpers(height, width);

    // ignore: close_sinks
    var itemBloc = BlocProvider.of<ItemPageBloc>(context);

    Widget _mapStateToScreen(BuildContext context, ItemPageState state) {
      if (state is ItemPageInitial) {
        return Column(
          children: <Widget>[
            Expanded(
              flex: 88,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      right: _helpers.adaptiveWidth(24),
                      left: _helpers.adaptiveWidth(24),
                      top: _helpers.adaptiveHeight(45),
                      bottom: _helpers.adaptiveHeight(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        PopBackButton(),
                        cartButton(context, height, width,
                            isItem: true, itemBloc: itemBloc)
                      ],
                    ),
                  ),
                  Container(
                    height: _helpers.adaptiveHeight(536),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              right: _helpers.adaptiveWidth(24),
                              left: _helpers.adaptiveWidth(24),
                              bottom: _helpers.adaptiveHeight(20),
                            ),
                            child: Column(
                              children: <Widget>[
                                DishName(title: itemBloc.item.name),
                                SizedBox(
                                  height: _helpers.adaptiveHeight(8),
                                ),
                                DishSubtitle(subtitle: itemBloc.item.subName),
                              ],
                            ),
                          ),
                          DishCard(
                            price: itemBloc.item.price,
                            image: itemBloc.item.image,
                          ),
                          SizedBox(
                            height: _helpers.adaptiveHeight(24),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Description(itemBloc.item.caption1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 12,
              child: Navbar(),
            ),
          ],
        );
      }
      return Scaffold();
    }

    void _listener(BuildContext context, ItemPageState state) {}

    return Scaffold(
      key: _scaffoldKey,
      body: Builder(
        builder: (context) => BlocListener<ItemPageBloc, ItemPageState>(
          listener: _listener,
          child: BlocBuilder<ItemPageBloc, ItemPageState>(
            builder: _mapStateToScreen,
          ),
        ),
      ),
    );
  }
}
