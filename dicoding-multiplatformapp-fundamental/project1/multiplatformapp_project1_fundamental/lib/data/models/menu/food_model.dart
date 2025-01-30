class FoodModel {
  final String name;

  FoodModel({
    required this.name,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      name: json["name"],
    );
  }
}
