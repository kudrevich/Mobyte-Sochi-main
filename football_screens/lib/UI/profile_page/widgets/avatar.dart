import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_screens/bloc/user_bloc/user_bloc.dart';
import 'package:football_screens/helpers/helpers.dart';
import 'package:football_screens/helpers/requests.dart';
import 'package:football_screens/main.dart';
import 'package:image_picker/image_picker.dart';

class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (ctx) => Platform.isAndroid
                ? SimpleDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    contentPadding: EdgeInsets.only(
                        left: Helpers.responsiveWidth(20, context),
                        right: Helpers.responsiveWidth(20, context),
                        top: Helpers.responsiveWidth(24, context),
                        bottom: Helpers.responsiveWidth(24, context)),
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () async {
                              //выбираем фотку
                              MyApp.user.avatar = (await ImagePicker.pickImage(
                                      source: ImageSource.gallery,
                                      imageQuality: 20))
                                  .readAsBytesSync();
                              Requests.sentAvatar();
                              setState(() {});
                              Navigator.of(ctx).pop();
                            },
                            child: Container(
                              width: Helpers.responsiveWidth(300, context),
                              child: Text(
                                "Загрузить фотографию",
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 16,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .fontFamily,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.027,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          //делаем фотку
                          MyApp.user.avatar = (await ImagePicker.pickImage(
                                  source: ImageSource.camera, imageQuality: 20))
                              .readAsBytesSync();
                          setState(() {});
                           Requests.sentAvatar();
                          Navigator.of(ctx).pop();
                        },
                        child: Container(
                          width: Helpers.responsiveWidth(300, context),
                          child: Text(
                            "Сделать фото",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16,
                              fontFamily:
                                  Theme.of(context).textTheme.body1.fontFamily,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                            height: height * 0.027,
                          ),
                      GestureDetector(
                        onTap: () {
                          //удаляем
                      //    MyApp.user.avatar = AssetImage('assets/images/no-avatar.png').;
                          setState(() {});
                         //  Requests.sentAvatar();
                          Navigator.of(ctx).pop();
                        },
                        
                        child: Container(
                          width: Helpers.responsiveWidth(300, context),
                          child: Text(
                            "Удалить фотографию",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16,
                              fontFamily:
                                  Theme.of(context).textTheme.body1.fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: CupertinoActionSheet(
                        actions: [
                          CupertinoActionSheetAction(
                            child: const Text('Загрузить фотографию'),
                            onPressed: () async {
                              //загр фото
                              MyApp.user.avatar = (await ImagePicker.pickImage(
                                      source: ImageSource.gallery,
                                      imageQuality: 20))
                                  .readAsBytesSync();
                              setState(() {});
                              Navigator.of(ctx).pop();
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: const Text('Сделать фото'),
                            onPressed: () async {
                              MyApp.user.avatar = (await ImagePicker.pickImage(
                                      source: ImageSource.camera,
                                      imageQuality: 20))
                                  .readAsBytesSync();
                              setState(() {});
                              //загр фото
                              Navigator.of(ctx).pop();
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: const Text('Удалить фото'),
                            onPressed: () {
                              MyApp.user.avatar = null;
                              setState(() {});
                              Navigator.of(ctx).pop();
                            },
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          child: const Text('Отменить'),
                          isDefaultAction: true,
                          onPressed: () {
                            setState(() {});
                            Navigator.of(ctx).pop();
                          },
                        ))));
      },
      child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        final avatar = MyApp.user.avatar;
        final avatarUrl = MyApp.user.avatarUrl;
        return state is LoadingUserData
            ? Platform.isAndroid
                ? CircularProgressIndicator()
                : CupertinoActivityIndicator()
            : CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                radius: height*0.1,
                backgroundImage: ResizeImage(
                  avatar == null?
                     avatarUrl==null ? AssetImage('assets/images/no-avatar.png'):NetworkImage(Requests.URL+avatarUrl)
                      : MemoryImage(avatar),
                  width: (height*0.8).ceil(),
                ),
              );
      }),
    );
  }
}
