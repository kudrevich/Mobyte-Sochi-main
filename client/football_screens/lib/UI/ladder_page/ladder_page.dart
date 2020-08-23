import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/UI/ladder_page/widgets/header.dart';
import 'package:football_screens/UI/widgets/app_bar.dart';
import 'package:football_screens/bloc/ladder_bloc/ladder_bloc.dart';
import 'package:football_screens/main.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../helpers/helpers.dart';
import '../../helpers/helpers.dart';
import 'widgets/ladder_fan.dart';
import 'widgets/ladder_fan.dart';

class LadderPage extends StatefulWidget {
  @override
  _LadderPageState createState() => _LadderPageState();
}

class _LadderPageState extends State<LadderPage> {
  List<LadderFan> _fans = [];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LadderBloc, LadderState>(
      listener: (context, state) {
        if (state is InitialLadderState) {
          if (MyApp.ladderBloc.dop != null)
            for (int i = 0; i < MyApp.ladderBloc.dop.length; i++)
              _fans.add(
                LadderFan(
                  name: MyApp.ladderBloc.dop[i].name,
                  place: i + 1,
                  url: "http://178.154.255.209:3002" +
                      MyApp.ladderBloc.dop[i].avatarUrl,
                  score: MyApp.ladderBloc.dop[i].rank.round(),
                  secondName: MyApp.ladderBloc.dop[i].surname,
                ),
              );
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: getAppBar(context, "Рейтинг болельщиков"),
        body: Column(
          children: [
            SizedBox(
              height: Helpers.responsiveHeight(2, context),
            ),
            Header(),
            SizedBox(
              height: Helpers.responsiveHeight(2, context),
            ),
            Expanded(
              child: SmartRefresher(
                controller: _refreshController,
                physics: BouncingScrollPhysics(),
                footer: CustomFooter(
                  builder: (context, mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Text("");
                    } else if (mode == LoadStatus.loading) {
                      body = CircularProgressIndicator(
                        backgroundColor: Theme.of(context).accentColor,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor),
                      );
                    } else if (mode == LoadStatus.failed) {
                      body = Text("Load Failed!Click retry!");
                    } else if (mode == LoadStatus.canLoading) {
                      body = Text("");
                    } else {
                      body = Text("No more Data");
                    }
                    return Container(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                onRefresh: () {
                  _refreshController.refreshCompleted();
                },
                onLoading: () {
                  print("Ladder user loading");

                  /// Подзагрузка чатов
                  if (MyApp.ladderBloc.dop != null) {
                    MyApp.ladderBloc.add(LadderUpdate());
                  }
                  _refreshController.loadComplete();
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: _fans,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
