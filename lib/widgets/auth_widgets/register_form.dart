import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/constants/color_const.dart';
import 'package:mobile_store/models/user.dart';
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

                      if (result == true) {
                        emailController.text = '';
                        userNameController.text = '';
                        fullNameController.text = '';
                        passwordController.text = '';
                        confirmPasswordController.text = '';
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(result == false
                              ? 'Create Failed!'
                              : 'Account created successfully')));
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
}
