import 'package:mobile_store/models/address.dart';

abstract class AddressState {}

class InitialAddressState extends AddressState {}

class LoadingAddressState extends AddressState {}

class FailureAddressState extends AddressState {
  final String errorMessage;
  FailureAddressState(this.errorMessage);
}

class SuccessLoadingAddress extends AddressState {
  final List<Address> addresses;
  SuccessLoadingAddress(this.addresses);
}

class SuccessAddAddress extends AddressState {
  final Address address;
  SuccessAddAddress(this.address);
}

class SuccessDeleteAddress extends AddressState {}

class SuccessUpdateAddress extends AddressState {}
