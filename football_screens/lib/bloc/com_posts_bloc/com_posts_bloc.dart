import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'com_posts_event.dart';
part 'com_posts_state.dart';

class ComPostsBloc extends Bloc<ComPostsEvent, ComPostsState> {
  ComPostsBloc() : super(ComPostsInitial());

  @override
  Stream<ComPostsState> mapEventToState(
    ComPostsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
