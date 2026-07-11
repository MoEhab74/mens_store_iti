import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mens_store/core/utils/service_locator.dart';
import 'package:mens_store/features/home/cubits/categories/state.dart';
import 'package:mens_store/features/home/repo/home_repo.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitialState());

  // Get categories from HomeRepo using service locator
  Future<void> fetchAllCategories() async {
    emit(CategoriesLoadingState());

    final result = await locator<HomeRepo>().getAllCategories();

    result.fold(
      // On failure ( left )
      (error) => emit(CategoriesFailureState(error)),
      // On success ( right )
      (categories) => emit(CategoriesSuccessState(categories)),
    );
  }
}
