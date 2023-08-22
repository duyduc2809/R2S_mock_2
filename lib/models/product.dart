class Product {
  final int? id;
  final String? name;
  final double? price;
  final String? imageDTOs;
  Product({
     this.id,
     this.name,
     this.imageDTOs,
     this.price
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json['name'],
      imageDTOs: json['imageDTOs'],
      price: json['price']);
  }
}