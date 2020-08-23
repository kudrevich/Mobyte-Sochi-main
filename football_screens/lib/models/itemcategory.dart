
import 'package:flutter/cupertino.dart';

import 'constants.dart';
import 'item.dart';

class ItemCategory {
  IconData icon;
  final String name;
  final List<Item> items;

  ItemCategory(
      {@required this.name, @required this.items, @required int iconIndex}) {
    icon = Constants.ICONS[iconIndex];
  }
}
