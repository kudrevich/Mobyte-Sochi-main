import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:football_screens/helpers/helpers.dart';
import 'package:football_screens/helpers/requests.dart';
import 'package:football_screens/main.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(LoadingUserData());

  Stream<UserState> _getProfile()async*{
    final response= await Requests.getProfile();
    if(response.statusCode!=200){//ошибка
      if(response.statusCode==500){ //переполучить token
      }else{
       //ошибка загрузки
        Helpers.showWarningDialog('Внимание', 'Ошибка получения данных');
        }

    }else //все верно
    {
      MyApp.user.getInfoFromMap(Helpers.getResponseBody(response.body));
      yield UserDataHasLoaded();
    }
  
  }

   Stream<UserState> _sentDataToServer()async*{
     yield LoadingUserData();
    final response= await Requests.sentProfile();
    if(response.statusCode!=200){//ошибка
      if(response.statusCode==500){ //переполучить token
      }else{
       //ошибка загрузки
        Helpers.showWarningDialog('Внимание', 'Ошибка отправки данных');
        }

    }else //все верно
    {
      yield UserDataHasLoaded();
    }
  
  }

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if(event is GetProfile){
      yield* _getProfile(); 
    } else if(event is SentDataToServer){
       yield* _sentDataToServer(); 
    }
  }
}
