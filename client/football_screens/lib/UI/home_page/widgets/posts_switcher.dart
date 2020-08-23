import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/bloc/news_bloc/news_bloc.dart';
import 'package:football_screens/helpers/helpers.dart';

class PostsSwitcher extends StatefulWidget {
  @override
  _PostsSwitcherState createState() => _PostsSwitcherState();
}

class _PostsSwitcherState extends State<PostsSwitcher> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var newsBloc = BlocProvider.of<NewsBloc>(context);
    return Container(
      padding: EdgeInsets.only(left: Helpers.responsiveWidth(20, context)),
      child: FittedBox(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  newsBloc.add(TapClubEvent());
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: BlocBuilder<NewsBloc, NewsState>(
                      builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            "Новости клуба",
                            style: TextStyle(
                                color: state is NewsClub
                                    ? Colors.black
                                    : Colors.grey,
                                fontWeight: state is NewsClub
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ),
                        Opacity(
                          opacity: state is NewsClub ? 1 : 0,
                          child: Container(
                            width: Helpers.responsiveWidth(40, context),
                            child: Divider(
                              color: Colors.blue,
                              thickness: 2,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(
                width: Helpers.responsiveWidth(20, context),
              ),
              GestureDetector(
                onTap: () {
                  newsBloc.add(TapCommunityEvent());
                },
                child: BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(
                              "Новости сообщества",
                              style: TextStyle(
                                  color: state is NewsCommunity
                                      ? Colors.black
                                      : Colors.grey,
                                  fontWeight: state is NewsCommunity
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            ),
                          ),
                          Opacity(
                            opacity: state is NewsCommunity ? 1 : 0,
                            child: Container(
                              width: Helpers.responsiveWidth(40, context),
                              child: Divider(
                                color: Colors.blue,
                                thickness: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
