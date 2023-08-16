import 'package:flutter/material.dart';
import 'package:mobile_store/pages/auth_screen.dart';
import 'package:mobile_store/pages/home_page.dart';

void main() {
  runApp(
      MaterialApp(debugShowCheckedModeBanner: false, home: const HomePage())
      );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primaryColor: Colors.white),
//       home: const HomePage(),
//     );
//   }
// }
