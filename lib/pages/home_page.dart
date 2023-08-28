import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/cubit/app_cubit_states.dart';
import 'package:mobile_store/cubit/app_cubits.dart';
import 'package:mobile_store/widgets/product_widgets/list_product.dart';
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
        if (state is HomePageState) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            appBar: CustomAppBar(
              logged: true,
              title: '',
              showUserInfo: true,
              context: context,
              user: AppCubits.userData,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Center(
                  child: Column(
                children: [
                  CarouselSlider.builder(
                      carouselController: controller,
                      itemCount: images.length,
                      itemBuilder: (context, index, realIndex) {
                        final urlImage = images[index];
                        return buildImage(urlImage, index);
                      },
                      options: CarouselOptions(
                          viewportFraction: 1,
                          initialPage: 1,
                          height: 150,
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: const Duration(seconds: 2),
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) =>
                              setState(() => activeIndex = index))),
                  Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/img/new.png',
                          width: 50,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 350,
                    child: ListProduct()
                // )  
                    
                  ),
                ],
              )),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
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
