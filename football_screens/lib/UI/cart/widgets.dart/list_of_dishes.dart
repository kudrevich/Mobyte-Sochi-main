import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/bloc/cart_bloc/cart_bloc.dart';
import 'package:football_screens/helpers/helpers.dart';
import 'package:football_screens/models/user.dart';

import '../../../main.dart';
import 'dish_card.dart';

class ListOfDishes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // ignore: close_sinks
    CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    Helpers _helpers = new Helpers(height, width);

    List<DishCard> _getCart() {
      User user = MyApp.user;
      List<DishCard> dishes = [];

      for (var itemID in user.basket.keys) {
        if (itemID == " ") continue;
        var dish = MyApp.marketBloc.categories[0].items
            .where((x) => x.id == itemID)
            .toList()[0];
        dishes.add(DishCard(
          id: dish.id,
          name: dish.name,
          price: dish.price,
          count: user.basket[itemID],
          image: dish.image,
          caption: dish.subName,
          pressUp: () {
            cartBloc.add(AddEvent(itemID: itemID));
          },
          pressDown: () {
            cartBloc.add(DecrementEvent(itemID: itemID));
          },
          /*pressDel: () {
          bloc.add(RemoveEvent(dishID: dishID));},*/
        ));
      }

      return dishes;
    }

    return Container(
      height: _helpers.adaptiveHeight(464),
      child: _getCart().length == 0
          ? Padding(
              padding: EdgeInsets.only(
                left: _helpers.adaptiveWidth(24),
              ),
              child: Center(
                child: Text(
                  "Ваша корзина пуста",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color,
                    fontFamily:
                        Theme.of(context).textTheme.bodyText1.fontFamily,
                    fontSize: _helpers.adaptiveHeight(18),
                  ),
                ),
              ),
            )
          : MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemCount: _getCart().length,
                itemBuilder: (context, index) {
                  final String item = _getCart()[index].name;
                  return Dismissible(
                      direction: DismissDirection.endToStart,
                      key: Key(item),
                      onDismissed: (DismissDirection dir) {
                        cartBloc.add(RemoveEvent(itemID: _getCart()[index].id));
                      },
                      background: Container(
                        child: Container(
                          height: _helpers.adaptiveHeight(26),
                          width: _helpers.adaptiveHeight(26),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/trash2.png'),
                            ),
                          ),
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      child: _getCart()[index]);
                },
              ),
            ),
    );
  }
}
