import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/cubit/app_cubit_states.dart';
import 'package:mobile_store/widgets/custom_input_decoration.dart';

import '../constants/size_config.dart';
import '../constants/text_style_const.dart';
import '../cubit/app_cubits.dart';
import '../models/user.dart';
import '../services/hive_helpers.dart';

enum AppBarMode { Basic, Auth, ShowInfo, TitleWhenLogged }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  bool? logged;
  bool? showUserInfo;
  final statusBarHeight = SizeConfig.statusbarHeight;
  User? user;
  BuildContext context;

  CustomAppBar(
      {super.key,
      required this.context,
      this.user,
      this.title = '',
      this.logged = true,
      this.showUserInfo = false});

  AppBarMode selectedMode = AppBarMode.Basic;

  late double height;

  Widget? _buildBody() {
    switch (selectedMode) {
      case AppBarMode.ShowInfo:
        return _buildShowInfoMode();
      case AppBarMode.Auth:
        return _buildAuthMode();
      case AppBarMode.TitleWhenLogged:
        break;
      default:
        break;
    }
    return null;
  }

  _buildShowInfoMode() {
    return Positioned.fill(
        top: SizeConfig.statusbarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                width: SizeConfig.screenWidth,
                child: Row(
                  children: [

                    IconButton(onPressed: () {
                      
                    }, icon: const Icon(Icons.menu)),

                    Container(
                      height: 37,
                      width: 290,
                      child: TextFormField(
                        decoration: CustomInputDecoration(
                            suffixIcon: const Icon(Icons.search)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFDAD8D8),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('${user?.fullName}'),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        HiveHelper.deleteSavedData();
                        BlocProvider.of<AppCubits>(context).loginPage();
                      },
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ],
        ));
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
      return height = SizeConfig.screenHeight * 0.12 + statusBarHeight;
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
