import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(150);

  // final Color color;
  String? text;
  IconData? icon;
  // double size;
  AppBarCustom({
    Key? key,
    this.text = "",
    this.icon,
    // required this.color,
    // required this.size
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Mobile Store',
        style: TextStyle(fontSize: 45, color: Colors.black),
        
      ),
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      )),
    );
  }
}
