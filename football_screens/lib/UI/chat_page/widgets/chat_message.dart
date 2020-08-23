import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage(
      {this.flag,
      this.text =
          'Der Standardteil von Lorem Ipsum, genutzt seit 1500, ist reproduziert für die, die es interessiert.'});
  final bool flag;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: Helpers.responsiveHeight(10, context),
        bottom: Helpers.responsiveHeight(10, context),
      ),
      child: Row(
        mainAxisAlignment:
            flag ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Stack(
            overflow: Overflow.visible,
            alignment: flag ? Alignment.centerLeft : Alignment.centerRight,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: Helpers.responsiveHeight(15, context),
                  bottom: Helpers.responsiveHeight(15, context),
                  left: Helpers.responsiveWidth(20, context),
                  right: Helpers.responsiveWidth(20, context),
                ),
                decoration: BoxDecoration(
                  color: flag ? Colors.blue : Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      flag ? Helpers.responsiveHeight(20, context) : 0,
                    ),
                    bottomLeft: Radius.circular(
                      flag ? Helpers.responsiveHeight(20, context) : 0,
                    ),
                    bottomRight: Radius.circular(
                      !flag ? Helpers.responsiveHeight(20, context) : 0,
                    ),
                    topRight: Radius.circular(
                      !flag ? Helpers.responsiveHeight(20, context) : 0,
                    ),
                  ),
                ),
                constraints: BoxConstraints(
                    maxWidth: Helpers.responsiveWidth(300, context)),
                child: Text(
                  text,
                ),
              ),
              flag
                  ? Positioned(
                      left: -Helpers.responsiveWidth(15, context),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : Positioned(
                      right: -Helpers.responsiveWidth(15, context),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}