class Product {
  String name;
  double price;
  String img;
  Product({
    required this.name,
    required this.img,
    required this.price
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      img: json['img'],
      price: json['price']);
  }
}