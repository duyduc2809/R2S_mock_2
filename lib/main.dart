import 'package:flutter/material.dart';
import 'package:mobile_store/pages/home_page.dart';
import 'package:mobile_store/widget/detail_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailProduct());
  }
}
