import 'package:bloc/bloc.dart';
import 'package:mobile_store/cubit/app_cubit_states.dart';
import 'package:mobile_store/cubit/auth_cubit/auth_cubits_state.dart';
import 'package:mobile_store/services/user_data_services.dart';

import '../models/user.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits() : super(InitialState()) {
    loginPage();
  }

  loginPage() {
    emit(SignInState());
  }

  void login(User user) async {
    emit(LoadingState());
    try {
      await UserDataServices.loginUser(user);
      print('ok');

    } catch (e) {
      print(e);
    }
  }

  registerPage() {
    emit(RegisterState());
  }
}
