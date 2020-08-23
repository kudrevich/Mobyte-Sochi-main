import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/UI/alerts/cart_alerts.dart';
import 'package:football_screens/UI/defaultScreens/loadingScreen.dart';
import 'package:football_screens/UI/item_page/widgets/pop_back_button.dart';
import 'package:football_screens/bloc/cart_bloc/cart_bloc.dart';
import 'package:football_screens/helpers/helpers.dart';

import '../../main.dart';

import 'widgets.dart/list_of_dishes.dart';
import 'widgets.dart/navbar.dart';
import 'widgets.dart/title_block.dart';

class CartPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Helpers _helpers = new Helpers(height, width);

    var cartBloc = BlocProvider.of<CartBloc>(context);

    Widget _mapStateToScreen(BuildContext context, CartState state) {
      if (state is LoadingState) {
        return loadingScreen(caption: state.title, context: context);
      }

      if (state is CartEditingState || state is GeolocationDisableState)
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 89,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: _helpers.adaptiveWidth(24),
                        top: _helpers.adaptiveHeight(45),
                        bottom: _helpers.adaptiveHeight(24),
                      ),
                      child: PopBackButton(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: _helpers.adaptiveWidth(24),
                        bottom: _helpers.adaptiveHeight(16),
                      ),
                      child: TitleBlock(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: _helpers.adaptiveWidth(24),
                      ),
                      child: ListOfDishes(),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 11,
                child: Navbar(_scaffoldKey),
              ),
            ],
          ),
        );
      else
        return Scaffold();
    }

    void _listener(BuildContext context, CartState state) async {
      if (state is CartEditingState) {
        if (state.dataGet) {
          showMyDialog(context, cartBloc.order, cartBloc);
        }
        if (state.exit) Navigator.pop(context);
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      body: BlocConsumer<CartBloc, CartState>(
        listener: _listener,
        builder: _mapStateToScreen,
      ),
    );
  }
}
