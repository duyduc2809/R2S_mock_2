import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/cubit/app_cubit_states.dart';
import 'package:mobile_store/cubit/app_cubits.dart';
import 'package:mobile_store/services/hive_helpers.dart';
import 'package:mobile_store/widgets/custom_app_bar.dart';

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
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is UserLoadedState) {
          return Scaffold(
            appBar: CustomAppBar(
              logged: true,
              title: '',
              showUserInfo: true,
              context: context,
              user: state.user,
            ),
            body: Column(
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
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
          child: Image.asset(
        "assets/img/" + urlImage,
        fit: BoxFit.cover,
      ));
}
