import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/UI/fill_in_the_profile_page/widgets/birthday_picker.dart';
import 'package:football_screens/UI/fill_in_the_profile_page/widgets/choose_gender.dart';
import 'package:football_screens/UI/widgets/back_arrow.dart';
import 'package:football_screens/bloc/auth_bloc/autorisation_bloc.dart';
import 'package:football_screens/bloc/user_bloc/user_bloc.dart';

import '../../main.dart';
import './widgets/general_info_text_field.dart';
import './widgets/profile_agreement.dart';




class FillInTheProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double _adaptationHeight(double mySize) {
      return height * (mySize / 740);
    }

    double _adaptationWidth(double myWidth) {
      return width * (myWidth / 360);
    }

   

    return WillPopScope(
        onWillPop: ()async{
          MyApp.userBloc.add(SentDataToServer());
          return true;
        },
          child: Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: _adaptationHeight(40),
                    left: _adaptationWidth(20),
                    right: _adaptationWidth(20),
                    top: _adaptationHeight(66)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BackArrow(onBack: ()=>MyApp.userBloc.add(SentDataToServer()),),
                    SizedBox(
                      height: _adaptationHeight(15),
                    ),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        return Text(
                          'Редактирование',
                          style: Theme.of(context).textTheme.headline,
                        );
                      },
                    ),
                    SizedBox(
                      height: _adaptationHeight(11),
                    ),
                    Text(
                      "Введите свои персональные данные перед началом использования приложения.",
                      style: Theme.of(context).textTheme.body1,
                    ),
                    SizedBox(
                      height: _adaptationHeight(36),
                    ),
                    GeneralInfoTextField(height, width),
                    SizedBox(
                      height: _adaptationHeight(41),
                    ),
                    SizedBox(
                      height: _adaptationHeight(15),
                    ),
                    ChooseGender(),
                     SizedBox(
                      height: _adaptationHeight(15),
                    ),
                    BirthdayPicker(),
                    
                   // ProfileAgreement(height, width),
                  ],
                ),
              ),
            ),
             Positioned(//колёсико ожидания
                width: width,
                top: height * 0.4,
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is LoadingUserData)
                      return Platform.isAndroid ? Center(child: CircularProgressIndicator())
                    : Center(child: CupertinoActivityIndicator());
                    else
                      return Container();
                  },
                ))
          ],
        ),
      ),
    );
  }
}
