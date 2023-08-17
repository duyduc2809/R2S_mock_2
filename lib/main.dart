import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/cubit/auth_cubit/app_cubit_logic.dart';
import 'package:mobile_store/pages/login_page.dart';
import 'package:mobile_store/pages/home_page.dart';

import 'cubit/app_cubits.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, home: BlocProvider<AppCubits>(
      create: (context) => AppCubits(),
      child: AppCubitLogics())));
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
