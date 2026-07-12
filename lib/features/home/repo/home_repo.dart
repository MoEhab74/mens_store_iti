import 'package:dartz/dartz.dart';
import 'package:mens_store/core/api/api_end_points.dart';
import 'package:mens_store/core/api/dio_helper.dart';
import 'package:mens_store/features/home/models/categories_model.dart';
import 'package:mens_store/features/home/models/product_model.dart';

class HomeRepo {
  final DioHelper _dioHelper;
  HomeRepo(this._dioHelper);
  Future<Either<String, List<ProductModel>>> getAllProducts() async {
    List<ProductModel> products;
    final response = await _dioHelper.getRequest(ApiEndPoints.getProducts);
    if (response.isSuccess) {
      products = productModelFromJson(response.data);
      return Right(products);
    } else {
      final String msg =
          response.errorMessage ??
          'Request failed (status: ${response.statusCode ?? 'unknown'})';
      return Left(msg);
    }
  }
  // Get all categories
  
  Future<Either<String, List<Category>>> getAllCategories() async {
    List<Category> categories;
    final response = await _dioHelper.getRequest(ApiEndPoints.getAllCategories);
    if (response.isSuccess) {
      categories = categoriesModelFromJson(response.data);
      return Right(categories);
    } else {
      final String msg =
          response.errorMessage ??
          'Request failed (status: ${response.statusCode ?? 'unknown'})';
      return Left(msg);
    }
  }

  // Get Products by Category

  Future<Either<String, List<ProductModel>>> getProductsByCategory(
    int categoryId,
  ) async {
    List<ProductModel> productsCategory;
    final response = await _dioHelper.getRequest(
      "${ApiEndPoints.getProducts}/?categoryId=$categoryId",
    );
    if (response.isSuccess) {
      productsCategory = productModelFromJson(response.data);
      return Right(productsCategory);
    } else {
      final String msg =
          response.errorMessage ??
          'Request failed (status: ${response.statusCode ?? 'unknown'})';
      return Left(msg);
    }
  }
}
