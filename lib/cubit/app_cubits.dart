import 'package:bloc/bloc.dart';
import 'package:mobile_store/models/product.dart';
import 'package:mobile_store/pages/home_page.dart';
import 'package:mobile_store/services/product_data.dart';

import 'app_cubit_states.dart';

class AppCubits extends Cubit<CubitsStates> {
  AppCubits({required this.data}) : super(InitialState()){
    emit(state);
  }
  final ProductData data;
  late final products;
  void getData() async {
    try{
      emit(LoadingState());
      products = await data.getProduct();
      emit(LoadedState(products));
    } catch(e) {

    }
  }

  detailPage(Product data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(products));
  }
}