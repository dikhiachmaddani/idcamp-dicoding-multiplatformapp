class CategoriesModel {
  final String name;

  CategoriesModel({
    required this.name,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      name: json["name"],
    );
  }
}
