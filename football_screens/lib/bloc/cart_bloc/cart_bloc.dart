import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:football_screens/main.dart';
import 'package:football_screens/models/blocKey.dart';
import 'package:football_screens/models/order.dart';

part 'cart_event.dart';
part 'cart_states.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(LoadingState(title: "Загружаем вашу корзину"));

  //Непосредственно сам заказ
  Order _order;
  Order get order => this._order;

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is ExitCart) yield CartEditingState(BlocKey(), exit: true);
    if (event is Start) {
      //Формирование заказа пользователя за счёт пересечения двух множеств
      var serverDished = (MyApp.marketBloc.categories[0].items).toSet();
      var userDishes = serverDished
          .map((x) => x.id) //В Корзине у пользователя хранятся только ключи
          .toSet()
          .intersection(MyApp.user.basket.keys.toSet());

      MyApp.user.basket.removeWhere((key, value) =>
          !userDishes.contains(key)); //Удаление несуществующих айдишников
      _order = Order(
          user: MyApp.user, dishList: MyApp.marketBloc.categories[0].items);
      yield CartEditingState(BlocKey());
    }

    if (state is UpdateEvent) {
      _order = Order(
          user: MyApp.user, dishList: MyApp.marketBloc.categories[0].items);
      yield CartEditingState(BlocKey());
    }

    if (event is AddEvent) {
      MyApp.user.addToBasket(itemID: event.itemID);
      _order = Order(
          user: MyApp.user, dishList: MyApp.marketBloc.categories[0].items);
      yield CartEditingState(BlocKey());
    }

    if (event is DecrementEvent) {
      MyApp.user.decDishFromBasket(itemID: event.itemID);
      _order = Order(
          user: MyApp.user, dishList: MyApp.marketBloc.categories[0].items);
      yield CartEditingState(BlocKey());
    }

    if (event is RemoveEvent) {
      MyApp.user.remFromBasket(itemID: event.itemID);
      _order = Order(
          user: MyApp.user, dishList: MyApp.marketBloc.categories[0].items);
      yield CartEditingState(BlocKey());
    }

    if (event is CorrectData) {
      yield LoadingState(title: "Получаем ваши геоданные");
      _order = Order(
        user: MyApp.user,
        dishList: MyApp.marketBloc.categories[0].items,
      );
      yield CartEditingState(BlocKey(), dataGet: true);
    }

    if (event is CheckoutEvent) {
      yield LoadingState(title: "Получаем ваши геоданные");

      _order = Order(
        user: MyApp.user,
        dishList: MyApp.marketBloc.categories[0].items,
      );
      yield CartEditingState(BlocKey(), dataGet: true);
    }

    //Переход к чату с готовым заказом и последующая автоматическая отправка заказа.
  }
}
