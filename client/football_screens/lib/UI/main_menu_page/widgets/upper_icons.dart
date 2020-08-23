import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/UI/defaultScreens/cartButton.dart';
import 'package:football_screens/bloc/market_bloc/market_bloc.dart';

import '../../../helpers/helpers.dart';

class UpperIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Helpers _helpers = new Helpers(height, width);

    // ignore: close_sinks
    var mainScreenBloc = BlocProvider.of<MarketBloc>(context);
    // ignore: close_sinks

    return Container(
      margin: EdgeInsets.only(
        left: _helpers.adaptiveWidth(24),
        right: _helpers.adaptiveWidth(24),
        top: _helpers.adaptiveHeight(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          cartButton(context, height, width),
        ],
      ),
    );
  }
}
