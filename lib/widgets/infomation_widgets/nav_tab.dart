import 'package:flutter/material.dart';

class NavBarUserInfor extends StatelessWidget {
  const NavBarUserInfor({super.key, required this.onNavBarClicked});

  final void Function(int index) onNavBarClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              onNavBarClicked(0);
            },
            child: Column(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset('assets/img/information_img.png'),
                ),
                const Text("Your information",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                      height: 31 / 14,
                    ))
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              onNavBarClicked(1);
            },
            child: Column(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset('assets/img/shopping_bag_img.png'),
                ),
                const Text("Order",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                      height: 31 / 14,
                    ))
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              onNavBarClicked(2);
            },
            child: Column(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset('assets/img/promotion_img.png'),
                ),
                const Text("Promotion",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                      height: 31 / 14,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
