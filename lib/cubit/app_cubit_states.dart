import 'package:equatable/equatable.dart';
import 'package:mobile_store/models/product.dart';

abstract class CubitsStates extends Equatable {}

class InitialState extends CubitsStates {
  @override
  List<Object> get props => [];

}

class LoadingState extends CubitsStates {
  @override
  List<Object> get props => [];

}

class LoadedState extends CubitsStates {
  LoadedState(this.products);
  final List<Product> products;
  @override
  List<Object> get props => [products];

}

class DetailState extends CubitsStates {
  DetailState(this.product);
  final Product product;
  @override
  List<Object> get props => [product];

}