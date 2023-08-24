class Manufacturer {
  final int id;
  final String name;
  Manufacturer({
    required this.id,
    required this.name,
  });

  factory Manufacturer.fromJson(Map<String, dynamic> json) {
    return Manufacturer(id: json["id"], name: json["name"]);
  }
}