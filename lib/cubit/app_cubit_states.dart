import 'package:equatable/equatable.dart';
import 'package:mobile_store/models/product.dart';

import '../models/user.dart';

abstract class CubitStates extends Equatable {}



class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomePageState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UserLoadedState extends CubitStates {
  UserLoadedState(this.user);

  final User user;

  @override
  // TODO: implement props
  List<Object> get props => [user];
}

class DetailProductState extends CubitStates {
  List<Object> get props => [];
}

class InformationPageState extends CubitStates {
  List<Object> get props => [];
}

class CartPageState extends CubitStates {
  List<Object> get props => [];
}

class CartState extends CubitStates {
  List<Object> get props => [];

}


