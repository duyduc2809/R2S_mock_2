import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    String successMessage = 'your review have sent!';
    String thanksMessage = 'Thank for your sharing!';

    return AlertDialog(
      content: Container(
        height: 138,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 69,
              color: Colors.green,
              child: Center(
                child: Text(
                  successMessage,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              height: 69,
              color: Colors.white,
              child: Center(
                child: Text(
                  thanksMessage,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}