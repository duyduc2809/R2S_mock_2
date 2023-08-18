import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_store/widget/list_product.dart';
import 'package:mobile_store/widgets/custom_app_bar.dart';

import '../constants/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    SizeConfig().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        logged: false,
        ),
      body: 
       
           Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CarouselSlider.builder(
                      carouselController: controller,
                      itemCount: images.length,
                      itemBuilder: (context, index, realIndex) {
                        final urlImage = images[index];
                        return buildImage(urlImage, index);
                      },
                      options: CarouselOptions(
                          viewportFraction: 1,
                          height: 150,
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(seconds: 2),
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) =>
                              setState(() => activeIndex = index))),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 32,
                        child: Image.asset('assets/img/new.png'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListProduct(),
                ],
              ),
            ),
          ))
        
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
          child: Image.asset(
        "assets/img/" + urlImage,
        fit: BoxFit.cover,
      ));
}
