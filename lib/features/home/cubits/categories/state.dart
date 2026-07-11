import 'package:mens_store/features/home/models/product_model.dart';

abstract class CategoriesState {}

class CategoriesInitialState extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesSuccessState extends CategoriesState {
  final List<Category> categories;

  CategoriesSuccessState(this.categories);
}

class CategoriesFailureState extends CategoriesState {
  final String errorMessage;

  CategoriesFailureState(this.errorMessage);
}
