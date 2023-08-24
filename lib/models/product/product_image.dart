class Image {
  final int id;
  final String name;
  Image({
    required this.id,
    required this.name,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(id: json["id"], name: json["name"]);
  }
}