class Stories {
  String id;
  String name;
  String description;
  String photoUrl;
  String createdAt;
  double lat;
  double lon;
  Stories({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.createdAt,
    required this.lat,
    required this.lon,
  });

  factory Stories.fromJson(Map<String, dynamic> json) {
    return Stories(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      photoUrl: json["photoUrl"],
      createdAt: json["createdAt"],
      lat: json["lat"] != null ? json["lat"].toDouble() : 0.0,
      lon: json["lon"] != null ? json["lon"].toDouble() : 0.0,
    );
  }
}
