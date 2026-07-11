import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mens_store/core/utils/service_locator.dart';
import 'package:mens_store/features/home/cubits/products/state.dart';
import 'package:mens_store/features/home/repo/home_repo.dart';

class ProductSCubit extends Cubit<ProductsState> {
  ProductSCubit() : super(ProductsInitialState());

  Future<void> getAllProducts() async {
    emit(ProductsLoadingState());

    final result = await locator<HomeRepo>().getAllProducts();

    result.fold(
      (error) => emit(ProductsFailureState(error)),
      (products) => emit(ProductsSuccessState(products)),
    );
  }

  Future<void> getProductsByCategory(int categoryId) async {
    emit(ProductsLoadingState());

    final result = await locator<HomeRepo>().getProductsByCategory(
      categoryId,
    );

    result.fold(
      (error) => emit(ProductsFailureState(error)),
      (products) => emit(ProductsSuccessState(products)),
    );
  }
}
