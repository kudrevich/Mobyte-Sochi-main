import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:football_screens/helpers/helpers.dart';

class Pictures extends StatelessWidget {
  final List<Widget> _pics = [
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/img1.jpg'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x9a000000),
            offset: Offset(0, 0),
            blurRadius: 6,
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/img2.jpg'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x9a000000),
            offset: Offset(0, 0),
            blurRadius: 6,
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/img3.jpg'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x9a000000),
            offset: Offset(0, 0),
            blurRadius: 6,
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/img4.jpg'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x9a000000),
            offset: Offset(0, 0),
            blurRadius: 6,
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/img5.jpg'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x9a000000),
            offset: Offset(0, 0),
            blurRadius: 6,
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/img6.jpg'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x9a000000),
            offset: Offset(0, 0),
            blurRadius: 6,
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/img6.jpg'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x9a000000),
            offset: Offset(0, 0),
            blurRadius: 6,
          ),
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Helpers.responsiveWidth(300, context),
      height: Helpers.responsiveHeight(((_pics.length + 1) / 3) * 50, context),
      child: StaggeredGridView.countBuilder(
        itemCount: _pics.length,
        crossAxisCount: 3,
        itemBuilder: (_, index) => _pics[index],
        staggeredTileBuilder: (_) => StaggeredTile.count(1, 1),
      ),
    );
  }
}
