// mport 'package:ClaySurf/main.dart';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:football_screens/UI/home_page/widgets/post.dart';
import 'package:football_screens/helpers/helpers.dart';
import 'package:scaling_header/scaling_header.dart';

class NewsDetailScreen extends StatefulWidget {
  Post post;
  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
  NewsDetailScreen(Post post) {
    this.post = post;
  }
}

class _NewsDetailScreenState extends State<NewsDetailScreen>
    with TickerProviderStateMixin {
  final double infoHeight = 364.0;
  AnimationController animationController;
  Animation<double> animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final News news = ModalRoute.of(context).settings.arguments;
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        0.0;
    return Container(
      color: Colors.transparent,
      child: Scaffold(
        //backgroundColor: Colors.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              ScalingHeader(
                backgroundColor: Color(0xFF153A5A),
                overlapContentBackgroundColor: Colors.white,
                flexibleSpace: AspectRatio(
                  aspectRatio: 1.2,
                  child: CachedNetworkImage(
                      imageUrl: widget.post.postData.imgUrl,
                      imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover)))),
                ),
                overlapContentHeight: Helpers.responsiveHeight(100, context),
                overlapContent: Container(
                  height: Helpers.responsiveHeight(100, context),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.center,
                      child: Text(
                        widget.post.postData.caption,
                        textAlign: TextAlign.center,
                        maxLines: 99,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          letterSpacing: 0.27,
                          color: Colors.black87,
                          //fontFamily: 'Cocogoose Classic',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                      constraints: BoxConstraints(minHeight: infoHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: opacity2,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 8, bottom: 8),
                              child: Text(
                                widget.post.postData.text,
                                //textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  //fontFamily: 'Cocogoose Classic',
                                  letterSpacing: 0.27,
                                  color: Colors.black,
                                ),
                                maxLines: 10000,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: opacity3,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, bottom: 16, right: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF153A5A),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        /*boxShadow: <BoxShadow>[
                                                    BoxShadow(
                                                        color: DesignAppTheme.nearlyBlue
                                                            .withOpacity(0.5),
                                                        offset: const Offset(1.1, 1.1),
                                                        blurRadius: 10.0),
                                                  ],*/
                                      ),
                                      child: FlatButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text(
                                          'Назад',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            //fontFamily: 'Cocogoose Classic',
                                            fontSize: 22,
                                            letterSpacing: 0.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          /*SizedBox(
                                      height: MediaQuery.of(context).padding.bottom,
                                    )*/
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    /*Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: SizedBox(
                  width: AppBar().preferredSize.height,
                  height: AppBar().preferredSize.height,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius:
                          BorderRadius.circular(AppBar().preferredSize.height),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.brown,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              )*/
  }
}
