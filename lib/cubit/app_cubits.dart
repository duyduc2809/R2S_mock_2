import 'package:bloc/bloc.dart';
import 'package:mobile_store/cubit/app_cubit_states.dart';
import 'package:mobile_store/cubit/auth_cubit/auth_cubits_state.dart';
import 'package:mobile_store/pages/home_page.dart';
import 'package:mobile_store/pages/login_page.dart';
import 'package:mobile_store/services/user_data_services.dart';

import '../models/user.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits() : super(InitialState()) {
    loginPage();
  }

  loginPage() {
    emit(SignInState());
  }

  homePage() {
    emit(HomePageState());
  }

  Future<bool> login(User user) async {
    final result = await UserDataServices.loginUser(user);
    emit(LoadingState());
    if (result == false) {
      emit(SignInState());
    } else {
      emit(HomePageState());
    }
    print(result);
    return result;
  }

  register(User user) async {
    final result = await UserDataServices.createUser(user);
    emit(LoadingState());
    emit(RegisterState());
    return result;
  }

  registerPage() {
    emit(RegisterState());
  }
}
