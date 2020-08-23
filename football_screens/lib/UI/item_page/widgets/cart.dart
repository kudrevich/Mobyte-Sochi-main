import 'package:flutter/material.dart';
import 'package:football_screens/helpers/helpers.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Helpers _helpers = new Helpers(height, width);

    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //    .push(MaterialPageRoute(builder: (_) => CartPage())); TODO: переход в карзину
      },
      child: Container(
        height: _helpers.adaptiveHeight(40),
        width: _helpers.adaptiveWidth(54),
        decoration: BoxDecoration(
          color: Color(0xff98D2F5),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icons/qwe.png',
                width: _helpers.adaptiveHeight(16),
                height: _helpers.adaptiveHeight(16),
              ),
              SizedBox(
                width: _helpers.adaptiveWidth(5),
              ),
              Text(
                "10",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: _helpers.adaptiveHeight(15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
