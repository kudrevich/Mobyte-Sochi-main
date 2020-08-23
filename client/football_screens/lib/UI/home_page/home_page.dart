import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/UI/widgets/app_bar.dart';
import 'package:football_screens/UI/home_page/widgets/post.dart';

import 'package:football_screens/UI/home_page/widgets/posts_switcher.dart';
import 'package:football_screens/UI/home_page/widgets/team_and_players.dart';
import 'package:football_screens/bloc/news_bloc/news_bloc.dart';
import 'package:football_screens/helpers/helpers.dart';
import 'package:football_screens/models/news_model.dart';
import 'package:football_screens/models/postdata.dart';

class HomePage extends StatelessWidget {
  // PostData _postData = PostData(
  //   caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  //   date: "5 April, 16:40",
  //   likesCount: 57,
  //   imgUrl: "assets/item.jpg",
  // );
  List<Post> posts; //TODO придумать получше
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(),
      child: Scaffold(
        appBar: getAppBar(context, 'Главная'),
        body: Column(
          children: [
            //список игроков и эмблемы клуба
            TeamAndPlayers(),
            SizedBox(
              height: Helpers.responsiveHeight(25, context),
            ),
            //смена отображаемых постов
            PostsSwitcher(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    return ListView.separated(
                      itemBuilder: (_, index) => state.posts[index],
                      itemCount: state.posts.length,
                      separatorBuilder: (_, __) => Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                        endIndent: Helpers.responsiveWidth(15, context),
                        indent: Helpers.responsiveWidth(15, context),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
