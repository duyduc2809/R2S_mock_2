import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/constants/color_const.dart';
import 'package:mobile_store/constants/dimension_const.dart';
import 'package:mobile_store/constants/size_config.dart';
import 'package:mobile_store/widgets/custom_input_decoration.dart';
import 'package:mobile_store/widgets/custom_text_form_field.dart';

import '../../cubit/app_cubits.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
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
                'LOGIN',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorPallete.mainColor,
                  fontSize: 32,
                  fontFamily: 'Kreon',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: CustomTextFormField.normal(hintText: 'User Name'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: CustomTextFormField.normal(hintText: 'Password'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10, bottom: kDefaultPadding),
              child: SizedBox(
                height: 47,
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPallete.mainColor)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _rememberMe = !_rememberMe;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _rememberMe
                            ? const Icon(
                          Icons.radio_button_checked,
                          size: 30,
                          color: Colors.black,
                        )
                            : Icon(
                          Icons.circle,
                          size: 30,
                          color: Colors.grey.shade300,
                        ),
                        Text(' Remember me')
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text('Forgot password?'),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Opacity(
                    opacity: 0.50,
                    child: Container(
                      height: 1,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.25,
                            strokeAlign: BorderSide.strokeAlignCenter,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Opacity(
                    opacity: 0.5,
                    child: Text(
                      'or',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 13),
                    ),
                  ),
                ),
                Expanded(
                  child: Opacity(
                    opacity: 0.50,
                    child: Container(
                      height: 1,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.25,
                            strokeAlign: BorderSide.strokeAlignCenter,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Text(
              'Sign in using',
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/img/fb_icon.png'),
                SizedBox(
                  width: 11,
                ),
                Image.asset('assets/img/gg_icon.png'),
              ],
            ),
            SizedBox(
              height: 27,
            ),
            InkWell(
              onTap: () {
                BlocProvider.of<AppCubits>(context).registerPage();
              },
              child: Text.rich(TextSpan(
                  text: "Don't have an account? ",
                  children: [
                    TextSpan(
                        text: 'Register',
                        style: TextStyle(color: ColorPallete.yellowColor))
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
