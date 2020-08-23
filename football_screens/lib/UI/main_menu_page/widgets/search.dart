import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/bloc/market_bloc/market_bloc.dart' as market;

import '../../../helpers/helpers.dart';

class Search extends StatelessWidget {
  final TextEditingController controller;

  const Search(this.controller, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Helpers _helpers = new Helpers(height, width);

    var marketBloc = BlocProvider.of<market.MarketBloc>(context);

    void _search() {
      marketBloc.add(market.Search(search: controller.value.text));
    }

    void _reset() {
      var state = marketBloc.state;
      controller.clear();
      if (state is market.MarketInitial) if (state.category.name == "custom")
        marketBloc.add(market.Update());
    }

    return Container(
      height: _helpers.adaptiveHeight(48),
      width: _helpers.adaptiveWidth(312),
      padding: EdgeInsets.only(left: _helpers.adaptiveWidth(18)),
      decoration: BoxDecoration(
        color: Color(0xFFF2F3F4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              _search();
            },
            child: Icon(
              Icons.search,
              size: _helpers.adaptiveHeight(20),
            ),
          ),
          SizedBox(
            width: _helpers.adaptiveWidth(15),
          ),
          Container(
            width: _helpers.adaptiveWidth(220),
            height: _helpers.adaptiveHeight(40),
            child: TextField(
              onChanged: (text) {
                _search();
              },
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hintText: "Поиск",
                hintStyle: TextStyle(
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                  fontSize: _helpers.adaptiveHeight(15),
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
              ),
              controller: controller,
              onEditingComplete: () {
                FocusScope.of(context).unfocus();
                _search();
              },
            ),
          ),
          GestureDetector(
            onTap: _reset,
            child: Icon(
              Icons.close,
              size: _helpers.adaptiveHeight(20),
            ),
          ),
        ],
      ),
    );
  }
}
