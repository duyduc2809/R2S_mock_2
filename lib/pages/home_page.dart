import 'package:flutter/material.dart';
import '../widget/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  {
  List<String> images = [
    "imgSlider1.png",
    "imgSlider2.webp",
    "imgSlider3.webp",
    "imgSlider4.webp",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: PageView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Image.asset(images[index]),
                );
              }),
          )
        ],
      ),
    );
  }
}