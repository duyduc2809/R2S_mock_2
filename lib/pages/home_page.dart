import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  {
  int activeIndex = 0;
  final controller = CarouselController();
  List images = [
    "imgSlider1.png",
    "imgSlider2.png",
    "imgSlider3.png",
    "imgSlider4.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Store'),),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          CarouselSlider.builder(
                carouselController: controller,
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = images[index];
                  return buildImage(urlImage, index);
                },
                options: CarouselOptions(
                    height: 150,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(seconds: 2),
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index))),
        ],
      ),
    );
  }
  Widget buildImage(String urlImage, int index) =>
    Container(child: Image.asset("assets/img/" + urlImage, fit: BoxFit.cover,));
}