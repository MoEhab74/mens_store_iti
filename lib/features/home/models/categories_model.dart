class Category {
  int? id;
  String? name;
  String? slug;
  String? image;
  String? creationAt;
  String? updatedAt;

  Category({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'image': image,
      'creationAt': creationAt,
      'updatedAt': updatedAt,
    };
  }
}


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


