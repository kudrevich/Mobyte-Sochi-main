import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';

class Achievement extends StatelessWidget {
  final String name;
  final String discripton;
  final String url;
  Achievement(
      {@required this.name, @required this.discripton, @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Helpers.showWarningDialog('', ''),
      child: Container(
        width: Helpers.responsiveWidth(120, context),
        height: Helpers.responsiveHeight(120, context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: const Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child:ClipRRect( borderRadius: BorderRadius.circular(10.0),child:Image.network(url))
      ),
    );
  }
}
