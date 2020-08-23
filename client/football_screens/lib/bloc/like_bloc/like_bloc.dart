import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'like_state.dart';
part 'like_event.dart';

class LikeBloc extends Bloc<LikeBlocEvent, LikeBlocState> {
  LikeBloc() : super(DislikeState());

  @override
  Stream<LikeBlocState> mapEventToState(
    LikeBlocEvent event,
  ) async* {
    if (event is TapEvent) yield LikeState();
  }
}
