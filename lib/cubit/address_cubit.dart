import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/cubit/state/address_state.dart';
import 'package:mobile_store/services/address_data_service.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressRepository _addressRepository;

  AddressCubit(this._addressRepository) : super(InitialAddressState());

  Future<void> getAllAddresses() async {
    emit(LoadingAddressState());
    try {
      var result = await _addressRepository.getAllAddresses();
      emit(SuccessLoadingAddress(result));
    } catch (e) {
      emit(FailureAddressState(e.toString()));
    }
  }
}
