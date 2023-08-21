import 'package:flutter/material.dart';
import 'package:mobile_store/pages/cart_page.dart';
import 'package:mobile_store/pages/information_page.dart';

import '../home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [HomePage(), CartPage(), InformationPage()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                label: "Home", icon: Image.asset("assets/img/back.png")),
            BottomNavigationBarItem(
                label: "Cart",
                icon: Image.asset("assets/img/shopping-cart.png")),
            BottomNavigationBarItem(
                label: "Information", icon: Image.asset("assets/img/user.png")),
          ]),
    );
  }
}
