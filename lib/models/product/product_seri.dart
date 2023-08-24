class Seri {
  final int id;
  final String name;
  final bool status;
  Seri({
    required this.id,
    required this.name,
    required this.status,

  });

  factory Seri.fromJson(Map<String, dynamic> json) {
    return Seri(id: json["id"], name: json["name"], status: json["status"]);
  }
}