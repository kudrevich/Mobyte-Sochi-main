import 'dart:io';

import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/UI/profile_page/widgets/avatar.dart';
import 'package:football_screens/UI/profile_page/widgets/structured_info.dart';
import 'package:football_screens/UI/widgets/app_bar.dart';
import 'package:football_screens/UI/profile_page/widgets/achievements.dart';
import 'package:football_screens/UI/profile_page/widgets/pictures.dart';
import 'package:football_screens/UI/profile_page/widgets/profile_general.dart';
import 'package:football_screens/UI/widgets/loading_screen.dart';
import 'package:football_screens/bloc/user_bloc/user_bloc.dart';
import 'package:football_screens/helpers/helpers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProfilePage extends StatelessWidget {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return CustomNavigator(
      pageRoute: PageRoutes.materialPageRoute,
      home: Scaffold(
          appBar: getAppBar(context, "Profile"),
          body: SmartRefresher(
            controller: RefreshController(),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserDataHasLoaded)
                  return Column(
                    children: [
                      Expanded(
                        // child: SmartRefresher(
                        //   header: Platform.isAndroid
                        //       ? MaterialClassicHeader()
                        //       : ClassicHeader(
                        //           refreshingIcon: CupertinoActivityIndicator(),
                        //           refreshingText: '',
                        //           releaseIcon: CupertinoActivityIndicator(),
                        //           releaseText: '',
                        //           completeIcon: CupertinoActivityIndicator(),
                        //           completeText: '',
                        //           idleIcon: null,
                        //           idleText: '',
                        //         ),
                        //   controller: _refreshController,
                        //   onRefresh: () {
                        //     //_mainBloc.add(main_bloc.Update());
                        //     _refreshController.refreshCompleted();
                        //   },
                        child: Container(
                          child: CustomScrollView(
                            physics: BouncingScrollPhysics(),
                            slivers: [
                              SliverAppBar(
                                backgroundColor: Colors.white,
                                floating: true,
                                expandedHeight:
                                    Helpers.responsiveHeight(200, context),
                                flexibleSpace: FlexibleSpaceBar(
                                  background: Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: const AssetImage(
                                                  'assets/back.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                            // border: Border.all(
                                            //   width: 1.0,
                                            //   color: const Color(0xff707070),
                                            // ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: Helpers.responsiveHeight(
                                              100, context),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            topRight: Radius.circular(30.0),
                                          ),
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                      Center(child: Avatar())
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: SliverList(
                                  delegate: SliverChildListDelegate.fixed(
                                    [
                                      SizedBox(
                                          height: Helpers.responsiveWidth(
                                              30, context)),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(30.0),
                                        )),
                                        width: Helpers.responsiveWidth(
                                            300, context),
                                      ),
                                      Center(child: Achievements()),
                                      SizedBox(
                                          height: Helpers.responsiveWidth(
                                              30, context)),
                                      StructuredInfo(
                                          MediaQuery.of(context).size.height,
                                          MediaQuery.of(context).size.width),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //  ),
                    ],
                  );

                // Stack(
                //           alignment: Alignment.center,
                //           children: [
                //             Container(
                //               decoration: BoxDecoration(
                //                 image: DecorationImage(
                //                   image: const AssetImage('assets/back.jpg'),
                //                   fit: BoxFit.cover,
                //                 ),
                //                 border: Border.all(
                //                   width: 1.0,
                //                   color: const Color(0xff707070),
                //                 ),
                //               ),
                //             ),
                //             Container(
                //               margin: EdgeInsets.only(
                //                 top: Helpers.responsiveHeight(100, context),
                //               ),
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.only(
                //                   topLeft: Radius.circular(30.0),
                //                   topRight: Radius.circular(30.0),
                //                 ),
                //                 color: const Color(0xffffffff),
                //               ),
                //             ),
                //             Positioned(
                //               left: Helpers.responsiveWidth(91, context),
                //               top: Helpers.responsiveHeight(30, context),
                //               child: ProfileGeneral(),
                //             ),
                //             Positioned(
                //               top: Helpers.responsiveHeight(235, context),
                //               child: Container(
                //                 width: Helpers.responsiveWidth(300, context),
                //                 height: Helpers.responsiveHeight(50, context),
                //                 child: Text(
                //                   'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed',
                //                   style: TextStyle(
                //                     fontFamily: 'Arial',
                //                     fontSize: 10,
                //                     color: const Color(0xff000000),
                //                   ),
                //                   textAlign: TextAlign.center,
                //                 ),
                //               ),
                //             ),
                //             Positioned(
                //               top: Helpers.responsiveHeight(295, context),
                //               child: Achievements(),
                //             ),
                //             Positioned(
                //               top: 300,
                //               child: StructuredInfo(
                //                   MediaQuery.of(context).size.height,
                //                   MediaQuery.of(context).size.width),
                //             ),
                //           ],
                //         );
                else
                  return loadingScreen(caption: 'Загрузка', context: context);
              },
            ),
          )),
    );
  }
}
