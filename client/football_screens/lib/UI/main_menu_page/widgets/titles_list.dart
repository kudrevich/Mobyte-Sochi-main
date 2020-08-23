import 'package:flutter/material.dart';
import 'package:football_screens/UI/main_menu_page/widgets/title_item.dart';
import 'package:football_screens/models/itemcategory.dart';

import '../../../helpers/helpers.dart';

class TitlesList extends StatelessWidget {
  final ValueChanged<int> itemTapped;
  final int currentIndex;
  final List<ItemCategory> items;

  TitlesList({this.itemTapped, this.currentIndex, this.items});

  ItemCategory get selectedItem =>
      currentIndex >= 0 && currentIndex < items.length
          ? items[currentIndex]
          : null;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Helpers _helpers = new Helpers(height, width);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: _helpers.adaptiveWidth(20)),
          height: _helpers.adaptiveHeight(60),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (_, __) => SizedBox(
              width: _helpers.adaptiveWidth(16),
            ),
            itemCount: items.length,
            itemBuilder: (_, ind) => TitleItem(
              data: items[ind],
              isSelected: items[ind] == selectedItem,
              onTap: () {
                var index = items.indexOf(items[ind]);
                itemTapped(index);
              },
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(
          height: _helpers.adaptiveHeight(8),
        ),
        Text(
          items[currentIndex].name,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color,
            fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
            fontSize: _helpers.adaptiveHeight(14),
          ),
        )
      ],
    );
  }
}
