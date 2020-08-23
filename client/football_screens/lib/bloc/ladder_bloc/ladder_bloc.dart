import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:football_screens/helpers/requests.dart';
import 'package:football_screens/models/blocKey.dart';
import 'package:football_screens/models/temp_user.dart';

part 'ladder_event.dart';
part 'ladder_state.dart';

class LadderBloc extends Bloc<LadderEvent, LadderState> {
  LadderBloc() : super(LadderLoading());

  List<tempUser> users = [];
  List<tempUser> dop = [];
  int page = 1;

  @override
  Stream<LadderState> mapEventToState(
    LadderEvent event,
  ) async* {
    if (event is LadderUpdate) {
      dop = await Requests.getRating(page);

      if (dop != null) for (var user in dop) users.add(user);

      page++;
      yield InitialLadderState(BlocKey());
    }
  }
}
