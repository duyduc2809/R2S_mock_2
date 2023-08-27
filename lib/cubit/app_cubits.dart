import 'package:bloc/bloc.dart';

import 'package:mobile_store/cubit/app_cubit_states.dart';
import 'package:mobile_store/cubit/auth_cubit/auth_cubits_state.dart';

import 'package:mobile_store/services/hive_helpers.dart';
import 'package:mobile_store/services/user_data_services.dart';

import '../models/user.dart';

class AppCubits extends Cubit<CubitStates> {
  static late User userData;
  UserDataServices dataServices;
  AppCubits({required this.dataServices}) : super(InitialState()) {
    emit(LoadingState());
    init();
  }

  void getUserData() async {
    try {
      emit(LoadingState());
      userData = await dataServices.getUser();
      emit(HomePageState());
    } catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> init() async {
    final rememberMe = await HiveHelper.loadRememberMe();
    if (rememberMe == true) {
      getUserData();
      return homePage();
    } else {
      return loginPage();
    }
  }

  loginPage() {
    emit(SignInState());
  }

  homePage() {
    emit(HomePageState());
  }

  //hàm xử lý đăng nhập
  Future<String?> login(User user, bool rememberMe) async {
    final result = await UserDataServices.loginUser(user, rememberMe);
    emit(LoadingState());
    if (result != null) {
      emit(SignInState());
    } else {
      emit(LoadingState());
      getUserData();
    }
    print(result);
    return result;
  }

  //hàm xử lý đăng ký
  Future<String?> register(User user) async {
    final result = await UserDataServices.createUser(user);
    emit(LoadingState());
    emit(RegisterState());
    return result;
  }

  registerPage() {
    emit(RegisterState());
  }

  detailPage(product) {

    emit(DetailProductState(product: product));
  }

  informationPage() {
    emit(InformationPageState());
  }

  cartPage() {
    emit(CartPageState());
  }
}
