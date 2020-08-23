import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:football_screens/models/navbar_item_data.dart';
import 'package:football_screens/helpers/helpers.dart';

class NavbarButton extends StatefulWidget {
  final NavbarItemData data;
  final bool isSelected;
  final VoidCallback onTap;
  final bool flag;
  NavbarButton({
    this.data,
    this.isSelected,
    this.onTap,
    this.flag = false,
  });

  @override
  _NavbarButtonState createState() => _NavbarButtonState();
}

class _NavbarButtonState extends State<NavbarButton>
    with SingleTickerProviderStateMixin {
  GifController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = GifController(vsync: this);
    super.initState();
  }

  String outline = "";
  @override
  Widget build(BuildContext context) {
    if (widget.isSelected) {
      outline = "";
    } else {
      outline = "_outline";
    }
    var content = Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: Helpers.responsiveHeight(24, context),
            width: Helpers.responsiveHeight(24, context),
            child: Center(
              child: Container(
                margin: EdgeInsets.only(
                  bottom: Helpers.responsiveHeight(3, context),
                ),
                child: Image.asset(
                    'assets/icons/${widget.data.icon}${outline}.png'),
              ),
            ),
          ),
        ],
      ),
    );
    return GestureDetector(
      onTap: widget.onTap,
      child: content,
    );
  }
}
