import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/cubit/app_cubit_states.dart';
import 'package:mobile_store/cubit/auth_cubit/auth_cubits_state.dart';
import 'package:mobile_store/pages/navpages/main_page.dart';
import 'package:mobile_store/pages/register_page.dart';
import 'package:mobile_store/pages/login_page.dart';
import '../../constants/size_config.dart';
import '../app_cubits.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is SignInState) {
            return const LoginScreen();
          } else if (state is RegisterState) {
            return const RegisterScreen();
          } else if (state is HomePageState ||
              state is DetailProductState ||
              state is CartPageState ||
              state is InformationPageState ||
              state is ProductReviewState) {
            return const MainPage();
          } else if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
