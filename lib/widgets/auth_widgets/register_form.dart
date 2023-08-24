import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/constants/color_const.dart';
import 'package:mobile_store/models/user.dart';
import 'package:mobile_store/services/user_data_services.dart';
import 'package:mobile_store/widgets/custom_input_decoration.dart';
import 'package:mobile_store/validator.dart';

import '../../constants/dimension_const.dart';
import '../../constants/size_config.dart';
import '../../cubit/app_cubits.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.086,
            ),
            const SizedBox(
              width: 212,
              height: 55,
              child: Text(
                'REGISTER',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorPallete.mainColor,
                  fontSize: 32,
                  fontFamily: 'Kreon',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            TextFormField(
              decoration: CustomInputDecoration(hintText: 'User name'),
              controller: userNameController,
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Please enter user name';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: spaceBetweenField,
            ),
            TextFormField(
              decoration: CustomInputDecoration(hintText: 'Email'),
              controller: emailController,
              validator: (value) {
                return Validator.emailValidator(value);
              },
            ),
            const SizedBox(
              height: spaceBetweenField,
            ),
            TextFormField(
              decoration: CustomInputDecoration(hintText: 'Full name'),
              controller: fullNameController,
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Please enter full name';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: spaceBetweenField,
            ),
            TextFormField(
              obscureText: true,
              decoration: CustomInputDecoration(hintText: 'Password'),
              controller: passwordController,
              validator: (value) {
                return Validator.passwordValidator(value);
              },
            ),
            const SizedBox(
              height: spaceBetweenField,
            ),
            TextFormField(
              obscureText: true,
              decoration: CustomInputDecoration(hintText: 'Repeat password'),
              controller: confirmPasswordController,
              validator: (value) {
                return Validator.confirmPasswordValidator(
                    value, passwordController);
              },
            ),
            const SizedBox(
              height: spaceBetweenField,
            ),
            SizedBox(
              height: 47,
              width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final user = User(
                          email: emailController.text,
                          userName: userNameController.text,
                          fullName: fullNameController.text,
                          password: passwordController.text);
                      final result = await BlocProvider.of<AppCubits>(context)
                          .register(user);

                      if (result == null) {
                        if (mounted) {
                          _dialogBuilder(context);
                          emailController.text = '';
                          userNameController.text = '';
                          fullNameController.text = '';
                          passwordController.text = '';
                          confirmPasswordController.text = '';
                        }
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(result)));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPallete.mainColor),
                  child: const Text('Sign Up')),
            ),
            const SizedBox(
              height: spaceBetweenField,
            ),
            InkWell(
              onTap: () {
                BlocProvider.of<AppCubits>(context).loginPage();
              },
              child: const Text.rich(TextSpan(
                  text: "Already have an account? ",
                  children: [
                    TextSpan(
                        text: 'Login',
                        style: TextStyle(color: ColorPallete.yellowColor))
                  ])),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    int secondsLeft = 60;
    late Timer timer;
    bool isCounting = false;

    void startTimer(setState) {
      if (!isCounting) {
        isCounting = true; // Đánh dấu đã bắt đầu đếm ngược
        timer = Timer.periodic(Duration(seconds: 1), (timer) {
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

    return showDialog(
        // barrierDismissible: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            startTimer(setState);
            return Dialog(
              child: Container(
                height: 190,
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
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.50,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      child: const Center(
                          child: Text(
                        'VERIFIED EMAIL',
                        style: TextStyle(
                            color: ColorPallete.mainColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      )),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 30),
                        width: double.maxFinite,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextFormField(
                              controller: otpController,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 10),
                                  constraints: const BoxConstraints(
                                      maxHeight: 30, minHeight: 20),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: double.maxFinite,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${otpController.text.length}/4',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                      ("Sent OTP via email: ${secondsLeft.toString()}s"))
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                final result =
                                    await UserDataServices.sendActiveOTP(
                                        otpController.text);
                                if (result == null && mounted) {
                                  secondsLeft = 0;
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Account created successfully!")));
                                } else if (result != null && mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(result)));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  fixedSize: const Size(167, 20),
                                  backgroundColor: ColorPallete.mainColor),
                              child: const Text('Verified Email'),
                            )
                          ],
                        ))),
                  ],
                ),
              ),
            );
          });
        });
  }
}
