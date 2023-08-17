import 'package:flutter/material.dart';

import '../constants/size_config.dart';
import '../constants/text_style_const.dart';

enum AppBarMode { Basic, Auth, ShowInfo, TitleWhenLogged }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  bool? logged;
  bool? showUserInfo;
  final statusBarHeight = SizeConfig.statusbarHeight;
  BuildContext context;

  CustomAppBar(
      {super.key,
      required this.context,
      this.title = '',
      this.logged = true,
      this.showUserInfo = false});

  AppBarMode selectedMode = AppBarMode.Basic;

  late double height;

  Widget? _buildBody() {
    switch (selectedMode) {
      case AppBarMode.ShowInfo:
        break;
      case AppBarMode.Auth:
        return _buildAuthMode();
      case AppBarMode.TitleWhenLogged:
        break;
      default:
        break;
    }
  }

  _buildAuthMode() {
    return Positioned.fill(
        top: SizeConfig.statusbarHeight,
        child: Center(
          child: Text(
            title!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 48,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ));
  }

  double getHeight() {
    if (logged == false) {
      selectedMode = AppBarMode.Auth;
      return height = SizeConfig.screenHeight * 0.17 + statusBarHeight;
    } else if (title != '' && showUserInfo == false) {
      selectedMode = AppBarMode.TitleWhenLogged;
      return height = SizeConfig.screenHeight * 0.125 + statusBarHeight;
    } else if (showUserInfo == true && title == '') {
      selectedMode = AppBarMode.ShowInfo;
      return height = SizeConfig.screenHeight * 0.19 + statusBarHeight;
    } else {
      return height = SizeConfig.screenHeight * 0.06 + statusBarHeight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          // title: title != '' ? Text(title!) : null,
          flexibleSpace: Container(
            decoration: const ShapeDecoration(
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
              color: Color(0xffeeeeee),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ),
        ),
        _buildBody()!,
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Size(double.maxFinite, getHeight());
  }
}
