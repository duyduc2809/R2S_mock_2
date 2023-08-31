class ColorDTO {
  final int id;
  final String name;
  final bool status;
  ColorDTO({
    required this.id,
    required this.name,
    required this.status,

  });

  factory ColorDTO.fromJson(Map<String, dynamic> json) {
    return ColorDTO(id: json["id"], name: json["name"], status: json["status"]);
  }
}