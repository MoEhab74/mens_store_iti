import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mens_store/features/cart/data/repo/cart_repo.dart';
import 'package:mens_store/features/cart/presentation/cubit/cart_states.dart';
import 'package:mens_store/core/utils/service_locator.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitial());
  Future<void> getUserCart() async {
    final cartRepo = locator<CartRepo>();
    emit(GetCartLoading());
    final result = await cartRepo.getUserCart();
    result.fold(
      (error) => emit(GetCartError(error)),
      (carts) => emit(GetCartSuccess(carts)),
    );
  }
}