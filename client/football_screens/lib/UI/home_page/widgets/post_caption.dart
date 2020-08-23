import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';
import 'package:football_screens/models/postdata.dart';

class PostCaption extends StatelessWidget {
  final PostData postData;

  PostCaption(this.postData);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Helpers.responsiveWidth(20, context),
        right: Helpers.responsiveWidth(20, context),
        bottom: Helpers.responsiveWidth(10, context),
      ),
      child: Text(
        postData.caption,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
