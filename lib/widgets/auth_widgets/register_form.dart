import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/constants/color_const.dart';
import 'package:mobile_store/constants/dimension_const.dart';
import 'package:mobile_store/widgets/custom_input_decoration.dart';
import 'package:mobile_store/widgets/custom_text_form_field.dart';

import '../../constants/size_config.dart';
import '../../cubit/app_cubits.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final _formKey = GlobalKey<FormState>();

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
            CustomTextFormField.normal(hintText: 'User Name'),
            CustomTextFormField.normal(hintText: 'Email'),
            CustomTextFormField.normal(hintText: 'Full Name'),
            CustomTextFormField.normal(hintText: 'Password'),
            CustomTextFormField.normal(hintText: 'Repeat password'),
            SizedBox(
              height: 47,
              width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPallete.mainColor)),
            ),
            const SizedBox(
              height: 18,
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
}
