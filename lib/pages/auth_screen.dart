import 'package:flutter/material.dart';
import 'package:mobile_store/constants/size_config.dart';

import '../widgets/auth_widgets/login_form.dart';
import '../widgets/custom_app_bar.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'Mobile Store',
        logged: false,
      ),
      body: LoginWidget(),
    );
  }
}
