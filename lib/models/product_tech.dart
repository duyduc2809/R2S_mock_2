class ProductTech {
  final int id;
  final String name;
  final String? info;
  final bool? primary;
  final TechnicalDTO technicalDTO;
  ProductTech(
      {required this.id, 
      required this.name, 
      required this.info, 
      required this.primary, 
      required this.technicalDTO});

  factory ProductTech.fromJson(Map<String, dynamic> json) {
    final technicalDTO = TechnicalDTO.fromJson(json['technicalDTO']);
    return ProductTech(
        id: json["id"], name: json["name"],
        info: json['info'],
        primary: json['primary'], 
        technicalDTO: technicalDTO);
  }
}

class TechnicalDTO {
  final int id;
  final String name;
  TechnicalDTO({required this.id, required this.name});
  factory TechnicalDTO.fromJson(Map<String, dynamic> json) {
    return TechnicalDTO(id: json['id'], name: json['name']);
  }
}
