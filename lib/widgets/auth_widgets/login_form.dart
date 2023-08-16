import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store/constants/color_const.dart';
import 'package:mobile_store/widgets/custom_input_decoration.dart';
import 'package:mobile_store/widgets/custom_text_form_field.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 74,
            ),
            SizedBox(
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
            SizedBox(
              height: 47,
              child: TextFormField(
                decoration: CustomInputDecoration(),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            CustomTextFormField.normal(),
            SizedBox(
              height: 18,
            ),
            SizedBox(
              height: 47,
              child: TextFormField(
                decoration: CustomInputDecoration(),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            SizedBox(
              height: 47,
              width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPallete.mainColor)),
            )
          ],
        ),
      ),
    );
  }
}