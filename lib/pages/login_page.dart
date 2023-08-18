import 'package:flutter/material.dart';
import 'package:mobile_store/constants/size_config.dart';

import '../widgets/auth_widgets/login_form.dart';
import '../widgets/custom_app_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'Mobile Store',
        logged: false,
      ),
      body: const SingleChildScrollView(child: LoginWidget()),
    );
  }
}
