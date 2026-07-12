import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mens_store/core/utils/service_locator.dart';
import 'package:mens_store/features/account/data/repo/addresses_repo.dart';
import 'package:mens_store/features/account/cubits/addresses_state.dart';

class AddressesCubit extends Cubit<AddressesState> {
  AddressesCubit() : super(AddressesInitial());
  Future<void> getAllAddresses() async {
    emit(AddressesLoading());
    final result = await locator<AddressesRepo>().getAllAddresses();
    result.fold(
      (error) => emit(AddressesError(error: error)),
      (addresses) => emit(AddressesSuccess(addresses: addresses)),
    );
  }
}