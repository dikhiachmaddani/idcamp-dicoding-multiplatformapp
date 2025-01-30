class DrinkModel {
  final String name;

  DrinkModel({
    required this.name,
  });

  factory DrinkModel.fromJson(Map<String, dynamic> json) {
    return DrinkModel(
      name: json["name"],
    );
  }
}
