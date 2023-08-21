import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store/constants/color_const.dart';

class ForgotPasswordWidget {
  static displayDialog({required BuildContext context, Widget? content, double? height }) async {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: height ?? 192,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.50,
                    color: Colors.black.withOpacity(0.20000000298023224),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 37,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.50,
                          color: Colors.black.withOpacity(0.20000000298023224),
                        ),
                      ),
                    ),
                    child: const Center(
                        child: Text(
                      'FORGOT PASSWORD',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    )),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 30),
                      width: double.maxFinite,
                      child: Center(child: content)),
                ],
              ),
            ),
          );
        });
  }

  static enterEmail(BuildContext context) {
    final emailController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Please enter your email'),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
              hintStyle: const TextStyle(color: ColorPallete.mainColor),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              constraints: const BoxConstraints(maxHeight: 30, minHeight: 20),
              hintText: 'email',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0))),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fixedSize: const Size(85, 20),
                  backgroundColor: ColorPallete.redColor),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                displayDialog(context: context, content: enterOTP(context));
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fixedSize: const Size(85, 20),
                  backgroundColor: ColorPallete.mainColor),
              child: const Text('Confirm'),
            ),
          ],
        )
      ],
    );
  }

  static enterPassword(BuildContext context) {
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Please enter your new password'),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
              hintStyle: const TextStyle(color: ColorPallete.mainColor),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              constraints: const BoxConstraints(maxHeight: 30, minHeight: 20),
              hintText: 'Password',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0))),
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: confirmPasswordController,
          decoration: InputDecoration(
              hintStyle: const TextStyle(color: ColorPallete.mainColor),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              constraints: const BoxConstraints(maxHeight: 30, minHeight: 20),
              hintText: 'Repeat Password',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0))),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fixedSize: const Size(85, 20),
                  backgroundColor: ColorPallete.redColor),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fixedSize: const Size(85, 20),
                  backgroundColor: ColorPallete.mainColor),
              child: const Text('Confirm'),
            ),
          ],
        )
      ],
    );
  }

  static enterOTP(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Verify code has been sent to your phone number.\nPlease confirm it \n',
          textAlign: TextAlign.center,
        ),
        TextFormField(
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              constraints: const BoxConstraints(maxHeight: 30, minHeight: 20),
              hintText: 'OTP',
              hintStyle: const TextStyle(color: ColorPallete.mainColor),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0))),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'OTP code expires later ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: '59',
                style: TextStyle(
                  color: Color(0xFF5FB950),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: ' seconds',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fixedSize: const Size(85, 20),
                  backgroundColor: ColorPallete.redColor),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                displayDialog(
                    context: context, content: enterPassword(context), height: 220);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fixedSize: const Size(85, 20),
                  backgroundColor: ColorPallete.mainColor),
              child: const Text('Confirm'),
            ),
          ],
        )
      ],
    );
  }
}
