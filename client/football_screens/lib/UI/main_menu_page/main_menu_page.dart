import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/UI/alerts/snackBars.dart';
import 'package:football_screens/UI/chat/chat.dart';
import 'package:football_screens/UI/constants.dart';
import 'package:football_screens/UI/defaultScreens/cartButton.dart';
import 'package:football_screens/UI/main_menu_page/widgets/item_card.dart';
import 'package:football_screens/UI/main_menu_page/widgets/name_block.dart';
import 'package:football_screens/UI/main_menu_page/widgets/search.dart';
import 'package:football_screens/UI/main_menu_page/widgets/titles_list.dart';
import 'package:football_screens/UI/widgets/app_bar.dart';
import 'package:football_screens/bloc/market_bloc/market_bloc.dart' as market;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../helpers/helpers.dart';
import '../../main.dart';
import './widgets/upper_icons.dart';

// ignore: must_be_immutable
class MainMenuPage extends StatelessWidget {
  final TextEditingController searchController = new TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  bool first = true;

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    market.MarketBloc marketBloc = BlocProvider.of<market.MarketBloc>(context);

    void _tapHandler(int index) {
      marketBloc.selectedIndex = index;
      marketBloc
          .add(market.SelectCategory(category: marketBloc.categories[index]));
    }

    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Helpers _helpers = new Helpers(height, width);

    Widget _mapStateToScreen(BuildContext context, market.MarketState state) {
      if (state is market.MarketInitial) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Helpers.responsiveWidth(13, context),
                ),
                color: Colors.white,
                height: 57,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cartButton(context, height, width),
                    Text(
                      'Магазин продукции',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: Helpers.responsiveWidth(14, context),
                      ),
                    ),
                    SizedBox(
                      width: Helpers.responsiveWidth(54, context),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Helpers.responsiveWidth(24, context),
                ),
                height: Helpers.responsiveHeight(66, context),
                decoration: BoxDecoration(
                  color: Color(0xFFF2F3F4),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ваша позиция в рейтинге',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Helpers.responsiveHeight(14, context),
                          ),
                        ),
                        Text(
                          MyApp.user.place.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: Helpers.responsiveHeight(14, context),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Бонус за попадание в топ 10: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Helpers.responsiveHeight(14, context),
                          ),
                        ),
                        Text(
                          'Скидка 15%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: Helpers.responsiveHeight(14, context),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SmartRefresher(
                  /*header: Platform.isAndroid
                      ? MaterialClassicHeader()
                      : ClassicHeader(
                          refreshingIcon: CupertinoActivityIndicator(),
                          refreshingText: '',
                          releaseIcon: CupertinoActivityIndicator(),
                          releaseText: '',
                          completeIcon: CupertinoActivityIndicator(),
                          completeText: '',
                          idleIcon: null,
                          idleText: '',
                        ),*/
                  controller: _refreshController,
                  onRefresh: () async {
                    //Helpers.vibrate();
                    await SystemChannels.platform
                        .invokeMethod<void>('HapticFeedback.lightImpact');
                    marketBloc.add(market.Update());
                    _refreshController.refreshCompleted();
                  },
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                        backgroundColor: Colors.white,
                        floating: true,
                        expandedHeight: _helpers.adaptiveHeight(180),
                        flexibleSpace: FlexibleSpaceBar(
                          background: Column(
                            children: [
                              SizedBox(height: _helpers.adaptiveHeight(25)),
                              Search(searchController),
                              SizedBox(height: _helpers.adaptiveHeight(17)),
                              TitlesList(
                                currentIndex: marketBloc.selectedIndex,
                                itemTapped: _tapHandler,
                                items: marketBloc.categories,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate.fixed(
                          state.category.items.length > 0
                              ? state.category.items
                                  .map(
                                    (e) => Column(
                                      children: [
                                        ItemCard(
                                          item: e,
                                        ),
                                        SizedBox(
                                          height: _helpers.adaptiveHeight(16),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList()
                              : [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: _helpers.adaptiveHeight(50),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Ничего не найдено",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .color,
                                          fontFamily: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .fontFamily,
                                          fontSize: _helpers.adaptiveHeight(18),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      } /*else if (state is main_bloc.Loading) {
        return loadingScreen(caption: state.caption, context: context);
      } else if (state is main_bloc.EState) {
        return requestErrorScreen(
            caption: state.caption,
            context: context, //TODO: обработка стейтов
            onPressed: () {
              print("Before");
              MyApp.authBloc.add(AuthFirstCheck());
              print("After");
            });
      }*/
      else
        return Scaffold(
          body: Center(
            child: Text("Market"),
          ),
        );
    }

    void _listener(BuildContext context, market.MarketState state) async {
      if (state is market.MarketInitial) {
        if (state.dishAdding) {
          dishAddStatus(context, state.dishAddedSuccessfully, _scaffoldKey);
        }
      }
    }

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            key: _scaffoldKey,
            body: Builder(
              builder: (context) =>
                  BlocConsumer<market.MarketBloc, market.MarketState>(
                listener: _listener,
                builder: _mapStateToScreen,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget getMarketAppBar(BuildContext context, String title) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Chat(),
          ),
        );
      },
      icon: Icon(
        Icons.dehaze,
        color: Colors.black,
      ),
    ),
    actions: [
      // GestureDetector(
      //   onTap: () => Helpers.showWarningDialog('Внимание', 'Куку'),
      //   // () => Navigator.push(
      //   //   context,
      //   //   MaterialPageRoute(
      //   //     builder: (context) => TestsPage(),
      //   //   ),
      //   // ),
      //   child: Container(
      //     margin: EdgeInsets.only(
      //         right: Helpers.responsiveWidth(
      //       15,
      //       context,
      //     )),
      //     child: Icon(
      //       Icons.play_circle_outline,
      //       color: Colors.black,
      //       size: Helpers.responsiveHeight(34, context),
      //     ),
      //   ),
      // ),
//      Container(
//        width: 20,
//        height: 20,
//        color: Colors.red,
//      ),
      Padding(
        padding: EdgeInsets.only(right: Helpers.responsiveWidth(15, context)),
        child: GestureDetector(
          onTap: () => Helpers.showRequestExitFromProfileDialog(),
          //Helpers.showWarningDialog('Внимание', 'Куку'),
          child: CircleAvatar(
            radius: Helpers.responsiveHeight(17, context),
            backgroundColor: Colors.black,
          ),
        ),
      ),
    ],
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: Helpers.responsiveWidth(14, context),
      ),
    ),
  );
}
