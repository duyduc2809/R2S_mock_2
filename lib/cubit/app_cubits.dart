import 'package:bloc/bloc.dart';
import 'package:mobile_store/cubit/app_cubit_states.dart';
import 'package:mobile_store/cubit/auth_cubit/auth_cubits_state.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits() : super(InitialState()) {
    loginPage();
  }

  loginPage() {
    emit(SignInState());
  }

  registerPage() {
    emit(RegisterState());
  }
}
