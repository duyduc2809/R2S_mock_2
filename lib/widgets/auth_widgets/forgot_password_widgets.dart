import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store/constants/color_const.dart';
import 'package:mobile_store/services/user_data_services.dart';

class ForgotPasswordWidget {
  static displayDialog(
      {required BuildContext context, Widget? content, double? height}) async {
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
                  const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
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
              onPressed: () async {
                var result = await UserDataServices.sendForgotEmail(
                    emailController.text);
                if (result == null) {
                  Navigator.pop(context);
                  displayDialog(
                      context: context,
                      content: enterOTP(context),
                      height: 192 + 125);
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(result)));
                }
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
    final _formKey = GlobalKey<FormState>();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final otpController = TextEditingController();

    int secondsLeft = 60;
    late Timer timer;
    bool isCounting = false;

    void startTimer(setState) {
      if (!isCounting) {
        isCounting = true; // Đánh dấu đã bắt đầu đếm ngược
        timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          if (secondsLeft > 0) {
            setState(() {
              secondsLeft--;
            });
          } else {
            timer.cancel();
          }
        });
      }
    }

    return Form(
      key: _formKey,
      child: StatefulBuilder(builder: (context, StateSetter setState) {
        startTimer(setState);
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Verify code has been sent to your email.\nPlease confirm it \n',
              textAlign: TextAlign.center,
            ),
            TextFormField(
              controller: otpController,
              validator: (value) {
                if (value == null || value == '') {
                  return "Vui lòng nhập OTP";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  constraints:
                      const BoxConstraints(maxHeight: 30, minHeight: 20),
                  hintText: 'OTP',
                  hintStyle: const TextStyle(color: ColorPallete.mainColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              obscureText: true,
              validator: (value) {
                if (value == null || value == '') {
                  return "Vui lòng nhập mật khẩu mới";
                } else {
                  return null;
                }
              },
              controller: passwordController,
              decoration: InputDecoration(
                  hintStyle: const TextStyle(color: ColorPallete.mainColor),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  constraints:
                      const BoxConstraints(maxHeight: 30, minHeight: 20),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              obscureText: true,
              validator: (value) {
                if (value == null || value == '') {
                  return "Vui lòng nhập lại mật khẩu";
                } else if (value != passwordController.text) {
                  return 'Mật khẩu không trùng khớp';
                } else {
                  return null;
                }
              },
              controller: confirmPasswordController,
              decoration: InputDecoration(
                  hintStyle: const TextStyle(color: ColorPallete.mainColor),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  constraints:
                      const BoxConstraints(maxHeight: 30, minHeight: 20),
                  hintText: 'Repeat Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'OTP code expires later ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: secondsLeft.toString(),
                    style: const TextStyle(
                      color: Color(0xFF5FB950),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const TextSpan(
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
            const SizedBox(
              height: 5,
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String? result =
                          await UserDataServices.sendNewPasswordByOTP(
                              otpController.text, passwordController.text);
                      print(result);
                      if (result == null) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(content: Text('Password changed successfully!')));
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(result)));
                      }

                    }
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
      }),
    );
  }
}
