import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int rating;

  const StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
            (index) => Icon(
          Icons.star,
          size: 21,
          color: index < rating ? Colors.orange : Colors.white,
        ),
      ),
    );
  }
}