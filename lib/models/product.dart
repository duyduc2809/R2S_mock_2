class Product {
   int? id;
   String? name;
   double? price;
   String? imageDTOs;
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