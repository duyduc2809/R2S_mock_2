class ProductTech {
  final int? id;
  final Technical? technical;
  final String? info;
  final bool? primary;

  ProductTech({
    this.id,
    this.technical,
    this.info,
    this.primary});

  factory ProductTech.fromJson(Map<String, dynamic> json) {
    return ProductTech(
      id: json["id"],
      technical: Technical.fromJson(json["technicalDTO"]),
      info: json["info"],
      primary: json["primary"],
    );
  }
}

class Technical {
  final int? id;
  final String? name;

  Technical({this.id,this.name,});

  factory Technical.fromJson(Map<String, dynamic> json) {
    return Technical(
        id: json["id"],
        name: json["name"]
    );
  }
}