import 'package:flutter/material.dart';
import 'package:mobile_store/constants/size_config.dart';

import '../widgets/auth_widgets/login_form.dart';
import '../widgets/auth_widgets/register_form.dart';
import '../widgets/custom_app_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'Mobile Store',
        logged: false,
      ),
      body: const SingleChildScrollView(child: RegisterWidget()),
    );
  }
}
