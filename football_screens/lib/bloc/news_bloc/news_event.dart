part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class TapClubEvent extends NewsEvent {}

class TapCommunityEvent extends NewsEvent {}
