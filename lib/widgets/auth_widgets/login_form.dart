import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/constants/color_const.dart';
import 'package:mobile_store/constants/dimension_const.dart';
import 'package:mobile_store/constants/size_config.dart';
import 'package:mobile_store/models/user.dart';
import 'package:mobile_store/services/user_data_services.dart';
import 'package:mobile_store/widgets/custom_input_decoration.dart';
import 'package:mobile_store/widgets/custom_text_form_field.dart';

import '../../cubit/app_cubits.dart';
import 'forgot_password_widgets.dart';

class CheckBoxState {}

class LoadingCheckBoxState extends CheckBoxState {}

class SuccessCheckBoxState extends CheckBoxState {
  bool isChecked = false;

  SuccessCheckBoxState(this.isChecked);
}

class CheckBoxCubit extends Cubit<CheckBoxState> {
  bool isChecked = defaultCheck;

  CheckBoxCubit() : super(SuccessCheckBoxState(defaultCheck));

  static bool get defaultCheck => false;

  _onChanged() {
    emit(LoadingCheckBoxState());
    isChecked = !isChecked;
    emit(SuccessCheckBoxState(isChecked));
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  final appCubit = AppCubits();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CheckBoxCubit>(
      create: (context) => CheckBoxCubit(),
      child: Padding(
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
                child: TextFormField(
                    validator: (value) {
                      if (value == '' || value == null) {
                        print('object');
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    decoration: CustomInputDecoration(hintText: 'Email'),
                    controller: emailController),
              ),
              const SizedBox(
                height: spaceBetweenField,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: TextFormField(
                    validator: (value) {
                      if (value == '' || value == null) {
                        print('object');
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: CustomInputDecoration(hintText: 'Password'),
                    controller: passwordController),
              ),
              const SizedBox(
                height: spaceBetweenField,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10, bottom: kDefaultPadding),
                child: SizedBox(
                  height: 47,
                  width: double.maxFinite,
                  child: BlocBuilder<CheckBoxCubit, CheckBoxState>(
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final user = User(
                                  email: emailController.text,
                                  password: passwordController.text);
                              // print('object $_rememberMe');
                              final result = await BlocProvider.of<AppCubits>(
                                      context)
                                  .login(
                                      user,
                                      BlocProvider.of<CheckBoxCubit>(context)
                                          .isChecked);
                              if (result == false) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Failed')));
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorPallete.mainColor),
                          child: const Text('Login'));
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: BlocBuilder<CheckBoxCubit, CheckBoxState>(
                  builder: (context, state) {
                    if (state is SuccessCheckBoxState) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              context.read<CheckBoxCubit>()._onChanged();
                              _rememberMe = state.isChecked;
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                state.isChecked
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
                                const Text(' Remember me')
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => ForgotPasswordWidget.displayDialog(
                                context: context,
                                content:
                                    ForgotPasswordWidget.enterEmail(context)),
                            child: const Text('Forgot password?'),
                          )
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
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
              const SizedBox(
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
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/img/fb_icon.png'),
                  const SizedBox(
                    width: 11,
                  ),
                  Image.asset('assets/img/gg_icon.png'),
                ],
              ),
              const SizedBox(
                height: 27,
              ),
              InkWell(
                onTap: () {
                  BlocProvider.of<AppCubits>(context).registerPage();
                },
                child: const Text.rich(TextSpan(
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
      ),
    );
  }
}
