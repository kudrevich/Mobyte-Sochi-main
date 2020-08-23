import 'package:flutter/material.dart';
import 'package:football_screens/UI/constants.dart';
import 'package:football_screens/models/itemcategory.dart';

import '../../../helpers/helpers.dart';

class TitleItem extends StatelessWidget {
  final ItemCategory data;
  final bool isSelected;
  final VoidCallback onTap;

  TitleItem({this.data, this.isSelected, this.onTap});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    Helpers _helpers = new Helpers(height, 0);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: _helpers.adaptiveHeight(60),
        width: _helpers.adaptiveHeight(60),
        decoration: BoxDecoration(
          color: isSelected ? blue : Color(0xFFF2F3F4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          data.icon,
          size: _helpers.adaptiveHeight(24),
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
