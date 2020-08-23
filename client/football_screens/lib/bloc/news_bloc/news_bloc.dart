import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:football_screens/UI/home_page/widgets/post.dart';
import 'package:football_screens/models/postdata.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsClub());

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is TapClubEvent) yield NewsClub();
    if (event is TapCommunityEvent) yield NewsCommunity();
  }
}
