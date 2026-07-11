import 'package:mens_store/features/home/models/product_model.dart';

// List of categories
List<Category> categoriesModelFromJson(List<dynamic> categoriesJson) {
  return [
    Category(id: 0, name: 'All'),
    ...List<Category>.from(categoriesJson.map((x) => Category.fromJson(x)))
  ];
}

  // Traditional version (same functionality)

  // List<String> categoriesModelFromJsonTraditional(categoriesJson) {
  //   List<String> categories = [];
  //   categories.add('All');
  //   for (var category in categoriesJson) {
  //     categories.add(category);
  //   }
  //   return categories;
  // }


