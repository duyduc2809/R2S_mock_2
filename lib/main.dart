import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobile_store/constants/color_const.dart';
import 'package:mobile_store/cubit/auth_cubit/app_cubit_logic.dart';
import 'package:mobile_store/pages/login_page.dart';
import 'package:mobile_store/pages/home_page.dart';
import 'package:mobile_store/services/user_data_services.dart';

import 'cubit/app_cubits.dart';
import 'models/api_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(APIUserAdapter());
  await Hive.initFlutter();
  runApp(MaterialApp(
      theme: ThemeData(
          colorScheme: const ColorScheme.light().copyWith(
              primary: ColorPallete.mainColor,
              secondary: ColorPallete.yellowColor)),
      debugShowCheckedModeBanner: false,
      home: BlocProvider<AppCubits>(
          create: (context) => AppCubits(dataServices: UserDataServices()),
          child: const AppCubitLogics())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: const HomePage(),
    );
  }
}
