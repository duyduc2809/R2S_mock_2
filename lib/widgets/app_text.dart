import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color color;

  AppText({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400, 
        color: color,
        
        ),
    );
  }
}
