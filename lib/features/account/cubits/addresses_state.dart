import 'package:mens_store/features/account/data/models/addresses_model.dart';

class AddressesState {}

class AddressesInitial extends AddressesState {}

class AddressesLoading extends AddressesState {}

class AddressesSuccess extends AddressesState {
  final List<BranchModel> addresses;
  AddressesSuccess({required this.addresses});
}

class AddressesError extends AddressesState {
  final String error;
  AddressesError({required this.error});
}
