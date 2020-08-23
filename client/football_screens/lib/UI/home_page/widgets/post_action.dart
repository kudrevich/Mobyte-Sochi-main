import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';

class PostAction extends StatelessWidget {
  final IconData icon;
  final int count;

  PostAction({
    this.icon,
    this.count,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Helpers.responsiveHeight(25, context),
      width: Helpers.responsiveWidth(55, context),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.indigo[900],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: Helpers.responsiveHeight(17, context),
          ),
          Text(
            count.toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
