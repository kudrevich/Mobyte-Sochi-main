import 'package:flutter/material.dart';

import '../../../helpers/helpers.dart';
import '../../../helpers/helpers.dart';
import '../../../helpers/helpers.dart';

class StatItem extends StatelessWidget {
  StatItem({
    this.title = "Матчи",
    this.mark = 25,
  });
  String title;
  int mark;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Helpers.responsiveWidth(15, context)),
      width: Helpers.responsiveWidth(160, context),
      height: Helpers.responsiveWidth(50, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColor,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              constraints: BoxConstraints(
                  maxWidth: Helpers.responsiveWidth(100, context)),
              child: FittedBox(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Helpers.responsiveWidth(16, context),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Text(
              mark.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: Helpers.responsiveWidth(33, context),
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
