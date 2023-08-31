import 'package:flutter/material.dart';

class InputStarRating extends StatefulWidget {
  final Function(int) onStarSelected;

  const InputStarRating({super.key, required this.onStarSelected});

  @override
  _InputStarRatingState createState() => _InputStarRatingState();
}

class _InputStarRatingState extends State<InputStarRating> {
  int selectedStars = 0;

  void _selectStar(int stars) {
    setState(() {
      selectedStars = stars;
    });

    widget.onStarSelected(selectedStars);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
            (index) => GestureDetector(
          onTap: () => _selectStar(index + 1),
          child: Icon(
            Icons.star,
            size: 21,
            color: index < selectedStars ? Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }
}